import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/presentation/verification_screen/verification_screen.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../../widgets/custom_floating_edit_text.dart';
import 'controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _isLoading = false; // Variable pour gérer l'état du chargement

  ForgotPasswordController controller = Get.put(ForgotPasswordController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  Future<void> _resetPassword(BuildContext context) async {
    // Fermer le clavier avant d'afficher le modal de chargement
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      // Retirer le focus de tous les champs de saisie
      FocusScope.of(context).requestFocus(FocusNode());

      _showLoadingDialog(); // Afficher le modal de chargement

      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: controller.emailController.text.trim(),
        );
        Navigator.of(context).pop(); // Fermer le modal de chargement en cas de succès

        // Afficher le snackbar après avoir fermé le modal
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCustomSnackBar(context, "Un email de réinitialisation a été envoyé.", false);
        });
      } on FirebaseAuthException catch (e) {
        Navigator.of(context).pop(); // Fermer le modal de chargement en cas d'erreur

        String errorMessage;
        if (e.code == 'user-not-found') {
          errorMessage = "Aucun utilisateur trouvé avec cet email.";
        } else {
          errorMessage = "Erreur lors de l'envoi de l'email de réinitialisation.";
        }

        // Afficher le snackbar après avoir fermé le modal
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCustomSnackBar(context, errorMessage, true);
        });
      } catch (error) {
        Navigator.of(context).pop(); // Fermer le modal de chargement en cas d'erreur

        // Afficher le snackbar après avoir fermé le modal
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showCustomSnackBar(context, "Erreur inconnue lors de l'envoi de l'email de réinitialisation.", true);
        });
      }
    }
  }

  void showCustomSnackBar(BuildContext context, String message, bool isError) {
    final snackBar = SnackBar(
      content: AwesomeSnackbarContent(
        title: isError ? 'Erreur' : 'Information',
        message: message,
        contentType: isError ? ContentType.failure : ContentType.success,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: Duration(seconds: 10), // Augmentez le délai ici
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Empêcher la fermeture du modal en cliquant en dehors
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/images/loading_1.json',
                    height: 150,
                    width: 150,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
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
              onTap: () {
                onTapArrowleft();
              },
            ),
            centerTitle: true,
            title: AppbarSubtitle1(text: "Mot de passe oublié"),
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
                    margin: getMargin(left: 20, right: 19),
                    child: Text(
                      "msg_please_provide_the".tr,
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtBody,
                    ),
                  ),
                  CustomFloatingEditText(
                    controller: controller.emailController,
                    labelText: "Adresse Email",
                    hintText: "Adresse Email",
                    margin: getMargin(top: 37),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getSize(54),
                      minHeight: getSize(54),
                    ),
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || (!isValidEmail(value, isRequired: true))) {
                        return "Adresse email non valide";
                      }
                      return null;
                    },
                  ),
                  CustomButton(
                    height: getVerticalSize(54),
                    text: "Envoyer",
                    margin: getMargin(top: 30, bottom: 5),
                    onTap: () {
                      // Fermer le clavier
                      FocusScope.of(context).unfocus();

                      if (_formKey.currentState!.validate()) {
                        _resetPassword(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapSend() {
    Get.toNamed(AppRoutes.verificationScreen);
  }

  onTapArrowleft() {
    Get.back();
  }
}
