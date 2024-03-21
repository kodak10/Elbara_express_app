import 'package:elbara_express/presentation/home_container_page/models/home_slider_model.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:intl/intl.dart';
import '../home_container_page/widgets/slidermaskgroup_item_widget.dart';
import 'controller/home_container_controller.dart';
import 'models/corier_service_model.dart';
import 'models/recently_shipped_data_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';




class CourierService {
  String name;
  String logo;

  CourierService({
    required this.name,
    required this.logo,
  });

  static CourierService fromMap(Map<String, dynamic> data) {
    return CourierService(
      name: data['name'] ?? '',
      logo: data['logo'] ?? '',
    );
  }
}


class HomeContainerPage extends StatelessWidget {
  
  HomeContainerPage({Key? key}) : super(key: key);

  HomeContainerController controller = Get.put(HomeContainerController());

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    
    User? user = FirebaseAuth.instance.currentUser;

    return Container(
      decoration: AppDecoration.white,
      child: Column(
        children: [
          Padding(
            padding: getPadding(top: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppbarImage(
                        height: getSize(20),
                        width: getSize(20),
                        svgPath: ImageConstant.imgUSerIcon,
                        margin: getMargin(left: 16, top: 18, bottom: 18)),
                    SizedBox(
                      width: getHorizontalSize(12),
                    ),
                    Text(
                      user != null ? user.displayName ?? "" : "",
                      style: AppStyle.txtSFProTextBold28,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: getVerticalSize(10),
          ),
          Expanded(
            child: ListView(
              children: [
                // Carousel Slider
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: getVerticalSize(140),
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 0.8,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      controller.sliderIndex.value = index;
                    },
                  ),
                  itemCount: controller.sliderData.length,
                  itemBuilder: (context, index, realIndex) {
                    HomeSlider model = controller.sliderData[index];
                    return SlidermaskgroupItemWidget(model);
                  },
                ),
                // Indicator
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.sliderData.length,
                        (index) {
                      return AnimatedContainer(
                        margin: getMargin(
                            left: 4, top: 16, bottom: 16, right: 4),
                        duration: const Duration(milliseconds: 300),
                        height: getVerticalSize(6),
                        width: getHorizontalSize(index ==
                                controller.sliderIndex.value
                            ? 16
                            : 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              getHorizontalSize(12)),
                          color: (index == controller.sliderIndex.value)
                              ? ColorConstant.black900
                              : ColorConstant.black900.withOpacity(0.10),
                        ),
                      );
                    }),
                  ),
                ),
                // Actions
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(left: 16, top: 21),
                    child: Text(
                      "Actions".tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSFProTextBold20,
                    ),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(16),
                ),
                Padding(
                  padding: getPadding(left: 16, right: 16),
                  child: Row(
                    children: [
                      category_button(
                        () {
                          Get.toNamed(AppRoutes.sendPackageScreen);
                        },
                        "Envoyer un colis".tr,
                        ImageConstant.imgSendPackegeIcon,
                      ),
                      SizedBox(
                        width: getHorizontalSize(8),
                      ),
                      category_button(
                        () {
                          Get.toNamed(AppRoutes.orderTrackingScreen);
                        },
                        "Suivre un colis".tr,
                        ImageConstant.imgOrderTracingIcon,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getHorizontalSize(16),
                ),
                // Nos Compagnies
                Padding(
                  padding: getPadding(left: 16, top: 19, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nos Compagnies".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSFProTextBold20,
                      ),
                      GestureDetector(
                        onTap: () {
                          onTapTxtViewall();
                        },
                        child: Padding(
                          padding: getPadding(top: 3, bottom: 3),
                          child: Text(
                            "Voir Tout".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFProTextRegular14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(16),
                ),
                // Liste des compagnies
                SizedBox(
                  height: getSize(109),
                  child: FutureBuilder<QuerySnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('compagnie')
                        .limit(4)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }
                      List<DocumentSnapshot> documents =
                          snapshot.data!.docs;
                      return ListView.builder(
                        padding: getPadding(left: 8, right: 8),
                        itemCount: documents.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          CourierService data =
                              CourierService.fromMap(documents[index]
                                  .data() as Map<String, dynamic>);
                          return Padding(
                            padding:
                                getPadding(left: 8, right: 8),
                            child: Container(
                              width: getSize(236),
                              decoration: BoxDecoration(
                                color: ColorConstant.gray50,
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(8)),
                              ),
                              child: Padding(
                                padding: getPadding(
                                    left: 16, right: 16),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(data.logo,),
                                        ),
                                        // SvgPicture.network(
                                        //   data.logo,
                                        //   width: getSize(24), // ajustez la largeur selon vos besoins
                                        //   height: getSize(24), // ajustez la hauteur selon vos besoins
                                        // ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          data.name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(16),
                ),
                // Banner
                CustomImageView(
                  imagePath: ImageConstant.imgSubBanner,
                ),
                SizedBox(
                  height: getVerticalSize(16),
                ),
                Padding(
                  padding: getPadding(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Commandes récentes".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtSFProTextBold20,
                      ),
                      GestureDetector(
                        onTap: () {
                          onTapTxtViewallone();
                        },
                        child: Padding(
                          padding: getPadding(top: 1, bottom: 5),
                          child: Text(
                            "Voir tout".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFProTextRegular14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(16),
                ),
                SizedBox(
  height: getSize(194),
  child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('commande')
            .where('userID', isEqualTo: user?.uid)
            //.where('status', isNotEqualTo: "terminer")
            //.orderBy('date', descending: true) // Trier par date de commande, les plus récents en premier
            .limit(5) // parfait
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
      return ListView.builder(
        padding: getPadding(left: 8, right: 8),
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          var document = snapshot.data!.docs[index];
          var orderId = document.id;
          var data = document.data() as Map<String, dynamic>;
          return Padding(
            padding: getPadding(left: 8, right: 8),
            child: Container(
              width: getSize(308),
              decoration: BoxDecoration(
                color: ColorConstant.gray50,
                borderRadius: BorderRadius.circular(getHorizontalSize(8)),
              ),
              child: Padding(
                padding: getPadding(top: 16, left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expédiés à: ${data['nom_receptioneur']}",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSubheadline,
                    ),
                    SizedBox(height: getVerticalSize(15)),
                    Text(
                      "N° de commande: $orderId",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSFProTextRegular14,
                    ),
                    Padding(
                      padding: getPadding(top: 4),
                      child: Text(
                        "Date: ${DateFormat("d MMMM y à HH:mm:ss").format(data['date'].toDate())}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtFootnote,
                      ),
                      
                    ),
                    SizedBox(height: getVerticalSize(15)),
                    CustomButton(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.trackingDetailsScreen,
                         arguments: {
                            'name': data['nom_receptioneur'], // Nom de la personne
                            'orderID': orderId, // Numéro de commande
                            'status': data['status'], // Statut de la commande
                            'date': data['date'].toDate(), // Date de la commande
                            // Vous pouvez ajouter d'autres informations de la commande ici
                          },
                        );
                      },
                      height: getSize(40),
                      text: "Suivre la commande",
                      fontStyle: ButtonFontStyle.SFProTextBold15WhiteA700,
                      padding: ButtonPadding.PaddingT0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  ),
),

                SizedBox(
                  height: getVerticalSize(20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTapTxtViewall() {
    Get.toNamed(
      AppRoutes.courierServicesScreen,
    );
  }

  onTapTxtViewallone() {
    Get.toNamed(
      AppRoutes.recentlyShippedScreen,
    );
  }

  Widget category_button(function, text, icon) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                getHorizontalSize(8)),
            color: ColorConstant.gray50,
          ),
          height: getSize(70),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: icon,
                height: getSize(24),
                width: getSize(24),
              ),
              SizedBox(
                width: getHorizontalSize(8),
              ),
              Text(
                text,
                maxLines: null,
                textAlign: TextAlign.left,
                style: AppStyle.txtSFProTextMedium14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
