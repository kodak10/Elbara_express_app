import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbara_express/core/utils/color_constant.dart';
import 'package:elbara_express/core/utils/image_constant.dart';
import 'package:elbara_express/core/utils/loading.dart';
import 'package:elbara_express/core/utils/size_utils.dart';
import 'package:elbara_express/presentation/payment_method_screen/controller/payment_method_controller.dart';
import 'package:elbara_express/presentation/payment_method_screen/models/payment_method_model.dart';
import 'package:elbara_express/routes/app_routes.dart';
import 'package:elbara_express/theme/app_decoration.dart';
import 'package:elbara_express/theme/app_style.dart';
import 'package:elbara_express/widgets/custom_button.dart';

import 'package:elbara_express/widgets/custom_image_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

// Récupérer la date et l'heure actuelles
DateTime date = DateTime.now();

class SelectCourierServiceScreen extends StatefulWidget {
  const SelectCourierServiceScreen({Key? key}) : super(key: key);

  @override
  State<SelectCourierServiceScreen> createState() =>
      _SelectCourierServiceScreenState();
}

class _SelectCourierServiceScreenState
    extends State<SelectCourierServiceScreen> {

  bool isLoading = false; // Définissez isLoading comme un état local à l'écran 2

  late String email = '';
  late String name = '';
  late String phoneNumber = '';
  late String image = '';
  late User _currentUser;

  late String paymentUrl = "";
  late String paymentRef = "";
  late String imageUrl = "";

  String documentId = "";

  String mode_paiement =
      ''; // Définir une variable pour stocker la valeur sélectionnée
  late QrCode qrCode;
  late QrImage qrImage;

  String selectedVehicle = 'Moto';

  int selectedPrice = 0;
  int price = 0;

  GeoPoint geoPoint =
      GeoPoint(37.4219983, -122.084); // en attente de api google maps

  String generateOrderId() {
    const String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    String orderId = '';
    for (int i = 0; i < 11; i++) {
      String randomChar = chars[random.nextInt(chars.length)];
      orderId += randomChar.toUpperCase(); // Convertir en majuscule
    }
    return orderId;
  }

  Map<String, dynamic>? DataInfos;
  // Récupérer le prix depuis les données



  @override
  void initState() {
    _currentUser = FirebaseAuth.instance.currentUser!;
    _loadUserData();
    qrCode = QrCode(4, QrErrorCorrectLevel.L);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );

    super.initState();

    // Récupérer les données transmises depuis l'écran précédent
    DataInfos = Get.arguments as Map<String, dynamic>;
    price = DataInfos!['priceCalculed'];
  }

  Future<void> _loadUserData() async {
    if (_currentUser != null) {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser.uid)
          .get();
      if (userData.exists) {
        setState(() {
          email = userData['email'] ?? '';
          name = userData['displayName'] ?? '';
          phoneNumber = userData['phoneNumber'] ?? '';
          image = userData['photoURL'] ?? '';
        });
      }
    }
  }

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveCommande(String? paymentUrl) async {
    String orderId = generateOrderId();

    // Collectez toutes les données de l'écran 2
    Map<String, dynamic> screen2Data = {
      'date': date,
      'deliveryGeoPoint': geoPoint,
      'deliveryId': '',
      'deliveryStatus': 'pending',
      'employeeCancelNote': "",
      'geoPoint': geoPoint,
      'orderId': orderId,
      'order_confirm': true,
      'order_delivered': false,
      'order_on_delivery': false,
      'pickupOption': "delivery",
      'selectedVehicle': selectedVehicle,
      'status': 'accepte',
      'userNote': "",
      'order_confirm_date': FieldValue.serverTimestamp(),
      'order_delivered_date': FieldValue.serverTimestamp(),
      'order_on_delivery_date': FieldValue.serverTimestamp(),
      'userId': _currentUser.uid,
      'userName': name,
      'userPhone': phoneNumber,
      'userImage': image,
      'paymentMethod': mode_paiement,
      'price': selectedPrice
    };

    Map<String, dynamic> addressModel = {
      'geoPoint': GeoPoint(5.3518078, 4.0204716),
      'mobile': phoneNumber,
    };

    // Combinez les données de l'écran 1 et de l'écran 2
    Map<String, dynamic> combinedData = {
      ...?DataInfos,
      ...screen2Data,
      'addressModel': addressModel,
      'paymentUrl': paymentUrl, // lien qui se trouve sur le codeQr à scanner
      'paymentRef': paymentRef,
    };

    try {
      // Enregistrez toutes ces données dans la collection Firestore
      // DocumentReference documentReference =
      //     await _firestore.collection('orders').add(combinedData);

      

      //DocumentReference documentReference = await _firestore.collection('orders').doc(orderId).set(combinedData); // Utiliser l'identifiant unique comme nom de document
      await _firestore.collection('orders').doc(orderId).set(combinedData); // Utiliser l'identifiant unique comme nom de document
      
      // Récupérer l'ID du document nouvellement ajouté
      //documentId = documentReference.id;

      // Naviguez vers l'écran suivant si nécessaire
    } catch (error) {
      print('Erreur lors de l\'enregistrement des données: $error');
      // Gérez les erreurs ici si nécessaire
    }
  }

  Future<void> initiatePayment(BuildContext context) async {
        print('prix: $selectedPrice');

    // Remplacez ces valeurs par vos véritables identifiants API PayDunya
    String masterKey = 'fhRrUGWg-Upkg-0r3x-Z7DI-d8fR0aIHgxc2';

    // PRODUCTION
    String privatekey = 'live_private_tvQxERrcZFOVXgpi3NyUckcWDDL';
    String token = 'vI7BDJAJvpWDY8Y4rjBL';

    String url = 'https://app.paydunya.com/api/v1/dmp-api'; // production

    String phoneNumberWithoutPlus = phoneNumber.substring(1);

    // Payload pour initier le paiement (remplacez-le par les données réelles de votre paiement)
    Map<String, dynamic> payload = {
      "recipient_phone": phoneNumber.substring(1),
      "amount": selectedPrice,
      "support_fees": 1,
      "send_notification": 0
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'PAYDUNYA-MASTER-KEY': masterKey,
          'PAYDUNYA-PRIVATE-KEY': privatekey,
          'PAYDUNYA-TOKEN': token,
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        // Initiation de paiement réussie
        // Récupérer l'URL de paiement à partir de la réponse
        var responseData = jsonDecode(response.body);
        //var paymentUrl = responseData['response_text'];
        paymentUrl = responseData['url'];

        paymentRef = responseData['reference_number'];

        //generateQRAndUpload(context, paymentUrl);
        await saveCommande(paymentUrl);
        //await saveQRImage(context, paymentUrl, documentId);

        await Future.delayed(Duration(seconds: 1));

        selectDelivery(); // Utilisez this pour appeler les méthodes de classe


        // Ouvrir l'URL de paiement dans le navigateur par défaut
        launch(paymentUrl);
        //launchUrl(paymentUrl);
      } else {
        // Echec de l'initiation de paiement
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Echec de l\'initiation de paiement: ${response.statusCode}'),
          ),
        );
      }
    } catch (error) {
      print('${error}');
      // Gérez toutes les erreurs survenues pendant le processus
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur: $error'),
        ),
      );
    }
  }

  Future<void> initiatePaymentLivraison(BuildContext context) async {
    print('prix: $selectedPrice');
    // Remplacez ces valeurs par vos véritables identifiants API PayDunya
    String masterKey = 'fhRrUGWg-Upkg-0r3x-Z7DI-d8fR0aIHgxc2';

    // PRODUCTION
    String privatekey = 'live_private_tvQxERrcZFOVXgpi3NyUckcWDDL';
    String token = 'vI7BDJAJvpWDY8Y4rjBL';

    String url = 'https://app.paydunya.com/api/v1/dmp-api'; // production

    // Payload pour initier le paiement (remplacez-le par les données réelles de votre paiement)
    Map<String, dynamic> payload = {
      "recipient_phone": phoneNumber.substring(1),
      "amount": selectedPrice,
      "support_fees": 1,
      "send_notification": 0
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'PAYDUNYA-MASTER-KEY': masterKey,
          'PAYDUNYA-PRIVATE-KEY': privatekey,
          'PAYDUNYA-TOKEN': token,
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        // Initiation de paiement réussie
        // Récupérer l'URL de paiement à partir de la réponse
        var responseData = jsonDecode(response.body);
        //var paymentUrl = responseData['response_text'];
        paymentUrl = responseData['url'];
        paymentRef = responseData['reference_number'];

        // saveCommande(paymentUrl);
        // generateQRAndUpload(context, paymentUrl);
        await saveCommande(paymentUrl);

        // Appeler saveQRImage en passant le context actuel
        //await saveQRImage(context, paymentUrl, documentId);

        print('okay');
      } else {
        // Echec de l'initiation de paiement
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Echec de l\'initiation de paiement: ${response.statusCode}'),
          ),
        );
      }
    } catch (error) {
      // Gérez toutes les erreurs survenues pendant le processus
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur: $error'),
        ),
      );
    }
  }

  Future<void> saveQRImage(
      BuildContext context, String paymentUrl, String documentId) async {
    // Créer une clé pour le RepaintBoundary
    final boundaryKey = GlobalKey();

    // Construire le widget pour générer le QR code
    final qrImageView = QrImageView(
      data: paymentUrl,
      version: QrVersions.auto,
      size: 50.0, // Taille du code QR
    );

    // Attendre que le widget soit rendu pour capturer l'image
    final qrWidget = RepaintBoundary(
      key: boundaryKey,
      child: qrImageView,
    );


    Navigator.of(context, rootNavigator: true).push(
  PageRouteBuilder(
    opaque: false, // Rend le fond transparent
    pageBuilder: (BuildContext context, _, __) {
      return Dialog(
        elevation: 0, // Supprime l'ombre de la boîte de dialogue
        backgroundColor: Colors.transparent, // Rend le fond transparent
        child: qrWidget,
      );
    },
  ),
);


    // Attendre pendant 2 secondes avant de capturer l'image
    await Future.delayed(Duration(seconds: 2));

    // Rendre le widget hors écran
    final RenderRepaintBoundary? boundary = boundaryKey.currentContext
        ?.findRenderObject() as RenderRepaintBoundary?;

    if (boundary != null) {
      // Dessiner le QR code sur un canevas
      final image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData != null) {
        final Uint8List bytes = byteData.buffer.asUint8List();

        // Enregistrer les bytes dans Firebase Storage
        final ref = FirebaseStorage.instance.ref().child(
            'paymentQrCode/$documentId.png'); // Nom du fichier dans Firebase Storage
        await ref.putData(bytes);

        // Récupérer le lien de téléchargement de l'image
        final imageUrl = await ref.getDownloadURL();

        // // Mettre à jour le champ paymentLink dans la collection orders
        await FirebaseFirestore.instance
            .collection('orders')
            .doc(documentId)
            .update({
          'paymentQrCodeLink': imageUrl,
        });

        Navigator.pop(context);


        print('Image du code QR enregistrée avec succès. Lien : $imageUrl');
      } else {
        print('Erreur lors de la conversion du code QR en bytes.');
      }
    } else {
      print('Erreur: Impossible de trouver le RenderRepaintBoundary.');
    }

        Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Prix & Mode de paiement',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Utilisation du style en gras
            ),
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedVehicle = 'Moto';
                      selectedPrice = price;
                    });
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: selectedVehicle == 'Moto'
                            ? Colors.black
                            : Colors.transparent,
                      ),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/moto.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(width: 10),
                            Text('Moto'),
                          ],
                        ),
                        Text(
                          '$price \FCFA',
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold, // Applique le style gras
                            fontSize:
                                18, // Applique une taille de police plus grande
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedVehicle = 'Tricycle';
                      selectedPrice = (price * 2.60).toInt();
                    });
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: selectedVehicle == 'Tricycle'
                            ? Colors.black
                            : Colors.transparent,
                      ),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/tricycle.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(width: 10),
                            Text('Tricycle'),
                          ],
                        ),
                        Text(
                          '${(price * 2.60).toInt()} \FCFA',
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold, // Applique le style gras
                            fontSize:
                                18, // Applique une taille de police plus grande
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedVehicle = 'Camion';
                      selectedPrice = (price * 3.70).toInt();
                    });
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: selectedVehicle == 'Camion'
                            ? Colors.black
                            : Colors.transparent,
                      ),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/camion.png',
                              width: 80,
                              height: 80,
                            ),
                            SizedBox(width: 10),
                            Text('Camion'),
                          ],
                        ),
                        Text(
                        '${(price * 3.70).toInt()} \FCFA',
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold, // Applique le style gras
                            fontSize:
                                18, // Applique une taille de police plus grande
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              GetBuilder<PaymentMethodController>(
                init: PaymentMethodController(),
                builder: (controller) => Container(
                    width: double.maxFinite,
                    padding: getPadding(top: 21, bottom: 21),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(left: 16, right: 16),
                            child: Text("Mode de paiement".tr,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtSFProTextBold20),
                          ),
                          ListView.builder(
                            padding: getPadding(left: 16, right: 16, top: 8),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: controller.paymentMethods.length,
                            itemBuilder: (context, index) {
                              PaymentMethodModel data =
                                  controller.paymentMethods[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.setCurrentPaymentMethod(index);
                                  setState(() {
                                    mode_paiement = data
                                        .title!; // Mettre à jour la valeur sélectionnée
                                  });
                                },
                                child: Padding(
                                  padding: getPadding(top: 8, bottom: 8),
                                  child: Container(
                                    decoration: AppDecoration.fillGray50
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder16,
                                            color: controller.currentPayment ==
                                                    index
                                                ? ColorConstant.deepPurple50
                                                : ColorConstant.gray50,
                                            border: Border.all(
                                                color: controller
                                                            .currentPayment ==
                                                        index
                                                    ? ColorConstant
                                                        .deepPurple600
                                                    : ColorConstant.gray50)),
                                    child: Padding(
                                      padding: getPadding(
                                          top: 20,
                                          bottom: 20,
                                          left: 16,
                                          right: 16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(data.title!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtHeadline)
                                            ],
                                          ),
                                          CustomImageView(
                                            svgPath: controller
                                                        .currentPayment ==
                                                    index
                                                ? ImageConstant.imgEyeBlack900
                                                : ImageConstant
                                                    .imgIcRadioButton,
                                          )
                                          //ImageConstant.imgIcRadioButton,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ])),
              ),
            ]),
        
        bottomNavigationBar: CustomButton(
          height: getVerticalSize(54),
          text: "Valider".tr,
          margin: getMargin(left: 16, right: 16, bottom: 40),
          onTap: () {

            if (selectedVehicle == '') {
                        // Afficher un SnackBar si selectedD1 est null
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez sélectionner un engin'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
            }

             if (selectedPrice == 0) {
                        // Afficher un SnackBar si selectedD1 est null
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez sélectionner un engin'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
            }

            if (mode_paiement == '') {
                        // Afficher un SnackBar si selectedD1 est null
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez sélectionner le mode de payement'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
            }

           
            

            if (mode_paiement == 'Payer Maintenant') {
              Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoadingPage()),
                          );

              initiatePayment(context);
              //saveCommande(paymentUrl);
              // this.selectNow(); // Utilisez this pour appeler les méthodes de classe
            } else if (mode_paiement == 'Payer à la livraison') {
              Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoadingPage()),
                          );
              initiatePaymentLivraison(context);
              //saveCommande(paymentUrl);

              this.selectDelivery(); // Utilisez this pour appeler les méthodes de classe
            } else {
              // Echec de l'initiation de paiement
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Erreur survenue'),
                ),
              );

              printError(info: 'Veuillez choisir un mode de paiement');
            }
          },
        ));
  }

  void selectNow() {
    Get.toNamed(
      AppRoutes.paymentMethodScreen,
    );
  }

  void selectDelivery() {
    Get.toNamed(
      AppRoutes.orderSuccessScreen,
    );
  }

  // onTapArrowleft() {
  //   Get.back();
  // }
// void onTapArrowleft() {
//   Get.back();
//   if (isLoading) {
//     Navigator.of(context).pop(); // Ferme la boîte de dialogue de chargement si elle est ouverte
//   }
// }

void onTapArrowleft() {
    if (isLoading) {
      Get.until((route) => route.isFirst); // Retourne à la première route
      Navigator.of(context).pop(); // Ferme la boîte de dialogue de chargement si elle est ouverte
    } else {
      Get.back(); // Sinon, retourne simplement à l'écran précédent
    }
  }

}

// Déplacez ces méthodes en dehors de la classe CustomButton

// Définition du widget CustomButton

class CustomButtonSelect extends StatelessWidget {
  final String buttonText;
  final bool isSelected;
  final VoidCallback onPressed;

  const CustomButtonSelect({
    required this.buttonText,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: isSelected
              ? MaterialStateProperty.all(Colors.blue)
              : MaterialStateProperty.all(Colors.transparent),
        ));
  }
}
