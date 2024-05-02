import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../../home_container_page/models/recently_shipped_data_model.dart';
import '../../order_details_in_transit_screen/order_details_in_transit_screen.dart';

// ignore: must_be_immutable
class MyOrdersItemWidget extends StatelessWidget {
  MyOrdersItemWidget(
    this.myOrdersItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  RecentlyShipped myOrdersItemModelObj;

  // var controller = Get.find<MyOrdersController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(OrderDetailsInTransitScreen(
          orderData: myOrdersItemModelObj,
        ));
        // Get.toNamed(AppRoutes.orderDetailsInTransitScreen);
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomIconButton(
                    height: 42,
                    width: 42,
                    margin: getMargin(
                      bottom: 1,
                    ),
                    shape: IconButtonShape.CircleBorder20,
                    child: CustomImageView(
                      svgPath: ImageConstant.imgArrowdownDeepPurple600,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 8,
                      top: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Référence N°:".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSubheadlineGray600,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 4,
                          ),
                          child: Text(
                            myOrdersItemModelObj.orderID!,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSubheadline,
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
                            BorderRadius.circular(getHorizontalSize(16)),
                        border: Border.all(
                            color: myOrdersItemModelObj.status!
                                        .toLowerCase() ==
                                    "onTheWay"
                                ? ColorConstant.greenA700
                                : myOrdersItemModelObj.status!.toLowerCase() ==
                                        "pending"
                                    ? ColorConstant.amber700
                                    : ColorConstant.red)),
                    child: Center(
                        child: Text(
                      myOrdersItemModelObj.status!,
                      style: myOrdersItemModelObj.status!.toLowerCase() ==
                              "onTheWay"
                          ? AppStyle.txtOutfitRegular14Green
                          : myOrdersItemModelObj.status!.toLowerCase() ==
                                  "pending"
                              ? AppStyle.txtOutfitRegular14Amber
                              : AppStyle.txtOutfitRegular14Red,
                    )),
                  )
                ],
              ),
              Padding(
                padding: getPadding(
                  top: 17,
                ),
                child: Text(
                  "Date: ${myOrdersItemModelObj.date!}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFProTextRegular14,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 14,
                  bottom: 1,
                ),
                child: Text(
                  
                  "Départ: ${myOrdersItemModelObj.depart!}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtFootnote,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 14,
                  bottom: 1,
                ),
                child: Text(
                  "Destination: ${myOrdersItemModelObj.destination!}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtFootnote,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
