import '../home_container_page/controller/home_container_controller.dart';
import '../home_container_page/models/recently_shipped_data_model.dart';
import '../my_orders_page/widgets/my_orders_item_widget.dart';
import 'controller/my_orders_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

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
                            "lbl_my_orders".tr,
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
                            "lbl_my_orders".tr,
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
                    child: Container(
                      child: ListView(
                        children: [
                          ListView.separated(
                            padding: getPadding(
                                left: 16, top: 16, right: 16, bottom: 20),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (
                              context,
                              index,
                            ) {
                              return SizedBox(
                                height: getVerticalSize(
                                  16,
                                ),
                              );
                            },
                            itemCount: controller.recentlyShipped.length,
                            itemBuilder: (context, index) {
                              RecentlyShipped model =
                                  controller.recentlyShipped[index];
                              return MyOrdersItemWidget(
                                model,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
