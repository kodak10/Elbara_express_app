import 'controller/live_tracking_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

class LiveTrackingScreen extends GetWidget<LiveTrackingController> {
  const LiveTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(left: 16, right: 16, top: 0, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getSize(15),
          ),
          Center(
            child: Container(
              height: getSize(5),
              width: getSize(70),
              decoration: BoxDecoration(
                  color: ColorConstant.gray300,
                  borderRadius: BorderRadius.circular(getHorizontalSize(100))),
            ),
          ),
          SizedBox(
            height: getSize(20),
          ),
          Text("".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSFProTextBold20),
          Container(
              margin: getMargin(top: 18),
              padding: getPadding(all: 16),
              decoration: AppDecoration.fillGray50
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Container(
                    width: getHorizontalSize(146),
                    margin: getMargin(top: 1),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Placeholder pour l'image du livreur
                        Container(
                          width: getHorizontalSize(60), // Largeur de l'image du livreur
                          height: getVerticalSize(60), // Hauteur de l'image du livreur
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey, // Couleur de fond de l'image
                          ),
                          // Vous pouvez remplacer ce Container par un widget Image pour afficher l'image du livreur
                        ),
                        SizedBox(width: getHorizontalSize(8)), // Espacement entre l'image et le texte
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Nom & prénoms du livreur".tr,
                                  //overflow: TextOverflow.ellipsis, // Tronquer le texte avec des points de suspension s'il est trop long
                                  style: TextStyle(
                                    color: ColorConstant.black900,
                                    fontSize: getFontSize(18),
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                    Container(
                        width: getHorizontalSize(99),
                        margin: getMargin(top: 1),
                        child:IconButton(
                          icon: Image.asset(
                            ImageConstant.phone,
                            width: 32, // Largeur de l'image
                            height: 32, // Hauteur de l'image
                          ),
                          onPressed: () {
                            // Ajoutez ici la logique pour lancer le numéro de téléphone
                            // Par exemple, vous pouvez utiliser la méthode launch de url_launcher pour lancer un appel téléphonique
                            // Assurez-vous d'ajouter le package url_launcher à votre pubspec.yaml
                            // Par exemple :
                            // launch('tel:$phoneNumber');
                          },
                        )

                            ),

                            
                  ])),

                  

                  
          SizedBox(
            height: getVerticalSize(16),
          )
        ],
      ),
    );
  }

  onTapArrowleft17() {
    Get.back();
  }
}
