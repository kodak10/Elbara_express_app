import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_button.dart';
import 'package:elbara_express/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_place_search/mapbox_place_search.dart';
//import 'package:mapbox_place_search/mapbox_place_search.dart';
import 'controller/send_package_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:google_places_autocomplete_flutter/google_places_autocomplete_flutter.dart';
import 'package:google_places_autocomplete_flutter/model/prediction.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:bottom_picker/bottom_picker.dart';

class SendPackageScreen extends StatefulWidget {
  SendPackageScreen({Key? key}) : super(key: key);

  @override
  State<SendPackageScreen> createState() => _SendPackageScreenState();
}

class _SendPackageScreenState extends State<SendPackageScreen> {
  final TextEditingController _compagny = TextEditingController();
  final TextEditingController _gare = TextEditingController();
  final TextEditingController _lieu = TextEditingController();
  final TextEditingController _code = TextEditingController();
  final TextEditingController _receptionneur = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  final TextEditingController _poids = TextEditingController();
  final TextEditingController _taille = TextEditingController();
  final TextEditingController livrer_a = TextEditingController();

  String? selectedValue;
  String? selectedGare;
  String? _selectedOption = 'Type de colis';
  bool useCompagnie =
      false; // Variable pour activer ou désactiver l'utilisation de la compagnie

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
  }

  final controller = MapController();
  final searchController = TextEditingController();

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
                                        'Type de colis',
                                        'Alimentaires',
                                        'Bijoux',
                                        'Documents',
                                        'Vêtements / Chaussures / Accessoires',
                                        'Autres'
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
                                          CustomTextFormField(
                                              hintText: "Lieu de ramassage".tr,
                                              suffix: Container(
                                                  margin: getMargin(
                                                      left: 15,
                                                      top: 15,
                                                      right: 15,
                                                      bottom: 15),
                                                  child: CustomImageView()),
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
                                          CustomTextFormField(
                                              hintText:
                                                  "Lieu de destination".tr,
                                              suffix: Container(
                                                  margin: getMargin(
                                                      left: 15,
                                                      top: 15,
                                                      right: 15,
                                                      bottom: 15),
                                                  child: CustomImageView()),
                                              suffixConstraints: BoxConstraints(
                                                  maxHeight:
                                                      getVerticalSize(54)))
                                        ],
                                      )
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
                                        Text("Nom de la personne".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSubheadline),
                                        CustomTextFormField(
                                          hintText: "Nom de la personne",
                                          controller: _receptionneur,
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
                                          controller: _telephone,
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
                                          hintText: "Saisissez",
                                          suffix: Padding(
                                            padding:
                                                getPadding(top: 16, bottom: 16),
                                          ),
                                          controller: _poids,
                                          margin: getMargin(top: 9),
                                          textInputAction: TextInputAction.done,
                                          variant: TextFormFieldVariant
                                              .OutlineGray300,
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
                                Text('Faire transiter le colis par une gare ?'),
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
                                                        value: program.id,
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
                                      width: double.infinity, // Pour que le FutureBuilder prenne 100% de la largeur
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
                                                    value: document
                                                        .id, // Utiliser l'ID du document comme valeur
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
                                      padding: getPadding(top: 19),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Taille".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSubheadline),
                                          CustomTextFormField(
                                            hintText: "Taille",
                                            suffix: Padding(
                                              padding: getPadding(
                                                  top: 16, bottom: 16),
                                              child: Text(
                                                "M",
                                                style: AppStyle
                                                    .txtSFProDisplayRegular16,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            controller: _taille,
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
                                      padding: getPadding(top: 19, bottom: 19),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              _openDateTimePicker(context);
                                            },
                                            child: Text('Date et heure de rammasage'),
                                          ),
                                          )
                                         
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
                      //saveDataToFirebase();
                      onTapNext();
                    }))));
  }

//   Future<void> _searchLocation(String query) async {
//     final mapBox = MapBoxSearch(
//       apiKey: 'pk.eyJ1Ijoia29kYWsxMCIsImEiOiJjbHRsaGoxN2IwbG4zMmpteTVkcnJ0amdrIn0.4fLrLLU399eoPCB7hE8b2g',
//     );
//     final response = await mapBox.search(
//       query,
//       limit: 5,
//     );
//     if (response != null && response.features != null && response.features.isNotEmpty) {
//       final feature = response.features.first;
//       final center = feature.center;
//       controller.move(LatLng(center[1], center[0]), 10.0);
//     } else {
//       // Handle no results found
//     }
//   }

  void _openDateTimePicker(BuildContext context) {
    BottomPicker.dateTime(
      title: '',
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      onSubmit: (date) {
        print(date);
      },
      onClose: () {
        print('');
      },
      minDateTime: DateTime(2021, 5, 1),
      maxDateTime: DateTime(2021, 8, 2),
      initialDateTime: DateTime(2021, 5, 1),
    ).show(context);
  }

  placesAutoCompleteTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GooglePlaceAutoCompleteFlutterTextField(
          textEditingController: livrer_a,
          googleAPIKey: "AIzaSyDz0tgBl1m2nUR1jM2RxhNnRNfA_K4d1sw",
          inputDecoration: InputDecoration(hintText: "La destination"),
          debounceTime: 800,
          countries: ["in", "fr"],
          types: ['country'],
          language: 'en',
          isLatLngRequired: true,
          getPlaceDetailWithLatLng: (Prediction prediction) {
            print("placeDetails" + prediction.lng.toString());
          },
          itmClick: (Prediction prediction) {
            livrer_a.text = prediction.description!;

            livrer_a.selection = TextSelection.fromPosition(
                TextPosition(offset: prediction.description!.length));
          }
          // default 600 ms ,
          ),
    );
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

  onTapNext() {
    // Collectez toutes les données de l'écran 1
    Map<String, dynamic> DataInfos = {
      'id_compagny': selectedValue,
      'gare': selectedGare,
      'lieu': livrer_a.text,
      'codeDuColis': _code.text,
      'nomDeLaPersonne': _receptionneur.text,
      'telephone': _telephone.text,
      'poids': _poids.text,
      'taille': _taille.text,

      // Autres champs de saisie de l'écran 1
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
