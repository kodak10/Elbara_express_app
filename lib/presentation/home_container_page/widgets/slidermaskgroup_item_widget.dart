import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../controller/home_container_controller.dart';
import '../models/home_slider_model.dart';

// ignore: must_be_immutable
class SlidermaskgroupItemWidget extends StatelessWidget {
  SlidermaskgroupItemWidget(
    this.slidermaskgroupItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  HomeSlider slidermaskgroupItemModelObj;

  var controller = Get.find<HomeContainerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getSize(333),
      height: getSize(160),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(slidermaskgroupItemModelObj.image!),
              fit: BoxFit.fill)),
      child: Padding(
        padding: getPadding(left: 16, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: getSize(174),
              child: Text(
                slidermaskgroupItemModelObj.title!,
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtHeadlineWhiteA700,
              ),
            ),
            SizedBox(
              height: getVerticalSize(8),
            ),
           
            CustomButton(
              onTap: () {
                // Afficher un dialogue avec le texte modal
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.8, // 80% de la largeur de l'écran
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text(
                                "Information",
                                style: TextStyle(
                                  fontSize: 28.0, // Taille du texte augmentée
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20.0), // Espacement entre le titre et le contenu
                              // Utiliser RichText pour mettre en gras les textes contenant "Étape"
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 20.0, // Taille du texte augmentée
                                    color: Colors.black,
                                    height: 1.5, // Augmentation de l'espace entre les lignes
                                  ),
                                  children: _formatText(
                                    slidermaskgroupItemModelObj.modalText,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20.0), // Espacement après le contenu
                              Align(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                  child: const Text("Fermer"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              height: getVerticalSize(34),
              width: getHorizontalSize(103),
              text: "En savoir".tr,
              variant: ButtonVariant.White,
              padding: ButtonPadding.PaddingAll8,
              fontStyle: ButtonFontStyle.SFProTextBold15,
            ),
          ],
        ),
      ),
    );
  }

  // Fonction pour formater le texte et mettre en gras les textes contenant "Étape"
  List<TextSpan> _formatText(String text) {
    List<TextSpan> formattedText = [];

    List<String> lines = text.split('\n');
    for (String line in lines) {
      if (line.contains('Étape')) {
        formattedText.add(
          TextSpan(
            text: line,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      } else {
        formattedText.add(
          TextSpan(text: line),
        );
      }
      formattedText.add(TextSpan(text: '\n'));
    }

    return formattedText;
  }
}


