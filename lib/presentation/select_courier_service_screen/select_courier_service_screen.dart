import 'package:elbara_express/core/utils/color_constant.dart';
import 'package:elbara_express/core/utils/size_utils.dart';
import 'package:elbara_express/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbara_express/widgets/custom_button.dart';


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
  String selectedButton = ''; // Ajout de la variable selectedButton

  //late Map<String, dynamic> DataInfos;
  Map<String, dynamic>? DataInfos;
  
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
    
  }

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Lorsque toutes les données sont collectées sur l'écran 2
  void saveCommande() {
    // Collectez toutes les données de l'écran 2
    Map<String, dynamic> screen2Data = {
      'status' : 'en cours',
      'selectedVehicle': selectedVehicle,
      //'selectedButton': selectedButton,
      // Autres données de l'écran 2
    };

    // Combinez les données de l'écran 1 et de l'écran 2
    Map<String, dynamic> combinedData = {...?DataInfos, ...screen2Data};

    // Enregistrez toutes ces données dans la collection Firestore
    _firestore.collection('commande').add(combinedData).then((value) {
      print('Données enregistrées avec succès');
      // Naviguez vers l'écran suivant si nécessaire
    }).catchError((error) {
      print('Erreur lors de lenregistrement des données: $error');
      // Gérez les erreurs ici si nécessaire
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prix & Mode de payement',
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
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 10),
                        Text('Moto'),
                      ],
                    ),
                    Text('500'),
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
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 10),
                        Text('Tricycle'),
                      ],
                    ),
                    Text('800'),
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
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 10),
                        Text('Camion'),
                      ],
                    ),
                    Text('1500'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40),

          // Nouvelle rangée de boutons personnalisés
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonSelect(
                buttonText: 'Payer Maintenant',
                isSelected: selectedButton == 'now',
                onPressed: () {
                  setState(() {
                    selectedButton = 'now';
                  });
                },
              ),
              SizedBox(width: 20),
              CustomButtonSelect(
                buttonText: 'Payer à la Livraison',
                isSelected: selectedButton == 'delivery',
                onPressed: () {
                  setState(() {
                    selectedButton = 'delivery';
                  });
                },
              ),
            ],
          ),
        ]
      ),
      // bottomNavigationBar: CustomButton(
      //   buttonText: 'Suivant',
      //   isSelected: true,
      //   onPressed: () {
      //     saveCommande();
      //     // if (selectedButton == 'now') {
      //     //   this.selectNow(); // Utilisez this pour appeler les méthodes de classe
      //     // } else if (selectedButton == 'delivery') {
      //     //   this.selectDelivery(); // Utilisez this pour appeler les méthodes de classe
      //     // } else {
      //     //   printError(info: 'Veuillez choisir un mode de paiement');
      //     // }
      //   },
      // ),
      bottomNavigationBar: CustomButton(
                    height: getVerticalSize(54),
                    text: "Suivant".tr,
                    margin: getMargin(left: 16, right: 16, bottom: 40),
                    onTap: () {
                    //saveCommande();
                    if (selectedButton == 'now') {
                      this.selectNow(); // Utilisez this pour appeler les méthodes de classe
                    } else if (selectedButton == 'delivery') {
                      this.selectDelivery(); // Utilisez this pour appeler les méthodes de classe
                    } else {
                      printError(info: 'Veuillez choisir un mode de paiement');
                    }
                  },
                    )
    );
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
      ),
    );
  }
}
