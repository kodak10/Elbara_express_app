import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/loading.dart';
import 'package:elbara_express/core/utils/snackbar.dart';
import 'package:elbara_express/presentation/livraisons_screen/controller/livraisons_controller.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_drop_down.dart';
import 'package:elbara_express/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'controller/livraisons_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class LivraisonsScreen extends StatefulWidget {
  LivraisonsScreen({Key? key}) : super(key: key);

  @override
  State<LivraisonsScreen> createState() => _LivraisonsScreenState();
}

class _LivraisonsScreenState extends State<LivraisonsScreen> {
  LivraisonsController controller = Get.put(LivraisonsController());

  SelectionPopupModel? _modePaiement;

  final TextEditingController _depart = TextEditingController();
  final TextEditingController _destination = TextEditingController();

  final TextEditingController _nomRecepteur = TextEditingController();
  final TextEditingController _telephoneRecepteur = TextEditingController();
  final TextEditingController _infosComplementaire = TextEditingController();
  final TextEditingController _montantController = TextEditingController();
  final TextEditingController _numeroReception = TextEditingController();

  int montantCourse = 0;
  bool isLoading = false;
  bool recevoirArgent = false;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstant.whiteA700,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    initializeDateFormatting('fr_FR',
        null); // Initialisez les données de localisation pour le français
  }

  final searchController = TextEditingController();

  DateTime _selectedDateTime = DateTime.now();

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
                          onTapArrowleft4();
                        }),
                    centerTitle: true,
                    title: AppbarSubtitle1(text: "Livraisons".tr),
                    styleType: Style.bgFillWhiteA700),
                body: SingleChildScrollView(
                  child: GetBuilder<LivraisonsController>(
                    init: LivraisonsController(),
                    builder: (controller) => Container(
                      child: Padding(
                        padding: getPadding(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 20),

                            Row(
                              children: [
                                CustomImageView(
                                  svgPath: ImageConstant.imgTimeLineIcon,
                                ),
                                SizedBox(
                                  width: getHorizontalSize(16),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextFormField(
                                              hintText: "Api Google Maps".tr,
                                              controller: _depart,
                                              suffix: Container(
                                                  margin: getMargin(
                                                      left: 15,
                                                      top: 15,
                                                      right: 15,
                                                      bottom: 15),
                                                  child: CustomImageView(
                                                      onTap: () {
                                                        // Get.toNamed(AppRoutes
                                                        //     .selectDeliveryAddressScreen);
                                                      },
                                                      svgPath: ImageConstant
                                                          .imgLocationBlack900)),
                                              suffixConstraints: BoxConstraints(
                                                  maxHeight:
                                                      getVerticalSize(54)))
                                        ],
                                      ),
                                      SizedBox(
                                        height: getVerticalSize(16),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: getVerticalSize(8),
                                          ),
                                          CustomTextFormField(
                                              hintText: "Api Google Maps".tr,
                                              controller: _destination,
                                              suffix: Container(
                                                  margin: getMargin(
                                                      left: 15,
                                                      top: 15,
                                                      right: 15,
                                                      bottom: 15),
                                                  child: CustomImageView(
                                                      onTap: () {
                                                        // Get.toNamed(AppRoutes
                                                        //     .selectDeliveryAddressScreen);
                                                      },
                                                      svgPath: ImageConstant
                                                          .imgLocationBlack900)),
                                              suffixConstraints: BoxConstraints(
                                                  maxHeight:
                                                      getVerticalSize(54)))
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(16),
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: getPadding(top: 19),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Personne en cas d'urgence".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSubheadline),
                                        CustomTextFormField(
                                          hintText: "En cas d'urgence",
                                          controller: _nomRecepteur,
                                          margin: getMargin(top: 9),
                                          textInputAction: TextInputAction.done,
                                          variant: TextFormFieldVariant
                                              .OutlineGray300,
                                          prefixConstraints: BoxConstraints(
                                              maxHeight: getVerticalSize(54)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20), // Adjust as needed
                                Expanded(
                                  child: Padding(
                                    padding: getPadding(top: 19),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Téléphone".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSubheadline),
                                        CustomTextFormField(
                                          hintText: "Téléphone",
                                          controller: _telephoneRecepteur,
                                          margin: getMargin(top: 9),
                                          textInputAction: TextInputAction.done,
                                          variant: TextFormFieldVariant
                                              .OutlineGray300,
                                          prefixConstraints: BoxConstraints(
                                              maxHeight: getVerticalSize(54)),
                                          textInputType: TextInputType.phone,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(16),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: getPadding(top: 19),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Information complémentaire".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSubheadline),
                                        CustomTextFormField(
                                          hintText:
                                              "Saisissez des informations complémentaire ici.",
                                          controller: _infosComplementaire,
                                          suffix: Padding(
                                            padding:
                                                getPadding(top: 16, bottom: 16),
                                          ),
                                          margin: getMargin(top: 9),
                                          textInputAction: TextInputAction.done,
                                          variant: TextFormFieldVariant
                                              .OutlineGray300,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(16),
                            ),
                            SwitchListTile(
                              title: Text("Recevoir de l'argent ?"),
                              value: recevoirArgent,
                              onChanged: (bool value) {
                                setState(() {
                                  recevoirArgent = value;
                                });
                              },
                            ),
                            
                            if (recevoirArgent)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Montant à recevoir",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8), // Espace entre le texte et le champ
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFormField(
                                hintText: "Montant",
                                controller: _montantController,
                                textInputAction: TextInputAction.done,
                                variant: TextFormFieldVariant.OutlineGray300,
                                prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(54)),
                                textInputType: TextInputType.number,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.help_outline),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Information"),
                                      content: Text("1% de cette somme vous sera prélévé."),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: getVerticalSize(8)),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: getPadding(top: 19),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mode de reception".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSubheadline,
                                ),
                                SizedBox(height: getVerticalSize(8)), // Espacement entre le texte et le champ
                                CustomDropDown(
                                  padding: DropDownPadding.PaddingT17,
                                  icon: Container(
                                    margin: getMargin(left: 0, right: 15),
                                    child: CustomImageView(svgPath: ImageConstant.imgArrowdown),
                                  ),
                                  hintText: "Mode".tr,
                                  items: controller.addAddressModelObj.value.dropdownItemList1.value,
                                  onChanged: (value) {
                                    setState(() {
                                      _modePaiement = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: getHorizontalSize(10)),
                        Expanded(
                          child: Padding(
                            padding: getPadding(top: 19),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Numéro de téléphone".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtSubheadline,
                                ),
                                SizedBox(height: getVerticalSize(8)), // Espacement entre le texte et le champ
                                CustomTextFormField(
                                  hintText: "ex:  0101010101",
                                  controller: _numeroReception,
                                  textInputAction: TextInputAction.done,
                                  variant: TextFormFieldVariant.OutlineGray300,
                                  prefixConstraints: BoxConstraints(
                                    maxHeight: getVerticalSize(54),
                                  ),
                                  textInputType: TextInputType.phone,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  
                                SizedBox(
                                  height: getVerticalSize(16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: CustomButton(
                  height: getVerticalSize(54),
                  text: "Suivant".tr,
                  margin: getMargin(left: 16, right: 16, bottom: 40),
                  onTap: () {
                    // Fermer le clavier
                    FocusScope.of(context).unfocus();

                   

                    if (_depart.text.isEmpty) {
                      showCustomSnackBar(context,
                          "Veuillez entrer le lieu de récupération du colis",
                          isError: true);
                      return;
                    }

                    if (_destination.text.isEmpty) {
                      showCustomSnackBar(context,
                          "Veuillez entrer le lieu de destination du colis",
                          isError: true);
                      return;
                    }

                    if (recevoirArgent) {
                      if (_montantController.text.isEmpty) {
                        showCustomSnackBar(context, "Veuillez entrer le montant", isError: true);
                        return;
                      }
                      if (_modePaiement == null) {
                        showCustomSnackBar(context, "Veuillez sélectionner un mode de reception des fonds", isError: true);
                        return;
                      }
                      if (_numeroReception.text.isEmpty) {
                        showCustomSnackBar(context, "Veuillez entrer le numéro téléphone", isError: true);
                        return;
                      }
                    }

                    onTapNext(context);
                  },
                ))));
  }

  onTapDeliverto() {
    Get.toNamed(
      AppRoutes.selectDeliveryAddressScreen,
    );
  }

  onTapPickup() {
    Get.toNamed(
      AppRoutes.selectPickupAddressScreen,
    );
  }

  Future<void> onTapNext(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    // Afficher la page de chargement
    showDialog(
      context: context,
      barrierDismissible:
          false, // Empêche de fermer la boîte de dialogue en cliquant à l'extérieur
      builder: (BuildContext context) {
        return LoadingPage(); // Vous devez créer et afficher votre widget LoadingPage
      },
    );

    // Simuler un délai de collecte de données
    await Future.delayed(Duration(seconds: 2));

    // Collectez toutes les données de l'écran 1
    Map<String, dynamic> DataInfos = {
      //'typeColis': _typeColis,
      'nomReceptioneur': _nomRecepteur.text,
      'telephoneReceptioneur': '+225 ${_telephoneRecepteur.text}',
      'infosComplementaire': _infosComplementaire.text,
      'priceCalculed': montantCourse,
      'lieuDepart': _depart.text,
      'lieuDestination': _destination.text,
      'recevoirArgent': recevoirArgent,
      'modePaiement': _modePaiement,
      'numeroDeReception': '+225${_numeroReception.text}',
    };

    // Passez les données à l'écran suivant et naviguez
    Get.toNamed(AppRoutes.selectCourierServiceScreen, arguments: DataInfos)
        ?.then((_) {
      setState(() {
        isLoading = false;
      });
      // Fermer la boîte de dialogue de chargement après la navigation
      Navigator.of(context)
          .pop(); // Cela fermera la boîte de dialogue de chargement
    });
  }

  onTapArrowleft4() {
    Get.back();
  }
}
