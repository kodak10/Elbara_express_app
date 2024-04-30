import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbara_express/core/utils/color_constant.dart';
import 'package:elbara_express/core/utils/image_constant.dart';
import 'package:elbara_express/core/utils/size_utils.dart';
import 'package:elbara_express/presentation/payment_method_screen/controller/payment_method_controller.dart';
import 'package:elbara_express/presentation/payment_method_screen/models/payment_method_model.dart';
import 'package:elbara_express/routes/app_routes.dart';
import 'package:elbara_express/theme/app_decoration.dart';
import 'package:elbara_express/theme/app_style.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_image_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  static const String screen1Route = '/screen1';
  static const String screen2Route = '/screen2';

  String selectedVehicle = 'Moto';
  String mode_paiement = ''; // Définir une variable pour stocker la valeur sélectionnée
  double selectedPrice = 0.0;
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

      

  //late Map<String, dynamic> DataInfos;
  Map<String, dynamic>? DataInfos;

 void _showLoadingDialog() {
  showDialog(
    context: context,
    barrierDismissible: false, // Empêcher la fermeture du modal en cliquant en dehors
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Lottie.asset(
                'assets/images/loading_1.json',
                height: 150,
                width: 150,
              ),
              ],
            ),

            // SizedBox(height: 16),
            // Text('Traitement en cours...'), // Texte de chargement
          ],
        ),
      );
    },
  );
}

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();

    // Récupérez les données transmises depuis l'écran précédent
    //Map<String, dynamic> DataInfos = Get.arguments;
    DataInfos = Get.arguments as Map<String, dynamic>;
    selectedPrice = calculatePrice("Moto", 3.0, 1.0, 1.0);
  }

// Fonction pour afficher les prix simulés pour chaque type d'engin
  void displaySimulatedPrices(double distance, double weight, double size) {
    // Liste des types d'engin
    List<String> vehicles = ['Moto', 'Tricycle', 'Camion'];

    // Calculer et afficher le prix simulé pour chaque type d'engin
    for (String vehicle in vehicles) {
      double totalPrice = calculatePrice(vehicle, distance, weight, size);
      print(
          'Prix simulé pour la livraison en $vehicle sur une distance de $distance km : $totalPrice');
    }
  }

  final User? user = FirebaseAuth.instance.currentUser;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> saveCommande() async {
  String orderId = generateOrderId();

  // Collectez toutes les données de l'écran 2
  Map<String, dynamic> screen2Data = {
    'dateRegister': date,
    'date': 57755,
    'deliveryGeoPoint': geoPoint,
    //'deliveryId': user?.uid,
    'deliveryStatus': 'pending',
    'employeeCancelNote': "",
    'geoPoint': geoPoint,
    'orderId': orderId,
    'order_confirm': true,
    'order_delivered': false,
    'order_on_delivery': false,
    'paymentMethod': 'Cash',
    'pickupOption': "delivery",
    'userId': user?.uid,
    'userImage': "",
    'userNote': "",
    'selectedVehicle': selectedVehicle,
    'price': selectedPrice,
    'status': 'accepte',
    'lieu_depart': 'Abidjan, Abobo',
    'lieu_arrive' : 'Abidjan, Cocody',

    'order_confirm_date': FieldValue.serverTimestamp(),
    'order_delivered_date' : FieldValue.serverTimestamp(),
    'order_on_delivery_date' : FieldValue.serverTimestamp(),

  };

  Map<String, dynamic> addressModel = {
    'city': 'Abidjan',
    'geoPoint': GeoPoint(5.3518078, 4.0204716),
    'mobile': '0103810998',
    'state': 'Angré',
    'street': 'Terminus 81/82',
  };

  // Combinez les données de l'écran 1 et de l'écran 2
  Map<String, dynamic> combinedData = {
    ...?DataInfos,
    ...screen2Data,
    'addressModel': addressModel,
  };

  // // Enregistrez toutes ces données dans la collection Firestore
  // _firestore.collection('orders').add(combinedData).then((value) {
  
  //  String orderId = value.id;

  // // Mettez à jour 'orderId' dans combinedData avec l'ID du document ajouté
  // combinedData['orderId'] = orderId;

  //   print('Données enregistrées avec succès');
  //   // Naviguez vers l'écran suivant si nécessaire
  // }).catchError((error) {
  //   print('Erreur lors de l\'enregistrement des données: $error');
  //   // Gérez les erreurs ici si nécessaire
  // });

 try {
  // Enregistrez toutes ces données dans la collection Firestore
  DocumentReference documentReference = await _firestore.collection('orders').add(combinedData);
    
  print('Données enregistrées avec succès avec l\'ID du document ajouté: $orderId');
  // Naviguez vers l'écran suivant si nécessaire
} catch (error) {
  print('Erreur lors de l\'enregistrement des données: $error');
  // Gérez les erreurs ici si nécessaire
}

}




  Future<void> initiatePayment(BuildContext context) async {
    // Remplacez ces valeurs par vos véritables identifiants API PayDunya
    String masterKey = 'fhRrUGWg-Upkg-0r3x-Z7DI-d8fR0aIHgxc2';
    // TEST
    //String privatekey = 'test_private_SbiMC3CevM2M7CwG9InuuKJCugA';
    //String token = 'U2VG53YZyOhonBVvKuw7';

    // PRODUCTION
    String privatekey = 'live_private_tvQxERrcZFOVXgpi3NyUckcWDDL';
    String token = 'vI7BDJAJvpWDY8Y4rjBL';

    // Point de terminaison de l'API pour initier le paiement
    //String url ='https://app.paydunya.com/sandbox-api/v1/checkout-invoice/create'; // test
    String url =
        'https://app.paydunya.com/api/v1/checkout-invoice/create'; // production

    // Payload pour initier le paiement (remplacez-le par les données réelles de votre paiement)
    Map<String, dynamic> payload = {
      "invoice": {"total_amount": selectedPrice, "description": "Livraison"},
      "store": {"name": "Elbara Express"}
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
        var paymentUrl = responseData['response_text'];

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
      // Gérez toutes les erreurs survenues pendant le processus
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur: $error'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double distance = 50.0;
    double weight = 1.0;
    double size = 1.0;
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
                      selectedPrice =
                          calculatePrice("Moto", distance, weight, size);
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
                          '${calculatePrice("Moto", distance, weight, size)} \FCFA',
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
                      selectedPrice =
                          calculatePrice("Tricycle", distance, weight, size);
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
                          '${calculatePrice("Tricycle", distance, weight, size)} \FCFA',
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
                      selectedPrice =
                          calculatePrice("Camion", distance, weight, size);
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
                          '${calculatePrice("Camion", distance, weight, size)} \FCFA',
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
                                      mode_paiement = data.title!; // Mettre à jour la valeur sélectionnée
                                    });
                                  },
                                  child: Padding(
                                    padding: getPadding(top: 8, bottom: 8),
                                    child: Container(
                                      decoration: AppDecoration.fillGray50
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder16,
                                              color:
                                                  controller.currentPayment ==
                                                          index
                                                      ? ColorConstant
                                                          .deepPurple50
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

                
                
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         padding: EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: CustomButtonSelect(
              //           buttonText: 'Payer Maintenant',
              //           isSelected: selectedButton == 'now',
              //           onPressed: () {
              //             setState(() {
              //               selectedButton = 'now';
              //             });
              //           },
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 20),
              //     Expanded(
              //       child: Container(
              //         padding: EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: CustomButtonSelect(
              //           buttonText: 'Payer à la Livraison',
              //           isSelected: selectedButton == 'delivery',
              //           onPressed: () {
              //             setState(() {
              //               selectedButton = 'delivery';
              //             });
              //           },
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ]),
        // bottomNavigationBar: CustomButton(
        //   height: getVerticalSize(54),
        //   text: "Suivant".tr,
        //   margin: getMargin(left: 16, right: 16, bottom: 40),
        //   onTap: () {
        //     if (mode_paiement == 'Payer Maintenant') {
        //       initiatePayment(context);
        //       saveCommande();
        //       // this.selectNow(); // Utilisez this pour appeler les méthodes de classe
        //     } else if (mode_paiement == 'Payer à la livraison') {
        //       saveCommande();

        //       this.selectDelivery(); // Utilisez this pour appeler les méthodes de classe
        //     } else {
        //       // Echec de l'initiation de paiement
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(
        //           content: Text('Erreur survenue'),
        //         ),
        //       );

        //       // printError(info: 'Veuillez choisir un mode de paiement');
        //     }
        //   },
        // )

        bottomNavigationBar: CustomButton(
          height: getVerticalSize(54),
          text: "Suivant".tr,
          margin: getMargin(left: 16, right: 16, bottom: 40),
          onTap: () {
            if (mode_paiement == 'Payer Maintenant') {
               _showLoadingDialog(); // Afficher le modal de chargement
              initiatePayment(context);
              saveCommande();
              // this.selectNow(); // Utilisez this pour appeler les méthodes de classe
            } else if (mode_paiement == 'Payer à la livraison') {
               _showLoadingDialog(); // Afficher le modal de chargement
              saveCommande();

              this.selectDelivery(); // Utilisez this pour appeler les méthodes de classe
            } else {
              // Echec de l'initiation de paiement
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Erreur survenue'),
                ),
              );

              // printError(info: 'Veuillez choisir un mode de paiement');
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

// Fonction pour calculer le prix en fonction de la distance, du poids et de la taille du colis
  double calculatePrice(
      String selectedVehicle, double distance, double weight, double size) {
    double basePrice = 0.0;
    double additionalCost = 0.0;

    // Déterminer le tarif de base en fonction du type de véhicule
    switch (selectedVehicle) {
      case 'Moto':
        basePrice = 5.0; // Tarif de base pour la moto
        break;
      case 'Tricycle':
        basePrice = 8.0; // Tarif de base pour le tricycle
        break;
      case 'Camion':
        basePrice = 12.0; // Tarif de base pour le camion
        break;
      default:
        basePrice = 0.0;
    }

    // Calculer les frais supplémentaires en fonction du poids et de la taille du colis
    additionalCost = (weight * 2) + (size * 3);

    // Calculer le prix total en combinant le tarif de base, les frais supplémentaires et la distance
    double totalPrice = (basePrice * distance) + additionalCost;

    return totalPrice;
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
