import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/custom_floating_edit_text.dart';
import 'controller/log_in_controller.dart';

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
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstant.whiteA700,
          body: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 16, top: 41, right: 16, bottom: 41),
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
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
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
                        return "Veuillez entrer une adresse e-mail valide";
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
                          return "Veuillez entrer un mot de passe valide";
                        } else if (value.length < 8) {
                          return "Veuillez saisir un mot de passe à 8 chiffres";
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
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool('isLoggedIn', true);
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                              _isLoading = true; // Mettre à jour l'état de chargement
                            });
                          // Effectuer l'authentification avec email et mot de passe
                          try {
                            UserCredential userCredential =
                                await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: controller.emailController.text,
                              password: controller.passwordController.text,
                            );
                            // L'utilisateur est connecté avec succès
                            //onTapLogin();
                            User? user = FirebaseAuth.instance.currentUser;
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(user!.uid)
                                .get()
                                .then((DocumentSnapshot documentSnapshot) {
                              if (documentSnapshot.exists) {
                                if (documentSnapshot.get('role') == "user") {
                                   Get.toNamed(
                                      AppRoutes.homeContainer1Screen,
                                    );
                                } else {
                                  Get.toNamed(
                                      AppRoutes.homeGestionnaireScreen,
                                    );
                                }
                              } else {
                                print('Une erreur est survenue, veuillez contactez le service client.');
                              }
                            });

                            
                            
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              _showSnackBar('Aucun utilisateur trouvé pour cet e-mail.');
                            } else if (e.code == 'wrong-password') {
                              _showSnackBar('Mauvais mot de passe fourni pour cet utilisateur.');
                            } else {
                              _showSnackBar('Une erreur s\'est produite: ${e.message}');
                            }
                          } catch (e) {
                            _showSnackBar('Une erreur s\'est produite: $e');
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

_showSnackBar(String message) {
  Get.snackbar(
    "Erreur",
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    duration: Duration(seconds: 3),
  );
}


  homeGestionnaireScreen() {
    Get.toNamed(
      AppRoutes.homeGestionnaireScreen,
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

  onTapGoogle() {
    Get.toNamed(
      AppRoutes.homeContainer1Screen,
    );
  }

  onTapApple() {
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
