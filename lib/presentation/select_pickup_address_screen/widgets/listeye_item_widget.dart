import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../edit_and_delete_address_screen/edit_and_delete_address_screen.dart';
import '../controller/select_pickup_address_controller.dart';
import '../models/listeye_item_model.dart';

// ignore: must_be_immutable
class ListeyeItemWidget extends StatelessWidget {
  ListeyeItemWidget(
    this.listeyeItemModelObj,
    this.index, {
    Key? key,
    this.onTapAddress,
  }) : super(
          key: key,
        );

  ListeyeItemModel listeyeItemModelObj;

  SelectPickupAddressController selectPickupAddressController =
      Get.put(SelectPickupAddressController());

  VoidCallback? onTapAddress;
  int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectPickupAddressController>(
      init: SelectPickupAddressController(),
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.setCurrentAddreddIndex(index);
        },
        child: Container(
          decoration: AppDecoration.fillGray50.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Padding(
            padding: getPadding(all: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getSize(34),
                      width: getSize(34),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstant.whiteA700),
                      child: Padding(
                        padding: getPadding(
                            top: 7.84, bottom: 7.84, left: 8, right: 8),
                        child: CustomImageView(
                          svgPath: ImageConstant.locationIcon,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getHorizontalSize(16),
                    ),
                    Container(
                      width: getSize(224),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listeyeItemModelObj.addressTitle!,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtHeadline,
                          ),
                          Text(
                            "${listeyeItemModelObj.addressline1!} ${listeyeItemModelObj.addressline2!} ${listeyeItemModelObj.country} ${listeyeItemModelObj.state} ${listeyeItemModelObj.city} ${listeyeItemModelObj.pinCode}",
                            maxLines: null,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtBody,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomImageView(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return EditAndDeleteAddressScreen(
                            addressline1: listeyeItemModelObj.addressline1,
                            addressline2: listeyeItemModelObj.addressline2,
                            country: listeyeItemModelObj.country,
                            state: listeyeItemModelObj.state,
                            city: listeyeItemModelObj.city,
                            pinCode: listeyeItemModelObj.pinCode,
                            mobileNumber: listeyeItemModelObj.mobileNumber);
                      },
                    );
                  },
                  svgPath: ImageConstant.imgOverflowmenu,
                  height: getSize(
                    20,
                  ),
                  width: getSize(
                    20,
                  ),
                  margin: getMargin(
                    bottom: 56,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
