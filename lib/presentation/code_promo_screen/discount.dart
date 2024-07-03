import 'package:elbara_express/core/utils/snackbar.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/custom_floating_edit_text.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DiscountPageScreen extends StatefulWidget {
  const DiscountPageScreen({Key? key}) : super(key: key);

  @override
  State<DiscountPageScreen> createState() => _DiscountPageScreenState();
}

class _DiscountPageScreenState extends State<DiscountPageScreen> {
  bool _isLoading = false; // Variable pour gérer l'état du chargement
  bool _isPromoCodeValid = false;
  String _validPromoCode = "";
  final TextEditingController _promoCodeController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstant.whiteA700,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    _checkPromoCode();
  }

 Future<void> _checkPromoCode() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Récupérer le code promo de l'utilisateur connecté depuis Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          _validPromoCode = userDoc['codePromo'];
          if (_validPromoCode.isNotEmpty) {
            _promoCodeController.text = _validPromoCode;
            _isPromoCodeValid = true;
          }
        });
      }
    }
  }

  Future<void> _validatePromoCode(BuildContext context) async {
    String enteredCode = _promoCodeController.text;

    // Valider le code promo depuis Firestore
    QuerySnapshot promoCodes = await FirebaseFirestore.instance
        .collection('codePromo')
        .where('discount', isEqualTo: enteredCode)
        .get();

    if (promoCodes.docs.isNotEmpty) {
      setState(() {
        _isPromoCodeValid = true;
      });

      // Mettre à jour le champ codePromo de l'utilisateur connecté
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .update({'codePromo': enteredCode});
      }

      showCustomSnackBar(context, "Code promo appliqué avec succès!", isError: false);
    } else {
      showCustomSnackBar(context, "Code promo invalide.", isError: true);
    }
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
                Get.back();
              },
            ),
            centerTitle: true,
            title: AppbarSubtitle1(text: "Code Promo"),
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
                      "Veuillez entrer votre code promo pour obtenir une réduction.",
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: AppStyle.txtBody,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: _isPromoCodeValid,
                    child: CustomFloatingEditText(
                      controller: _promoCodeController,
                      labelText: "Code Promo",
                      hintText: "Code Promo",
                      margin: getMargin(top: 37),
                      prefixConstraints: BoxConstraints(
                        maxHeight: getSize(54),
                        minHeight: getSize(54),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          showCustomSnackBar(context, "Code promo non valide", isError: true);
                          return;
                        }
                        return null;
                      },
                    ),
                  ),
                  CustomButton(
                    height: getVerticalSize(54),
                    text: "Valider",
                    margin: getMargin(top: 30, bottom: 5),
                    onTap: () {
                      // Fermer le clavier
                      FocusScope.of(context).unfocus();
                      
                      if (_formKey.currentState!.validate()) {
                        _validatePromoCode(context);
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
}
