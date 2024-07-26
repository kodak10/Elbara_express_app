import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/presentation/live_tracking_screen/controller/live_tracking_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class LiveTrackingScreen extends GetWidget<LiveTrackingController> {
  final String deliveryID;

  const LiveTrackingScreen({Key? key, required this.deliveryID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access the controller to fetch user details
    controller.fetchUserDetails(deliveryID);

    return Padding(
      padding: getPadding(left: 16, right: 16, top: 0, bottom: 20),
      child: Obx(() {
        // Observe changes to the `user` observable
        final user = controller.user.value;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getSize(15)),
            Center(
              child: Container(
                height: getSize(5),
                width: getSize(70),
                decoration: BoxDecoration(
                    color: ColorConstant.gray300,
                    borderRadius: BorderRadius.circular(getHorizontalSize(100))),
              ),
            ),
            SizedBox(height: getSize(20)),
            Text("msg_package_information".tr,
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
                        Obx(() {
                            String? photoUrl = controller.user['photoURL'];
                            return Container(
                              width: getHorizontalSize(60),
                              height: getVerticalSize(60),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                                image: photoUrl != null
                                    ? DecorationImage(
                                        image: NetworkImage(photoUrl),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: photoUrl == null
                                  ? Icon(Icons.person, size: 40, color: Colors.white)
                                  : null,
                            );
                          }),
                        SizedBox(width: getHorizontalSize(16)),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                                    text: (controller.user['displayName'] ?? '').toUpperCase(),
                                    style: TextStyle(
                                      color: ColorConstant.black900,
                                      fontSize: getFontSize(18),
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: getHorizontalSize(99),
                    margin: getMargin(top: 1),
                    child: IconButton(
                      icon: Image.asset(
                        ImageConstant.phone,
                        width: 32,
                        height: 32,
                      ),
                      onPressed: () {
                        final phoneNumber = user['phoneNumber'] ?? ''; // Fetch the phone number
                        if (phoneNumber.isNotEmpty) {
                          // Launch the phone dialer with the user's phone number
                          launch('tel:$phoneNumber');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getVerticalSize(16)),
          ],
        );
      }),
    );
  }
}
