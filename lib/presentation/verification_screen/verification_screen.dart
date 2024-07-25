import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/functions/register.dart';
import 'package:elbara_express/core/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import 'controller/verification_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'dart:async'; // Importer pour TimeoutException

class VerificationScreen extends StatefulWidget {
  final String verificationId;
  VerificationScreen({required this.verificationId});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final VerificationController controller = Get.put(
      VerificationController()); // Assurez-vous d'initialiser votre contrôleur
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String smsCode = "";
  bool loading = false;
  bool resend = false;
  int count = 20;

  final _auth = FirebaseAuth.instance;
  late Timer timer;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    decompte();
  }

  void decompte() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (count < 1) {
        timer.cancel();
        count = 20;
        resend = true;
        setState(() {});
        return;
      }
      count--;
      setState(() {});
    });
  }

  final TextEditingController _otpController = TextEditingController();

  Future<void> verifyOTP() async {
    final otp = _otpController.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    try {
      await _auth.signInWithCredential(credential);
      Navigator.of(context).pushReplacementNamed(AppRoutes.homeContainer1Screen);
    } catch (e) {
      // Affichez une erreur plus détaillée pour le débogage
      print("Error during OTP verification: ${e.toString()}");
      showCustomSnackBar(context, "Code de vérification invalide", isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          appBar: CustomAppBar(
            height: getVerticalSize(79),
            leadingWidth: 42,
            leading: AppbarImage(
              height: getSize(24),
              width: getSize(24),
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 18, top: 29, bottom: 26),
              onTap: onTapArrowleft1,
            ),
            centerTitle: true,
            title: AppbarSubtitle1(text: "lbl_verification".tr),
            styleType: Style.bgFillWhiteA700,
          ),
          body: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 16, top: 12, right: 16, bottom: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: getHorizontalSize(355),
                    margin: getMargin(left: 20, right: 20),
                    child: Text(
                      "msg_please_provide_the".tr,
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtBody,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 30),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "lbl_code_sent_to".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(16),
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "msg_ronaldrichards_gmail_com".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(16),
                              fontFamily: 'Avenir',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: getPadding(left: 3, top: 29, right: 3),
                    child: Pinput(
                      length: 6,
                      errorTextStyle: TextStyle(
                        color: ColorConstant.red,
                        fontSize: getFontSize(16),
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400,
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      disabledPinTheme: PinTheme(
                        padding: getPadding(left: 9, right: 9),
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      controller: _otpController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a valid code";
                        }
                        return null;
                      },
                      errorPinTheme: PinTheme(
                        padding: getPadding(left: 9, right: 9),
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          border: Border.all(color: ColorConstant.red),
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(8),
                          ),
                        ),
                        textStyle: TextStyle(
                          color: ColorConstant.red,
                          fontSize: getFontSize(16),
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                        ),
                        width: getHorizontalSize(51),
                        height: getVerticalSize(51),
                      ),
                      defaultPinTheme: PinTheme(
                        padding: getPadding(left: 9, right: 9),
                        width: getHorizontalSize(51),
                        height: getVerticalSize(51),
                        textStyle: TextStyle(
                          color: ColorConstant.black900,
                          fontSize: getFontSize(24),
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700,
                          border: Border.all(color: ColorConstant.gray300),
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        verifyOTP();
                      }
                    },
                    child: const Text(
                      'Verify',
                      style: TextStyle(fontSize: 16),
                    ).paddingAll(14),
                  ),
                  Padding(
                    padding: getPadding(top: 32, bottom: 5),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_don_t_receive_code2".tr,
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(16),
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "lbl_resend_code".tr,
                            style: TextStyle(
                              color: ColorConstant.deepPurple600,
                              fontSize: getFontSize(16),
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTapArrowleft1() {
    Navigator.of(context).pop();
  }
}
