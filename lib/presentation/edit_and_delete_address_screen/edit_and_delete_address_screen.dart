import 'package:elbara_express/core/app_export.dart';
import 'package:flutter/material.dart';

import '../cancel_order_one_screen/cancel_order_one_screen.dart';
import '../edit_address_screen/edit_address_screen.dart';
import 'controller/edit_and_delete_address_controller.dart';

/*
String? addressTitle;
String? addressline1;
String? addressline2;
String? country;
String? state;
String? city;
String? pinCode;
String? mobileNumber;
 */

// ignore: must_be_immutable
class EditAndDeleteAddressScreen extends StatefulWidget {
  EditAndDeleteAddressScreen(
      {Key? key,
      required this.addressline1,
      required this.addressline2,
      required this.country,
      required this.state,
      required this.city,
      required this.pinCode,
      required this.mobileNumber})
      : super(key: key);
  String? addressline1;
  String? addressline2;
  String? country;
  String? state;
  String? city;
  String? pinCode;
  String? mobileNumber;

  @override
  State<EditAndDeleteAddressScreen> createState() =>
      _EditAndDeleteAddressScreenState();
}

class _EditAndDeleteAddressScreenState
    extends State<EditAndDeleteAddressScreen> {
  EditAndDeleteAddressController controller =
      Get.put(EditAndDeleteAddressController());

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding:
                          getPadding(left: 18, right: 18, bottom: 38, top: 56),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                  Get.to(EditAddressScreen(
                                      addressline1: widget.addressline1,
                                      addressline2: widget.addressline2,
                                      country: widget.country,
                                      state: widget.state,
                                      city: widget.city,
                                      pinCode: widget.pinCode,
                                      mobileNumber: widget.mobileNumber));
                                },
                                child: Text("lbl_edit".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtHeadline)),
                            Padding(
                                padding: getPadding(top: 19),
                                child: Divider(
                                    height: getVerticalSize(1),
                                    thickness: getVerticalSize(1),
                                    color: ColorConstant.blueGray100)),
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        insetPadding: EdgeInsets.all(16),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        contentPadding: EdgeInsets.zero,
                                        content: CancelOrderOneScreen(),
                                      );
                                    },
                                  );
                                },
                                child: Padding(
                                    padding: getPadding(top: 18),
                                    child: Text("lbl_delete".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtHeadline)))
                          ]))),
            ]));

    /// Navigates to the editAddressScreen when the action is triggered.

    /// When the action is triggered, this function uses the `Get` package to
    /// push the named route for the editAddressScreen.
  }
}
