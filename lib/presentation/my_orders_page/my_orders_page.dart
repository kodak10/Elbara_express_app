import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/order_details_in_transit_screen/order_details_in_transit_screen.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../home_container_page/controller/home_container_controller.dart';
import '../home_container_page/models/recently_shipped_data_model.dart';
import '../my_orders_page/widgets/my_orders_item_widget.dart';
import 'controller/my_orders_controller.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

final User? user = FirebaseAuth.instance.currentUser;

class _MyOrdersPageState extends State<MyOrdersPage> {
  MyOrdersController myOrdersController = Get.put(MyOrdersController());
  HomeContainerController controller = Get.put(HomeContainerController());
  @override
  Widget build(BuildContext context) {
    return controller.recentlyShipped.isEmpty
        ? SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    padding: getPadding(
                      left: 142,
                      top: 19,
                      right: 142,
                      bottom: 19,
                    ),
                    decoration: AppDecoration.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 5,
                          ),
                          child: Text(
                            "Mes Commandes",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFProTextBold28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: ColorConstant.deepPurple50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.circleBorder70,
                  ),
                  child: Container(
                    height: getSize(
                      140,
                    ),
                    width: getSize(
                      140,
                    ),
                    padding: getPadding(
                      all: 30,
                    ),
                    decoration: AppDecoration.fillDeeppurple50.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder70,
                    ),
                    child: Stack(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgPackage11,
                          height: getSize(
                            80,
                          ),
                          width: getSize(
                            80,
                          ),
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 21,
                  ),
                  child: Text(
                    "lbl_no_order_yet".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFProTextBold22,
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    270,
                  ),
                  margin: getMargin(
                    top: 12,
                  ),
                  child: Text(
                    "msg_pellentesque_eu".tr,
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtBody,
                  ),
                ),
                CustomButton(
                  height: getVerticalSize(
                    53,
                  ),
                  width: getHorizontalSize(
                    178,
                  ),
                  text: "lbl_add".tr,
                  margin: getMargin(
                    top: 41,
                    bottom: 194,
                  ),
                ),
              ],
            ),
          )
        : Container(
            decoration: AppDecoration.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    padding: getPadding(
                      //left: 142,
                      top: 19,
                      //right: 142,
                      bottom: 19,
                    ),
                    decoration: AppDecoration.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: getPadding(
                            top: 5,
                          ),
                          child: Text(
                            "Mes Commandes".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFProTextBold28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: getPadding(bottom: 20),
                    child: GestureDetector(
                        // onTap: () {
                        //   Get.to(OrderDetailsInTransitScreen(
                        //     orderData: ordertest,
                        //   ));
                        //   // Get.toNamed(AppRoutes.orderDetailsInTransitScreen);
                        // },

                        child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('orders')
                          .where('userId', isEqualTo: user?.uid)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }
                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return SizedBox(
                              width: double.maxFinite,
                              child: Container(
                                padding: getPadding(
                                  left: 30,
                                  top: 35,
                                  right: 26,
                                  bottom: 15,
                                ),
                                decoration: AppDecoration.fillGray50.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        CustomIconButton(
                                          height: 42,
                                          width: 42,
                                          margin: getMargin(
                                            bottom: 1,
                                          ),
                                          shape: IconButtonShape.CircleBorder20,
                                          child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgArrowdownDeepPurple600,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(
                                            left: 8,
                                            top: 5,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Référence N°:",
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtSubheadlineGray600,
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  top: 4,
                                                ),
                                                child: Text(
                                                  data['orderId'],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style:
                                                      AppStyle.txtSubheadline,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          height: getSize(32),
                                          width: getSize(102),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(16)),
                                              border: Border.all(
                                                  color: data['deliveryStatus']!
                                                              .toLowerCase() ==
                                                          "delivered"
                                                      ? ColorConstant.greenA700

                                                      : data['deliveryStatus']!
                                                              .toLowerCase() ==
                                                          "canceled"
                                                      ? ColorConstant.greenA700

                                                      : data['deliveryStatus']!
                                                              .toLowerCase() ==
                                                          "upcomming"
                                                      ? ColorConstant.greenA700

                                                      : data['deliveryStatus']!
                                                                  .toLowerCase() ==
                                                              "Colis livré"
                                                          ? ColorConstant
                                                              .amber700
                                                          : ColorConstant.red
                                                          
                                                          )
                                                        ),
                                          child: Center(
                                              child: Text(
                                           data['deliveryStatus']!,
                                            style: data['deliveryStatus']!
                                                        .toLowerCase() ==
                                                    "onTheWay"
                                                ? AppStyle
                                                    .txtOutfitRegular14Green
                                                : data['deliveryStatus']!
                                                            .toLowerCase() ==
                                                        "Livreur en chemin"
                                                    ? AppStyle
                                                        .txtOutfitRegular14Amber
                                                    : AppStyle
                                                        .txtOutfitRegular14Red,
                                                  
                                          )),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: getPadding(
                                        top: 14,
                                        bottom: 1,
                                      ),
                                      child: Text(
                                        "Date: ${data['dateRegister']}",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtFootnote,
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            );
                            // return Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            //   child: Container(
                            //     padding: const EdgeInsets.all(16),
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(8),
                            //       color: Colors.grey[200],
                            //     ),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Row(
                            //           crossAxisAlignment: CrossAxisAlignment.end,
                            //           children: [
                            //             CustomIconButton(
                            //               height: 42,
                            //               width: 42,
                            //               margin: EdgeInsets.only(bottom: 1),
                            //               shape: IconButtonShape.CircleBorder20,
                            //               child: CustomImageView(
                            //                 svgPath: ImageConstant.imgArrowdownDeepPurple600,
                            //               ),
                            //             ),
                            //             SizedBox(width: 8),
                            //             Column(
                            //               crossAxisAlignment: CrossAxisAlignment.start,
                            //               mainAxisAlignment: MainAxisAlignment.start,
                            //               children: [
                            //                 Text(
                            //                   "Référence N°:",
                            //                   overflow: TextOverflow.ellipsis,
                            //                   textAlign: TextAlign.left,
                            //                   style: AppStyle.txtSubheadlineGray600,
                            //                 ),
                            //                 SizedBox(height: 4),
                            //                 Text(
                            //                   data['orderId'] ?? 'N/A',
                            //                   overflow: TextOverflow.ellipsis,
                            //                   textAlign: TextAlign.left,
                            //                   style: AppStyle.txtSubheadline,
                            //                 ),
                            //               ],
                            //             ),
                            //             Spacer(),
                            //             Container(
                            //               height: 32,
                            //               width: 102,
                            //               decoration: BoxDecoration(
                            //                 borderRadius: BorderRadius.circular(16),
                            //                 border: Border.all(
                            //                   color: data['deliveryStatus']?.toLowerCase() == "onTheWay"
                            //                       ? ColorConstant.greenA700
                            //                       : data['deliveryStatus']?.toLowerCase() == "Livreur en chemin"
                            //                           ? ColorConstant.amber700
                            //                           : ColorConstant.red,
                            //                 ),
                            //               ),
                            //               child: Center(
                            //                 child: Text(
                            //                   data['status'] ?? 'N/A',
                            //                   style: TextStyle(
                            //                     color: data['deliveryStatus']?.toLowerCase() == "upcomming"
                            //                         ? ColorConstant.greenA700
                            //                         : data['deliveryStatus']?.toLowerCase() == "Commande en attente"
                            //                             ? ColorConstant.amber700
                            //                             : ColorConstant.red,
                            //                   ),
                            //                 ),
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //         SizedBox(height: 14),
                            //         Text(
                            //           "Date: ${data['dateRegister'] ?? 'N/A'}",
                            //           overflow: TextOverflow.ellipsis,
                            //           textAlign: TextAlign.left,
                            //           style: AppStyle.txtFootnote,
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // );
                          }).toList(),
                        );
                      },
                    )),
                  ),
                ),
              ],
            ),
          );
  }
}
