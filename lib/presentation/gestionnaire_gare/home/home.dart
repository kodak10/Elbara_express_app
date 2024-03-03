import 'package:elbara_express/core/app_export.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomeGareScreen extends StatefulWidget {
  const HomeGareScreen({Key? key}) : super(key: key);

  @override
  State<HomeGareScreen> createState() => _HomeGareScreenState();
}

class _HomeGareScreenState extends State<HomeGareScreen> {
  
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.purple, // Couleur de fond violette
            borderRadius: BorderRadius.circular(20.0), // Bordure arrondie
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Couleur de l'ombre avec opacité
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // Décalage de l'ombre
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bienvenue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white, // Couleur du texte en blanc
                      ),
                    ),
                    Text(
                      'Gestionnaire Kodak',
                      style: TextStyle(
                        color: Colors.grey[200], // Couleur du texte gris clair
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        // Action pour le bouton "more"
                      },
                      child: Text(
                        'More',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/votre_image.jpg', // Remplacez 'votre_image.jpg' par le chemin de votre image
                      width: 150.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Ajoutez d'autres widgets ici si nécessaire
      ],
    );
  }

  

  onTapGoogle() {
    // Handle Google sign-up
    // Get.toNamed(AppRoutes.citySelectionScreen);
  }

  onTapApple() {
    // Handle Apple sign-up
    // Get.toNamed(AppRoutes.citySelectionScreen);
  }

  onTapTxtAlreadyhavean() {
    Get.back();
  }
}
