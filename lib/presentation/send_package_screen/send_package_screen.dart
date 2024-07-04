import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/loading.dart';
import 'package:elbara_express/core/utils/snackbar.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_drop_down.dart';
import 'package:elbara_express/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:mapbox_place_search/mapbox_place_search.dart';
import 'controller/send_package_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class SendPackageScreen extends StatefulWidget {
  SendPackageScreen({Key? key}) : super(key: key);

  @override
  State<SendPackageScreen> createState() => _SendPackageScreenState();
}

class _SendPackageScreenState extends State<SendPackageScreen> {
  bool isLoading = false;

  SendPackageController controller = Get.put(SendPackageController());

  final TextEditingController _typeColis = TextEditingController();
  final TextEditingController _lieuRamassage = TextEditingController();
  final TextEditingController _destinationRamassage = TextEditingController();
  final TextEditingController _nomRecepteur = TextEditingController();
  final TextEditingController _telephoneRecepteur = TextEditingController();
  final TextEditingController _infosComplementaire = TextEditingController();
  final TextEditingController _dateRamassage = TextEditingController();

  final TextEditingController _compagny = TextEditingController();
  final TextEditingController _gare = TextEditingController();
  final TextEditingController _poids = TextEditingController(text: '0');
  final TextEditingController _taille = TextEditingController();

  String? selectedValue;
  String? selectedGare;
  String? _selectedOption = 'TYPE DE COLIS';
  String? birthday;

  int montantCourse = 0;

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
    initializeDateFormatting('fr_FR',null); // Initialisez les données de localisation pour le français
  }

  final searchController = TextEditingController();

  DateTime _selectedDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
final formattedDate = DateFormat.yMMMMd('fr').format(_selectedDateTime);

final birthdayTile = Material(
  color: Colors.transparent,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(
        height: getVerticalSize(12),
      ),
      Text(
        "Date de récupération",
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: AppStyle.txtSubheadline,
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 5.0),
      ),
      CupertinoDateTextBox(
        initialValue: _selectedDateTime,
        onDateChange: onBirthdayChange,
        hintText: formattedDate,
      ),
    ],
  ),
);


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
                    title: AppbarSubtitle1(text: "Expéditions".tr),
                    styleType: Style.bgFillWhiteA700),
                body: SingleChildScrollView(
                  child: GetBuilder<SendPackageController>(
                    init: SendPackageController(),
                    builder: (controller) => Container(
                      child: Padding(
                        padding: getPadding(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 20),

                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: DropdownButton<String>(
                                      value: _selectedOption,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedOption = newValue;
                                        });
                                      },
                                      isExpanded:
                                          true, // Permet au bouton de remplir l'espace horizontalement
                                      items: <String>[
                                        'TYPE DE COLIS',
                                        'Autres',
                                        'Documents',
                                        'Produits Vivriers',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Padding(
                                      padding: getPadding(
                                        top: 1,
                                        bottom: 1,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection("compagnie")
                                                .snapshots(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasError) {
                                                return Center(
                                                  child: Text(
                                                      "Some error occured ${snapshot.error}"),
                                                );
                                              }
                                              List<DropdownMenuItem>
                                                  programItems = [];
                                              if (!snapshot.hasData) {
                                                return const CircularProgressIndicator();
                                              } else {
                                                final selectProgram = snapshot
                                                    .data?.docs.reversed
                                                    .toList();
                                                if (selectProgram != null) {
                                                  for (var program
                                                      in selectProgram) {
                                                    programItems.add(
                                                      DropdownMenuItem(
                                                        value: program['name'],
                                                        child: Text(
                                                          program['name'],
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                }
                                                return Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 15,
                                                      left: 15,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.grey,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: DropdownButton(
                                                      underline:
                                                          const SizedBox(),
                                                      isExpanded: true,
                                                      hint: const Text(
                                                        "La compagnie",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      value:
                                                          selectedValue, //parfait
                                                      items: programItems,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          selectedValue = value;
                                                          //selectedGare = "";
                                                        });
                                                      },
                                                    ),
                                                    
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),                                
                              ],
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Padding(
                                      padding: getPadding(
                                        top: 1,
                                        bottom: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          StreamBuilder<QuerySnapshot>(
                                            stream: FirebaseFirestore.instance.collection("gare").where('compagnie', isEqualTo: selectedValue).snapshots(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasError) {
                                                return Center(child: Text("Une erreur est survenue: ${snapshot.error}"));
                                              }
                                              List<DropdownMenuItem<String>> gareItems = [];
                                              if (!snapshot.hasData) {
                                                return CircularProgressIndicator();
                                              } else {
                                                final gares = snapshot.data?.docs;
                                                if (gares != null) {
                                                  for (var gare in gares) {
                                                    gareItems.add(
                                                      DropdownMenuItem(
                                                        value: gare['nom'],
                                                        child: Text(gare['nom']),
                                                      ),
                                                    );
                                                  }
                                                }
                                                return Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Container(
                                                    padding: const EdgeInsets.only(right: 15, left: 15),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.grey, width: 1),
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    child: DropdownButton<String>(
                                                      underline: SizedBox(),
                                                      isExpanded: true,
                                                      hint: Text("La gare", style: TextStyle(fontSize: 14)),
                                                      value: selectedGare,
                                                      items: gareItems,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          selectedGare = value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
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
                                              hintText:
                                                  "Api Google Maps"
                                                      .tr,
                                              controller: _lieuRamassage,
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
                                              hintText:
                                                  "Api Google Maps"
                                                      .tr,
                                              controller: _destinationRamassage,
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
                                          Text("Poids".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSubheadline),
                                          CustomTextFormField(
                                            hintText: "Poids",
                                            suffix: Padding(
                                              padding: getPadding(
                                                  top: 16, bottom: 16),
                                              child: Text(
                                                "Kg",
                                                style: AppStyle
                                                    .txtSFProDisplayRegular16,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            controller: _poids,
                                            margin: getMargin(top: 9),
                                            textInputAction:
                                                TextInputAction.done,
                                            variant: TextFormFieldVariant
                                                .OutlineGray300,
                                            prefix: Container(
                                                margin: getMargin(
                                                    left: 16,
                                                    top: 15,
                                                    right: 16,
                                                    bottom: 15),
                                                child: CustomImageView(
                                                    svgPath:
                                                        ImageConstant.imgMail)),
                                            prefixConstraints: BoxConstraints(
                                                maxHeight: getVerticalSize(54),),
                                                textInputType: TextInputType.phone,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20), // Adjust as needed
                                  Expanded(
                                    child: Padding(
                                      padding: getPadding(top: 5, bottom: 19),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          //selectedText,
                                          const SizedBox(height: 5),
                                          birthdayTile
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
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
                                        Text("Information complémentaires".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSubheadline),
                                        CustomTextFormField(
                                          hintText: "Saisissez des informations complémentaire ici.",
                                          controller: _infosComplementaire,
                                          suffix: Padding(
                                            padding:
                                                getPadding(top: 16, bottom: 16),
                                          ),
                                          margin: getMargin(top: 9),
                                          textInputAction: TextInputAction.done,
                                          variant: TextFormFieldVariant
                                              .OutlineGray300,
                                          maxLines:
                                              2, // Ajout de cette ligne pour permettre le champ sur deux lignes
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
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: CustomButton(
                    height: getVerticalSize(54),
                    text: "Suivant".tr,
                    margin: getMargin(left: 16, right: 16, bottom: 40),
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      if (_selectedOption =='TYPE DE COLIS') {
                        showCustomSnackBar(context, "Veuillez sélectionner le type de colis.", isError: true);
                        return;
                      }

                      if (selectedValue == null) {
                        showCustomSnackBar(context, "Veuillez sélectionner la compagnie.", isError: true);
                        return;
                      }

                      if (selectedGare == null) {
                        showCustomSnackBar(context, "Veuillez sélectionner une gare de destination.", isError: true);
                        return;
                      }
                      
                      if (_lieuRamassage.text.isEmpty) {
                        showCustomSnackBar(context, "Veuillez entrer le lieu de ramassage.", isError: true);
                        return;
                      }

                     if (_poids.text == "0" || _poids.text.isEmpty) {
                        showCustomSnackBar(context, "Veuillez entrer une estimation du poids du colis", isError: true);
                        return;
                      }

                      if (_telephoneRecepteur.text.isEmpty) {
                        showCustomSnackBar(context, "Veuillez entrer le numéro d'une personne à contacter.", isError: true);
                        return;
                      }

                
                      onTapNext(context);
                     
                    },
                    
                    ))));
  }

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
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
    barrierDismissible: false, // Empêche de fermer la boîte de dialogue en cliquant à l'extérieur
    builder: (BuildContext context) {
      return LoadingPage(); // Vous devez créer et afficher votre widget LoadingPage
    },
  );

  // Simuler un délai de collecte de données
  await Future.delayed(Duration(seconds: 2));

    // Collectez toutes les données de l'écran 1
    Map<String, dynamic> DataInfos = {
      'typeColis': _selectedOption,
      'nomReceptioneur': _nomRecepteur.text,
      'telephoneReceptioneur': _telephoneRecepteur.text,
      'infosComplementaire': _infosComplementaire.text,
      'idCompagny': selectedValue,
      'gare': selectedGare,
      'poids': _poids.text,
      'dateRamassage': _selectedDateTime,
      'priceCalculed' : montantCourse,
      'lieu_depart': _lieuRamassage.text,
      'lieu_arrive': _destinationRamassage.text,

    };

   
    // Passez les données à l'écran suivant et naviguez
  Get.toNamed(AppRoutes.selectCourierServiceScreen, arguments: DataInfos)?.then((_) {
    setState(() {
      isLoading = false;
    });
    // Fermer la boîte de dialogue de chargement après la navigation
    Navigator.of(context).pop(); // Cela fermera la boîte de dialogue de chargement
  });

    // Get.toNamed(
    //   AppRoutes.selectCourierServiceScreen,
    //);
  }

  onTapArrowleft4() {
    Get.back();
  }
}
