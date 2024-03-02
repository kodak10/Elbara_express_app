import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../edit_and_delete_address_screen/edit_and_delete_address_screen.dart';
import '../controller/select_delivery_address_controller.dart';
import '../models/listeye1_item_model.dart';

// ignore: must_be_immutable
class Listeye1ItemWidget extends StatelessWidget {
  Listeye1ItemWidget(
    this.listeye1ItemModelObj,
    this.index, {
    Key? key,
    this.onTapAddress,
  }) : super(
          key: key,
        );

  Listeye1ItemModel listeye1ItemModelObj;
  int index;

  SelectDeliveryAddressController selectDeliveryAddressController =
      Get.put(SelectDeliveryAddressController());

  VoidCallback? onTapAddress;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectDeliveryAddressController>(
      init: SelectDeliveryAddressController(),
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
                            listeye1ItemModelObj.addressTitle!,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtHeadline,
                          ),
                          Text(
                            "${listeye1ItemModelObj.addressline1!} ${listeye1ItemModelObj.addressline2!} ${listeye1ItemModelObj.country} ${listeye1ItemModelObj.state} ${listeye1ItemModelObj.city} ${listeye1ItemModelObj.pinCode}",
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
                            addressline1: listeye1ItemModelObj.addressline1,
                            addressline2: listeye1ItemModelObj.addressline2,
                            country: listeye1ItemModelObj.country,
                            state: listeye1ItemModelObj.state,
                            city: listeye1ItemModelObj.city,
                            pinCode: listeye1ItemModelObj.pinCode,
                            mobileNumber: listeye1ItemModelObj.mobileNumber);
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
