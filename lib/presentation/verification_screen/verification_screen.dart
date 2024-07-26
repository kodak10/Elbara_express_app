import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/functions/register.dart';
import 'package:elbara_express/core/utils/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import 'controller/verification_controller.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'dart:async';

class VerificationScreen extends StatefulWidget {
 final String verificationId;
 String phoneNumber;

  VerificationScreen({
    Key? key,
    required this.verificationId,
    required this.phoneNumber, // Ajoutez cette ligne
  }) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final VerificationController controller = Get.put(VerificationController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController _phoneController = TextEditingController();


  String smsCode = "";
  bool loading = false;
  bool resend = false;
  int count = 20;

  final _auth = FirebaseAuth.instance;
  late Timer timer;
  final TextEditingController _otpController = TextEditingController();
  

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
    _phoneController.text = widget.phoneNumber;

    decompte();
  }

  void decompte() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (count < 1) {
        timer.cancel();
        count = 60;
        resend = true;
        setState(() {});
        return;
      }
      count--;
      setState(() {});
    });
  }

  Future<void> resendOTP() async {
  setState(() {
    loading = true;
  });

  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+225${_phoneController.text.trim()}', // Assurez-vous d'utiliser le numéro de téléphone actuel
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Optionnel: Authentification automatique
        await FirebaseAuth.instance.signInWithCredential(credential);
        // Vous pouvez rediriger vers l'écran d'accueil ou un autre écran ici si nécessaire
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Erreur lors de l'envoi du code: ${e.message}");
        // Affichez un message d'erreur à l'utilisateur si nécessaire
        showCustomSnackBar(context, 'Erreur lors de l\'envoi du code: ${e.message}', isError: true);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
         verificationId = verificationId;
          loading = false;
          // Vous pouvez afficher un message de succès ou rediriger l'utilisateur vers un autre écran si nécessaire
        });
        // Naviguez vers l'écran de vérification ou mettez à jour l'état
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Ce callback est appelé lorsque la période d'attente pour la récupération automatique du code expire
        setState(() {
         verificationId = verificationId;
          loading = false;
        });
      },
    );
  } catch (e) {
    print("Erreur: $e");
    // Gérez les exceptions non-Firebase si nécessaire
    showCustomSnackBar(context, 'Une erreur est survenue: ${e.toString()}', isError: true);
  } finally {
    setState(() {
      loading = false;
    });
  }
}


  Future<void> verifyOTP() async {
    final otp = _otpController.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    try {
      var _currentUser = FirebaseAuth.instance.currentUser;

      if (_currentUser != null) {
        UserCredential userCredential = await _auth.signInWithCredential(credential);
        String uid = _currentUser.uid;
        print("UID: $uid");

        DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);
        await userDocRef.update({
          'verif': true,
        });

        Navigator.of(context).pushReplacementNamed(AppRoutes.logInScreen);
      } else {
        showCustomSnackBar(context, "Utilisateur non authentifié", isError: true);
      }
    } catch (e) {
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
                      "Veuillez entrer le code reçu par SMS".tr,
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtBody,
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

                  CustomButton(
                    height: getVerticalSize(54),
                    text: "Valider".tr,
                    margin: getMargin(top: 30),
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        verifyOTP();
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
                            text: resend ? "lbl_resend_code".tr : "".tr,
                            style: TextStyle(
                              color: resend ? ColorConstant.deepPurple600 : ColorConstant.gray600,
                              fontSize: getFontSize(16),
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = resend
                                  ? () {
                                      resendOTP();
                                    }
                                  : null,
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
