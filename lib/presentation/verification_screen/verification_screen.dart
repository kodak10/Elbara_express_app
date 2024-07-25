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
  const VerificationScreen(
      {Key? key, required this.verificationId, required this.phoneNumber})
      : super(key: key);
  final String verificationId;
  final String phoneNumber;
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

  late Timer timer;

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

  void onResendSmsCode() {
    resend = false;
    setState(() {});
    authWithPhoneNumber(widget.phoneNumber, onCodeSend: (verificationId, v) {
      loading = false;
      decompte();
      setState(() {});
    }, onAutoVerify: (v) async {
      await _auth.signInWithCredential(v);
      Navigator.of(context).pop();
    }, onFailed: (e) {
      loading = false;
      setState(() {});
      print("Le code est erroné");
    }, autoRetrieval: (v) {});
  }

  void onVerifySmsCode() async {
    loading = true;
    setState(() {});
    await validateOtp(smsCode, widget.verificationId);
    loading = true;
    setState(() {});
    Navigator.of(context).pop();
    print("Vérification éfectué avec succès");
  }

  Future<void> validateOtp(String smsCode, String verificationId) async {
    final _credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    await _auth.signInWithCredential(_credential);
    return;
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
                      controller: controller.otpController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter valid code";
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
                  CustomButton(
                    height: getVerticalSize(54),
                    text: "Vérifier".tr,
                    margin: getMargin(top: 30),
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        onVerifySmsCode();
                        //await verifySmsCode(controler.otpController.text); // Passer seulement le smsCode
                      }
                    },
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

  Future<void> verifySmsCode(String smsCode) async {
    try {
      // Créer les credentials à partir du code de vérification
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: controller.verificationId.value,
        smsCode: smsCode,
      );

      // Signer avec les credentials
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Redirection vers l'écran de réinitialisation du mot de passe
      Get.toNamed(AppRoutes.resetPasswordScreen);
    } on FirebaseAuthException catch (e) {
      // Gérer les erreurs spécifiques de Firebase Auth
      if (e.code == 'invalid-verification-code') {
        showCustomSnackBar(context, 'Code SMS incorrect. Veuillez réessayer.',
            isError: true);
      } else if (e.code == 'invalid-verification-id') {
        showCustomSnackBar(context,
            'La validation du code SMS a expiré. Veuillez demander un nouveau code.',
            isError: true);
      } else {
        showCustomSnackBar(context, 'Échec de la vérification : ${e.message}',
            isError: true);
      }
    } on TimeoutException catch (_) {
      // Gérer les erreurs de délai d'attente (timeout)
      showCustomSnackBar(context,
          'Délai d\'attente dépassé. Veuillez vérifier votre connexion internet.',
          isError: true);
    } catch (e) {
      // Gérer toutes les autres exceptions
      showCustomSnackBar(context, 'Échec de la vérification : $e',
          isError: true);
    }
  }

  void onTapVerify() {
    Navigator.of(context).pushNamed(AppRoutes.resetPasswordScreen);
  }

  void onTapArrowleft1() {
    Navigator.of(context).pop();
  }
}
