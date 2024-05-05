import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'controller/sign_up_controller.dart';
import 'package:lottie/lottie.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignUpController controller = Get.put(SignUpController());
  static const String defaultRole = 'user'; // Définir le rôle par défaut

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
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

            // SizedBox(height: 16),
            // Text('Traitement en cours...'), // Texte de chargement
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
                body: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: getPadding(
                            left: 16, top: 41, right: 16, bottom: 41),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: getPadding(top: 5),
                                  child: Text("Commencer".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtSFProTextBold28)),
                              Padding(
                                  padding: getPadding(top: 22),
                                  child: Text(
                                      "Créez un compte en utilisant le formulaire ci-dessous."
                                          .tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtBody)),
                              CustomFloatingEditText(
                                  controller: controller.nameController,
                                  labelText: "Pseudo".tr,
                                  hintText: "Pseudo".tr,
                                  margin: getMargin(top: 31),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getSize(54),
                                      minHeight: getSize(54)),
                                  textInputType: TextInputType.text,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Veuillez entrer un Pseudo";
                                    }
                                    return null;
                                  }),
                              CustomFloatingEditText(
                                  controller: controller.emailController,
                                  labelText: "Email".tr,
                                  hintText: "Email".tr,
                                  margin: getMargin(top: 16),
                                  prefixConstraints: BoxConstraints(
                                      maxHeight: getSize(54),
                                      minHeight: getSize(54)),
                                  textInputType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value == null ||
                                        (!isValidEmail(value,
                                            isRequired: true))) {
                                      return "Veuillez entrer une adresse e-mail valide";
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: getVerticalSize(16),
                              ),
                              phone_number_field(
                                controller.phoneNumberController,
                                (p0) {
                                  if (p0 == null || p0.number.isEmpty) {
                                    return "Entrez un numéro valide";
                                  }
                                  return null;
                                },
                              ),
                              Obx(
                                () => CustomFloatingEditText(
                                    controller: controller.passwordController,
                                    labelText: "Mot de passe".tr,
                                    hintText: "Mot de passe".tr,
                                    margin: getMargin(top: 16),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getSize(54),
                                        minHeight: getSize(54)),
                                    isObscureText:
                                        controller.isShowPassword.value,
                                    textInputType: TextInputType.emailAddress,
                                    suffix: InkWell(
                                        onTap: () {
                                          controller.isShowPassword.value =
                                              !controller.isShowPassword.value;
                                        },
                                        child: Container(
                                            margin:
                                                getMargin(left: 16, right: 16),
                                            child: CustomImageView(
                                                svgPath: controller
                                                        .isShowPassword.value
                                                    ? ImageConstant
                                                        .imgIcPasswordStoke
                                                    : ImageConstant
                                                        .imgIcPasswordStoke))),
                                    suffixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(63)),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Veuillez entrer un mot de passe valide";
                                      } else if (value.length < 8) {
                                        return "Veuillez saisir un mot de passe à 8 chiffres";
                                      }
                                      return null;
                                    }),
                              ),
                              CustomButton(
                                  height: getVerticalSize(54),
                                  text: "S'inscrire".tr,
                                  margin: getMargin(top: 30),
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                       _showLoadingDialog(); // Afficher le modal de chargement
                                      onTapSignup();
                                    }
                                  }),
                              Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    onTapTxtAlreadyhavean();
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Vous avez déjà un compte ? "
                                                .tr,
                                            style: TextStyle(
                                                color: ColorConstant.black900,
                                                fontSize: getFontSize(16),
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400)),
                                        TextSpan(
                                            text: "Se Connecter".tr,
                                            style: TextStyle(
                                                color:
                                                    ColorConstant.deepPurple600,
                                                fontSize: getFontSize(16),
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400))
                                      ]),
                                      textAlign: TextAlign.left))
                            ]))))));
  }

  

  

  onTapSignup() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controller.emailController.text,
          password: controller.passwordController.text,

        );
        // Call function to post user details to Firestore
        //await postDetailsToFirestore(controller.emailController.text, defaultRole );
        await postDetailsToFirestore(
        controller.emailController.text,
        controller.nameController.text, // Pass the name from the nameController
        defaultRole,
        controller.phoneNumberController.text, // Pass the phoneNumber from the phoneNumberController
      );      // Sign-up successful, navigate to next screen
        Get.toNamed(AppRoutes.homeContainer1Screen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('Le mot de passe fourni est trop faible.');
        } else if (e.code == 'email-already-in-use') {
          print('Le compte existe déjà pour cet e-mail.');
        }
        // Show error message or handle the exception as per your requirement
      } catch (e) {
        print(e);
        // Show error message or handle the exception as per your requirement
      }
    }
  }

  postDetailsToFirestore(
  String email,
  String name,
  String role,
  String phoneNumber,
) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var user = FirebaseAuth.instance.currentUser;
  CollectionReference ref = firebaseFirestore.collection('users');
  DocumentReference docRef = ref.doc(); // Créez une référence de document sans ID

  // Ajoutez le document à Firestore et récupérez l'ID généré
  await docRef.set({
    'email': email,
    'displayName': name,
    'role': defaultRole,
    'phoneNumber':  '+225${controller.phoneNumberController.text}',
    'photoURL': '',
  });

  // Récupérez l'ID généré par Firebase
  String documentId = docRef.id;

  // Mettez à jour le document avec l'ID généré
  await docRef.update({'id': documentId});

  // Redirigez vers la page de connexion
  Get.toNamed(AppRoutes.logInScreen);
}


  onTapTxtAlreadyhavean() {
    Get.back();
  }
}
