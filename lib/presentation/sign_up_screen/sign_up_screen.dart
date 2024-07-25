import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/functions/register.dart';
import 'package:elbara_express/core/phone_field/countries.dart';
import 'package:elbara_express/core/utils/loading.dart';
import 'package:elbara_express/core/utils/snackbar.dart';
import 'package:elbara_express/core/utils/validation_functions.dart';
import 'package:elbara_express/presentation/verification_screen/verification_screen.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_floating_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'controller/sign_up_controller.dart';
import 'package:lottie/lottie.dart';

import 'package:url_launcher/url_launcher.dart';

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
  TextEditingController _phoneController = TextEditingController();

  var otpController = TextEditingController().obs;
  // var verificationId = ''.obs;
  // Rx<Country> selectedCountry = CountryPickerUtils.getCountryByPhoneCode('1').obs;

  final _promoCodeController = TextEditingController();

  bool _isPolicyAccepted = false;
  bool verifStatus = false;

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
  void dispose() {
    _promoCodeController.dispose();
    super.dispose();
  }

  bool visibility = false;
  bool codeSent = false;
  bool _isLoading = false;

  String verificationId = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool loading = false;
  String phoneNumber = '';
  Future<bool> checkPhoneNumberExists(String phoneNumber) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection('users')
        .where('phoneNumber', isEqualTo: '+225$phoneNumber')
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<bool> checkPseudoExists(String name) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firebaseFirestore
        .collection('users')
        .where('name', isEqualTo: name)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  void sendOTP() async {
    final phone = _phoneController.text.trim();
    print('phone: $phone');
    await _auth.verifyPhoneNumber(
  phoneNumber: '+225${_phoneController.text.trim()}',
  timeout: const Duration(seconds: 60),
  verificationCompleted: (PhoneAuthCredential credential) async {
    await _auth.signInWithCredential(credential);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationScreen(
          verificationId: verificationId,
        ),
      ),
    );
  },
  verificationFailed: (FirebaseAuthException e) {
    print("Phone number verification failed. Code: ${e.code}. Message: ${e.message}");
  },
  codeSent: (String verificationId, int? resendToken) {
    setState(() {
      this.verificationId = verificationId;
      this.codeSent = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationScreen(
          verificationId: this.verificationId,
        ),
      ),
    );
  },
  codeAutoRetrievalTimeout: (String verificationId) {
    this.verificationId = verificationId;
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
                appBar: CustomAppBar(
                  height: 79.0,
                  title: Image.asset(
                    'assets/images/appBar.png', // Chemin de votre image
                    height:
                        200.0, // Hauteur de l'image, ajustez selon vos besoins
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
                        padding: getPadding(
                            left: 16, top: 20, right: 16, bottom: 41),
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
                                      "Créez un compte en remplissant le formulaire ci-dessous."
                                          .tr,
                                      //overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
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
                                      showCustomSnackBar(context,
                                          "Le champs Pseudo est requis",
                                          isError: true);
                                      return;
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
                                      showCustomSnackBar(context,
                                          "Veuillez entrer une adresse e-mail valide",
                                          isError: true);
                                      return;
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: getVerticalSize(16),
                              ),
                              phone_number_field(
                               _phoneController,
                                (p0) {
                                  if (p0 == null || p0.number.isEmpty) {
                                    showCustomSnackBar(context,
                                        "Entrez un numéro de téléphone valide",
                                        isError: true);
                                    return;
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
                                        showCustomSnackBar(context,
                                            "Le champs Mot de passe est requis",
                                            isError: true);
                                        return;
                                      } else if (value.length < 8) {
                                        showCustomSnackBar(context,
                                            "Veuillez saisir un mot de passe à 8 chiffres",
                                            isError: true);
                                        return;
                                      }
                                      return null;
                                    }),
                              ),
                              SizedBox(
                                height: getVerticalSize(16),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _isPolicyAccepted,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isPolicyAccepted = value!;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        launch(
                                            "https://sites.google.com/view/elbara-express");
                                      },
                                      child: const Text(
                                        "En m'inscrivant, j'accepte la Politique de Confidentialité",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          //decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CustomButton(
                                height: getVerticalSize(54),
                                text: "S'inscrire".tr,
                                margin: getMargin(top: 30),
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (!_isPolicyAccepted) {
                                      showCustomSnackBar(context,
                                          'Vous devez accepter la politique de confidentialité pour vous inscrire.',
                                          isError: true);
                                    } else {
                                      // Retirer le focus de tous les champs de saisie
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoadingPage()),
                                      );

                                      onTapSignup(
                                          context); // Procéder à l'inscription
                                    }
                                  }
                                },
                              ),
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

  Future<void> onTapSignup(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controller.emailController.text,
          password: controller.passwordController.text,
        );

        // Vérifier si le pseudo est déjà utilisé
        bool isPseudoTaken =
            await checkPseudoExists(controller.nameController.text);
        if (isPseudoTaken) {
          Navigator.pop(context); // Fermer la page de chargement
          showCustomSnackBar(context, 'Un compte existe déjà avec ce Pseudo.',
              isError: true);
          return;
        }

        // Vérifier si le numéro de téléphone est déjà utilisé
        bool isPhoneNumberTaken =
            await checkPhoneNumberExists(controller.phoneNumberController.text);
        if (isPhoneNumberTaken) {
          Navigator.pop(context); // Fermer la page de chargement
          showCustomSnackBar(
              context, 'Un compte existe déjà avec ce numéro de téléphone.',
              isError: true);
          return;
        }

        // Envoyer le code de vérification par SMS
        //sendOtpCode();
        sendOTP();
        // await FirebaseAuth.instance.verifyPhoneNumber(
        //   phoneNumber: '+225${controller.phoneNumberController.text}',
        //   verificationCompleted: (PhoneAuthCredential credential) async {
        //     // Vérification automatique ou instantanée
        //     await FirebaseAuth.instance.signInWithCredential(credential);
        //   },
        //   verificationFailed: (FirebaseAuthException e) {
        //     Navigator.pop(context); // Fermer la page de chargement
        //     showCustomSnackBar(
        //         context, 'Échec de la vérification : ${e.message}',
        //         isError: true);
        //   },
        //   codeSent: (String verificationId, int? resendToken) {
        //     controller.verificationId.value = verificationId;
        //     Navigator.pop(context); // Fermer la page de chargement
        //     Get.toNamed(AppRoutes.verificationScreen); // Naviguer vers l'écran de vérification
        //   },
        //   codeAutoRetrievalTimeout: (String verificationId) {
        //     controller.verificationId.value = verificationId;
        //   },
        // );

        await postDetailsToFirestore(
            controller.emailController.text,
            controller.nameController.text,
            defaultRole,
            controller.phoneNumberController.text,
            _promoCodeController.text,
            verifStatus);

        PrefUtils.setIsSignIn(false); // Mettre à jour le statut de connexion

        // Naviguer vers l'écran d'accueil uniquement après la vérification
        // Si vous avez besoin de naviguer à la fin de tout, placez ici Get.toNamed(AppRoutes.homeContainer1Screen);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context); // Fermer la page de chargement
        // if (e.code == 'email-already-in-use') {
        //   showCustomSnackBar(context, 'Un compte existe déjà avec cet email',
        //       isError: true);
        // }
      } catch (e) {
        Navigator.pop(context); // Fermer la page de chargement
        print(e);
      }
    }
  }

  Future<void> postDetailsToFirestore(String email, String name, String role,
      String phoneNumber, String codePromo, bool verifStatus) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = firebaseFirestore.collection('users');

    // Utilisez l'UID de l'utilisateur comme ID du document
    DocumentReference docRef = ref.doc(user!.uid);

    // Ajoutez les détails de l'utilisateur à Firestore
    await docRef.set({
      'email': email,
      'displayName': name,
      'role': defaultRole,
      'phoneNumber': '+225${controller.phoneNumberController.text}',
      'photoURL':
          'https://firebasestorage.googleapis.com/v0/b/elbaraexpress-9b834.appspot.com/o/images%2Fuser.png?alt=media&token=d2065aab-9369-4c90-9438-f03c15a84fca',
      'codePromo': codePromo,
      'verif': verifStatus,
      'code': '',
    });

    // Récupérez l'ID généré par Firebase
    String documentId = docRef.id;

    // Mettez à jour le document avec l'ID généré
    await docRef.update({'id': documentId});

    // Redirigez vers la page de connexion
    // Get.toNamed(AppRoutes.verificationScreen);
  }

  onTapTxtAlreadyhavean() {
    Get.back();
  }
}
