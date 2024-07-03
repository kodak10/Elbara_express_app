import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbara_express/core/utils/snackbar.dart';
import 'package:elbara_express/core/utils/loading.dart';

import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/custom_floating_edit_text.dart';
import 'controller/log_in_controller.dart';
import 'package:lottie/lottie.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  LogInController controller = Get.put(LogInController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false; // Variable pour gérer l'état du chargement


  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        closeApp();
        return true;
      },
      child: ColorfulSafeArea(
        color: ColorConstant.whiteA700,
        child: Scaffold(
          

        appBar: CustomAppBar(
          height: 79.0,
          title: Image.asset(
            'assets/images/appBar.png', // Chemin de votre image
            height: 200.0, // Hauteur de l'image, ajustez selon vos besoins
          ),
          
          centerTitle: false, // Centrez l'image si vous le souhaitez
          styleType: Style.bgFillWhiteA700, // Utilisez le style défini
        ),
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          body: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 16, top:20, right: 16, bottom: 41),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Padding(
                    padding: getPadding(top: 5),
                    child: Text(
                      "Content de vous revoir!",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtSFProTextBold28,
                    ),
                  ),
                  Padding(
                    padding: getPadding(top: 22),
                    child: Text(
                      "Utilisez le formulaire ci-dessous pour accéder à votre compte.",
                      //overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtBody,
                    ),
                  ),
                  CustomFloatingEditText(
                    controller: controller.emailController,
                    labelText: "Email",
                    hintText: "Email",
                    margin: getMargin(top: 38),
                    prefixConstraints: BoxConstraints(
                      maxHeight: getSize(54),
                      minHeight: getSize(54),
                    ),
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        showCustomSnackBar(context, "Adresse email non valide", isError: true);
                        return;

                      }
                      return null;
                    },
                  ),
                  Obx(
                    () => CustomFloatingEditText(
                      controller: controller.passwordController,
                      labelText: "Mot de passe",
                      hintText: "Mot de passe",
                      margin: getMargin(top: 24),
                      prefixConstraints: BoxConstraints(
                        maxHeight: getSize(54),
                        minHeight: getSize(54),
                      ),
                      isObscureText: controller.isShowPassword.value,
                      textInputType: TextInputType.emailAddress,
                      suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword.value =
                              !controller.isShowPassword.value;
                        },
                        child: Container(
                          margin: getMargin(left: 16, right: 16),
                          child: CustomImageView(
                            svgPath: controller.isShowPassword.value
                                ? ImageConstant.imgIcPasswordStoke
                                : ImageConstant.imgIcPasswordStoke,
                          ),
                        ),
                      ),
                      suffixConstraints: BoxConstraints(
                        maxHeight: getVerticalSize(63),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          showCustomSnackBar(context, "Veuillez entrer un mot de passe valide", isError: true);
                        return;

                        } else if (value.length < 8) {
                          showCustomSnackBar(context, "Veuillez saisir un mot de passe à 8 chiffres", isError: true);
                        return;

                        }
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        onTapTxtForgotpassword();
                      },
                      child: Padding(
                        padding: getPadding(top: 19),
                        child: Text(
                          "Mot de passe oublié ?",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtBody,
                        ),
                      ),
                    ),
                  ),
                CustomButton(
                      height: getVerticalSize(54),
                      text: "Se Connecter",
                      margin: getMargin(top: 31),
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          // Retirer le focus de tous les champs de saisie
                          FocusScope.of(context).requestFocus(FocusNode());
                          // Navigate to the LoadingPage
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoadingPage()),
                          );


                          try {
                            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: controller.emailController.text,
                              password: controller.passwordController.text,
                            );

                            // L'utilisateur est connecté avec succès
                            User? user = FirebaseAuth.instance.currentUser;
                            FirebaseFirestore.instance
                              .collection('users')
                              .doc(user!.uid)
                              .get()
                              .then((DocumentSnapshot documentSnapshot) {
                                Navigator.of(context).pop(); // Fermer le modal de chargement
                                if (documentSnapshot.exists) {
                                  if (documentSnapshot.get('role') == "user") {
                                    PrefUtils.setIsSignIn(false); // Mettre à jour le statut de connexion
                                    Get.toNamed(AppRoutes.homeContainer1Screen);
                                  } else {
                                    showCustomSnackBar(context, 'Email ou mot de passe incorrecte.', isError: true);
                                  }
                                } else {
                                  showCustomSnackBar(context, 'Une erreur est survenue, veuillez contacter le service client.', isError: true);
                                }
                              });

                          } on FirebaseAuthException catch (e) {
                            Navigator.of(context).pop(); // Fermer le modal de chargement en cas d'erreur
                            showCustomSnackBar(context, "Email ou mot de passe incorrect.", isError: true);

                          } catch (e) {
                            Navigator.of(context).pop(); // Fermer le modal de chargement en cas d'erreur
                            showCustomSnackBar(context, 'Une erreur s\'est produite: $e', isError: true);
                          }
                        }
                      },
                    ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      onTapTxtDonthaveanaccount();
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Vous n'avez pas de compte ? ",
                            style: TextStyle(
                              color: ColorConstant.black900,
                              fontSize: getFontSize(16),
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: "S'inscrire",
                            style: TextStyle(
                              color: ColorConstant.deepPurple600,
                              fontSize: getFontSize(16),
                              fontFamily: 'SF Pro Text',
                              fontWeight: FontWeight.w400,
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


  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  onTapLogin() {
    Get.toNamed(
      AppRoutes.homeContainer1Screen,
    );
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
