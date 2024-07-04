import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
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
  final TextEditingController _poids = TextEditingController();
  final TextEditingController _taille = TextEditingController();

  String? selectedValue;
  String? selectedGare;
  String? _selectedOption = 'TYPE DE SERVICES';
  bool useCompagnie =
      false; // Variable pour activer ou désactiver l'utilisation de la compagnie
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
    initializeDateFormatting('fr_FR',
        null); // Initialisez les données de localisation pour le français
  }

  SelectionPopupModel? selectedD1;
  SelectionPopupModel? selectedD2;

  void calculateMontantCourse() {
    if (selectedD1 == null || selectedD2 == null) {
      montantCourse = 0;
      return;
    }

    String value1 = selectedD1!.title;

    String value2 = selectedD2!.title;
    print('val: $value1');
    print('val: $value2');


    if (value1 == value2) {
      montantCourse = 1000;
    } else if (value1 == 'Bassam' ||
        value1 == 'Songon' ||
        value2 == 'Bassam' ||
        value2 == 'Songon') {
      montantCourse = 3000;
    } else if (value1 == 'Anyama' || value2 == 'Anyama') {
      if (value1 == 'Abobo' || value2 == 'Abobo') {
        montantCourse = 1000;
      } else {
        montantCourse = 2500;
      }
    }
    else if (value1 == 'Bingerville' || value2 == 'Bingerville') {
      montantCourse = 2000;
    }

    if (value1 == value2) {
    montantCourse = 1000;
  } else if ((value1 == 'Bouaké - Air France' && value2 == 'Bouaké - Koko') ||
             (value1 == 'Bouaké - Koko' && value2 == 'Bouaké - Air France')) {
    montantCourse = 700;
  } else if ((value1 == 'Bouaké - Air France' && value2 == 'Bouaké - Dar-Es-Salam') ||
             (value1 == 'Bouaké - Dar-Es-Salam' && value2 == 'Bouaké - Air France') ||
             (value1 == 'Bouaké - Koko' && value2 == 'Bouaké - Dar-Es-Salam') ||
             (value1 == 'Bouaké - Dar-Es-Salam' && value2 == 'Bouaké - Koko')) {
    montantCourse = 600;
  } else if ((value1 == 'Bouaké - Air France' && value2 == 'Bouaké - Commerce') ||
             (value1 == 'Bouaké - Commerce' && value2 == 'Bouaké - Air France') ||
             (value1 == 'Bouaké - Koko' && value2 == 'Bouaké - Commerce') ||
             (value1 == 'Bouaké - Commerce' && value2 == 'Bouaké - Koko') ||
             (value1 == 'Bouaké - Dar-Es-Salam' && value2 == 'Bouaké - Commerce') ||
             (value1 == 'Bouaké - Commerce' && value2 == 'Bouaké - Dar-Es-Salam') ||
             (value1 == 'Bouaké - Zone' && value2 == 'Bouaké - Commerce') ||
             (value1 == 'Bouaké - Commerce' && value2 == 'Bouaké - Zone') ||
             (value1 == 'Bouaké - Sokoura' && value2 == 'Bouaké - Commerce') ||
             (value1 ==  'Bouaké - Commerce' && value2 == 'Bouaké - Sokoura')) {
    montantCourse = 500;
  } else if ((value1 == 'Bouaké - Air France' && value2 == 'Bouaké - Zone') ||
             (value1 == 'Bouaké - Zone' && value2 == 'Bouaké - Air France') ||
             (value1 == 'Bouaké - Koko' && value2 == 'Bouaké - Zone') ||
             (value1 == 'Bouaké - Zone' && value2 == 'Bouaké - Koko') ||
             (value1 == 'Bouaké - Dar-Es-Salam' && value2 == 'Bouaké - one') ||
             (value1 == 'Bouaké - Zone' && value2 == 'Bouaké - Dar-Es-Salam') ||
             (value1 == 'Bouaké - Sokoura' && value2 == 'Bouaké - Zone') ||
             (value1 == 'Bouaké - Zone' && value2 == 'Bouaké - Sokoura')) {
    montantCourse = 500;
  } else if ((value1 == 'Bouaké - Air France' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Air France') ||
             (value1 == 'Bouaké - Koko' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Koko') ||
             (value1 == 'Bouaké - Dar-Es-Salam' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Dar-Es-Salam') ||
             (value1 == 'Bouaké - Commerce' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Commerce') ||
             (value1 == 'Bouaké - Zone' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Zone') ||
             (value1 == 'Bouaké - Ahougnanssou' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Ahougnanssou') ||
             (value1 == 'Bouaké - NDakro' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké - NDakro') ||
             (value1 == 'Bouaké - Gonfreville' && value2 == 'Bouaké - Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké - Gonfreville') ||
             (value1 == 'Bouaké - Kennedy' && value2 == 'Bouaké - Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké - Kennedy') ||
             (value1 == 'Bouaké - Kondéyaokro' && value2 == 'Bouaké - Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké - Kondéyaokro') ||
             (value1 == 'Bouaké - Nimbo' && value2 == 'Bouaké - Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké - Nimbo') ||
             (value1 == 'Bouaké - Dougouba' && value2 == 'Bouaké - Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké - Dougouba') ||
             (value1 == 'Bouaké - Sokoura' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Sokoura') ||
             (value1 == 'Bouaké - Yaokro' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Yaokro') ||
             (value1 == 'Bouaké - Djébonoua' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Djébonoua') ||
             (value1 == 'Bouaké - Brobo' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Brobo') ||
             (value1 == 'Bouaké - Abobo' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Abobo') ||
             (value1 == 'Bouaké - Toumanguie' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Toumanguie') ||
             (value1 == 'Bouaké - Petessou' && value2 == 'Bouaké -  Belleville') ||
             (value1 == 'Bouaké - Belleville' && value2 == 'Bouaké -  Petessou'));
     else {
      montantCourse = 1000;
    }

    setState(() {});
  }

  void onSelected(SelectionPopupModel value) {
    setState(() {
      selectedD1 = value;
      calculateMontantCourse();
      print('Montant de la course: $montantCourse F');
      setState(() {}); // Ajoutez ceci pour forcer la mise à jour de l'affichage
    });
  }

  void onSelected1(SelectionPopupModel value) {
    setState(() {
      selectedD2 = value;
      calculateMontantCourse();
      print('Montant de la course: $montantCourse F');
      setState(() {}); // Ajoutez ceci pour forcer la mise à jour de l'affichage
    });
  }

  final searchController = TextEditingController();

  DateTime _selectedDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        DateFormat.Md('fr_FR').format(_selectedDateTime);

    final birthdayTile = Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Date de récupération",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtSubheadline),
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

    //return birthdayTile;

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
                    title: AppbarSubtitle1(text: "Envoyer un colis".tr),
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
                                        'TYPE DE SERVICES',
                                        'COURSES',
                                        // 'DEMENAGEMENTS',
                                        'LIVRAISONS',
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
                                          CustomDropDown(
                                              padding:
                                                  DropDownPadding.PaddingT17,
                                              icon: Container(
                                                  margin: getMargin(
                                                      left: 30, right: 15),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowdown)),
                                              hintText: "La zone de récupération".tr,
                                              margin: getMargin(top: 16),
                                              items: controller
                                                  .addAddressModelObj
                                                  .value
                                                  .dropdownItemList
                                                  .value,
                                              onChanged: (value) {
                                                controller.onSelected(value);
                                                setState(() {
                                                  selectedD1 = value;
                                                });
                                              }),
                                          SizedBox(
                                            height: getVerticalSize(8),
                                          ),
                                          CustomTextFormField(
                                              hintText:
                                                  "Précissez le lieu de récupération"
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
                                          CustomDropDown(
                                              padding:
                                                  DropDownPadding.PaddingT17,
                                              icon: Container(
                                                  margin: getMargin(
                                                      left: 30, right: 15),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgArrowdown)),
                                              hintText: "La zone de destination".tr,
                                              margin: getMargin(top: 16),
                                              items: controller
                                                  .addAddressModelObj
                                                  .value
                                                  .dropdownItemList1
                                                  .value,
                                              onChanged: (value) {
                                                controller.onSelected1(value);
                                                 setState(() {
                                                  selectedD2 = value;
                                                });
                                              }),
                                          SizedBox(
                                            height: getVerticalSize(8),
                                          ),
                                          CustomTextFormField(
                                              hintText:
                                                  "Précissez le lieu de destination"
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

                            // Switch pour activer ou désactiver l'utilisation de la compagnie
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Faire transiter le colis par une compagnie ?'),
                                Switch(
                                  value: useCompagnie,
                                  onChanged: (value) {
                                    setState(() {
                                      useCompagnie = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                            
                            

                            // Affichage des informations sur la gare si la compagnie est sélectionnée et le Switch activé
                            Visibility(
                              visible: useCompagnie,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: getPadding(
                                        top: 19,
                                        bottom: 10,
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
                            ),

                            Visibility(
                              visible: useCompagnie,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double
                                          .infinity, // Pour que le FutureBuilder prenne 100% de la largeur
                                      child: FutureBuilder<QuerySnapshot>(
                                        future: FirebaseFirestore.instance
                                            .collection('gare')
                                            .where('compagnie',
                                                isEqualTo: selectedValue)
                                            .get(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          }
                                          if (snapshot.hasError) {
                                            return Text(
                                                'Erreur: ${snapshot.error}');
                                          }
                                          if (!snapshot.hasData ||
                                              snapshot.data!.docs.isEmpty) {
                                            return Text(
                                                'Aucune Gare Disponible');
                                          }
                                          return Column(
                                            children: [
                                              DropdownButton<String>(
                                                hint: const Text(
                                                    'Choisir une gare'),
                                                value: selectedGare,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    selectedGare = newValue!;
                                                  });
                                                },
                                                items: snapshot.data!.docs.map(
                                                    (DocumentSnapshot
                                                        document) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: document['nom'],
                                                    child:
                                                        Text(document['nom']),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Visibility(
                              visible: useCompagnie,
                              child: Row(
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
                                                maxHeight: getVerticalSize(54)),
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
                      if (_selectedOption =='TYPE DE SERVICES') {
                        // Afficher un SnackBar si _destinationRamassage est vide
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez sélectionner un type de service'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      if (selectedD1 == null) {
                        // Afficher un SnackBar si selectedD1 est null
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez sélectionner une zone de récupération'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      if (_lieuRamassage.text.isEmpty) {
                        // Afficher un SnackBar si _lieuRamassage est vide
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez préciser le lieu de récupération'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      if (selectedD2 == null) {
                        // Afficher un SnackBar si selectedD2 est null
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez sélectionner une zone de destination'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      
                      

                       if (_destinationRamassage.text.isEmpty) {
                        // Afficher un SnackBar si _destinationRamassage est vide
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Veuillez préciser le lieu de destination'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }

                      // Si tous les champs sont remplis, continuer avec la logique de l'application
                      calculateMontantCourse();
                      
                      onTapNext();
                     
                    },
                    
                    ))));
  }

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }

  // void saveUserData() {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     String? name =
  //         user.displayName; // Obtenez le nom de l'utilisateur connecté
  //     String? contact =
  //         user.phoneNumber; // Obtenez le contact de l'utilisateur connecté
  //     if (name != null && contact != null) {
  //       FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(user.uid)
  //           .set({
  //         'displayName': name,
  //         'contact': contact,
  //       }).then((value) {
  //         print('Données utilisateur enregistrées avec succès');
  //       }).catchError((error) {
  //         print(
  //             "Erreur lors de l'enregistrement des données utilisateur: $error");
  //       });
  //     } else {
  //       print('Impossible de récupérer le nom ou le contact de l\'utilisateur');
  //     }
  //   } else {
  //     print('Aucun utilisateur connecté');
  //   }
  // }

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

  onTapNext() {
    // Collectez toutes les données de l'écran 1
    Map<String, dynamic> DataInfos = {
      'type_colis': _selectedOption,
      'nom_receptioneur': _nomRecepteur.text,
      'telephone_receptioneur': _telephoneRecepteur.text,
      'infos_complementaire': _infosComplementaire.text,
      'transiter_par_gare': useCompagnie,
      'id_compagny': selectedValue,
      'gare': selectedGare,
      'poids': _poids.text,
      'taille': _taille.text,
      'date_ramassage': _selectedDateTime,
      'priceCalculed' : montantCourse,
      'lieu_depart': '${selectedD1?.title ?? ''},${_lieuRamassage.text}',
      'lieu_arrive': '${selectedD2?.title ?? ''},${_destinationRamassage.text}',

    };

    // Passez les données à l'écran suivant et naviguez
    Get.toNamed(
      AppRoutes.selectCourierServiceScreen,
      arguments: DataInfos,
    );

    // Get.toNamed(
    //   AppRoutes.selectCourierServiceScreen,
    //);
  }

  onTapArrowleft4() {
    Get.back();
  }
}
