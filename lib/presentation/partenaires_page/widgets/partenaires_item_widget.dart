import 'package:elbara_express/core/utils/color_constant.dart';
import 'package:elbara_express/core/utils/image_constant.dart';
import 'package:elbara_express/core/utils/size_utils.dart';
import 'package:elbara_express/presentation/partenaires_page/models/partenaires_item_model.dart';
import 'package:elbara_express/presentation/partenaires_page/partenaires_details.dart';
import 'package:elbara_express/theme/app_decoration.dart';
import 'package:elbara_express/theme/app_style.dart';
import 'package:elbara_express/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// ignore: must_be_immutable
class CourierItemWidget extends StatelessWidget {
  final Partenaires courierItemModelObj;

  CourierItemWidget(
    this.courierItemModelObj, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PartenaireDetailsPage(courierService: courierItemModelObj));
      },
      child: SizedBox(
        width: double.maxFinite,
        child: Container(
          padding: getPadding(
            left: 16,
            top: 15,
            right: 16,
            bottom: 15,
          ),
          decoration: AppDecoration.fillGray50.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.network(
                    courierItemModelObj.icon ?? '',
                    height: getVerticalSize(40),
                    width: getHorizontalSize(70),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error); // Affiche une icône d'erreur en cas de problème de chargement
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                  ),
                SizedBox(width: 16),

                Text(
                  courierItemModelObj.nom!,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFProTextBold22.copyWith(
                    color: ColorConstant.bleuElbara, // Appliquer la couleur ici
                  ),
                ),


                  
                  
                ],
              ),
              Container(
                width: getHorizontalSize(
                  348,
                ),
                margin: getMargin(
                  top: 18,
                  right: 15,
                ),
                child: Text(
                  courierItemModelObj.description!,
                  maxLines: 3, // Limite le texte à 3 lignes
                  overflow: TextOverflow.ellipsis, // Affiche des points de suspension si le texte dépasse
                  textAlign: TextAlign.left,
                  style: AppStyle.txtBody,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
