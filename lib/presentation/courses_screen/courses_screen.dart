import 'dart:convert';

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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'controller/courses_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CoursesScreen extends StatefulWidget {
  CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  CoursesController controller = Get.put(CoursesController());

  SelectionPopupModel? _typeColis;

  //final TextEditingController _depart = TextEditingController();
  TextEditingController _depart =
      TextEditingController(text: "9XXV+QFR Pharmacie Azur, Abidjan");

  //final TextEditingController _destination = TextEditingController();
  final TextEditingController _destination =
      TextEditingController(text: "AGORA KOUMASSI, 72PP+XW5, Abidjan");

  final TextEditingController _nomRecepteur = TextEditingController();
  final TextEditingController _telephoneRecepteur = TextEditingController();
  final TextEditingController _infosComplementaire = TextEditingController();

  int montantCourse = 0; // pARFAIT
  //int montantCourse = 2000;

  bool isLoading = false;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _selectedOption;
  List<String> _options = [];
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
    _fetchOptions();
  }

  Future<double> getDistanceFromGoogleMaps(String origin, String destination) async {
  try {
    // Remplacez YOUR_API_KEY par votre clé API Google Maps
    String url = 'https://maps.googleapis.com/maps/api/directions/json?origin=${Uri.encodeComponent(origin)}&destination=${Uri.encodeComponent(destination)}&key=AIzaSyB0gDkkr1joWeyRz-T7Wx0YBSUiOtt-DjY';

    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (json['status'] == 'OK') {
        // Obtenez la distance en mètres depuis la réponse JSON
        var distanceInMeters = json['routes'][0]['legs'][0]['distance']['value'];
        return distanceInMeters / 1000; // Convertir en kilomètres
      } else {
        print("Erreur de l'API Google Maps : ${json['status']}");
        throw Exception("Erreur de l'API Google Maps : ${json['status']}");
      }
    } else {
      print("Erreur lors de la requête : ${response.statusCode}");
      throw Exception("Erreur lors de la requête : ${response.statusCode}");
    }
  } catch (e) {
    print("Erreur lors du calcul de la distance : $e");
    throw Exception("Erreur lors du calcul de la distance : $e");
  }
}


  Future<void> _fetchOptions() async {
    // Fetch data from Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await firestore.collection('TypeColis').get();

    setState(() {
      _options = snapshot.docs.map((doc) => doc['name'] as String).toList();
    });
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
                    title: AppbarSubtitle1(text: "Courses".tr),
                    styleType: Style.bgFillWhiteA700),
                body: SingleChildScrollView(
                  child: GetBuilder<CoursesController>(
                    init: CoursesController(),
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
                                      isExpanded: true,
                                      items: _options.isNotEmpty
                                          ? _options
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList()
                                          : [
                                              DropdownMenuItem<String>(
                                                  child: Text('Chargement...'))
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

                    if (_selectedOption == null) {
                      showCustomSnackBar(
                          context, "Veuillez sélectionner le type de course",
                          isError: true);
                      return;
                    }

                    if (_destination.text.isEmpty) {
                      showCustomSnackBar(
                          context, "Veuillez entrer le lieu de destination",
                          isError: true);
                      return;
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

  int calculateFare(double distance) {
    // Définissez ici votre logique de calcul de tarif
    // Exemple: 500 FCFA de base + 100 FCFA par kilomètre
    int baseFare = 500; // Tarif de départ
    int farePerKm = 100; // Tarif par kilomètre

    return baseFare + (distance * farePerKm).toInt();
  }

  Future<void> calculateAndDisplayFare() async {
    try {
      double distance =
          await getDistanceFromGoogleMaps(_depart.text, _destination.text);
      int fare = calculateFare(distance);

      setState(() {
        montantCourse = fare;
      });
    } catch (e) {
      print("Erreur lors du calcul de la distance : $e");
    }
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

    // Calculez le tarif avant de continuer
    await calculateAndDisplayFare();

    // Simuler un délai de collecte de données
    await Future.delayed(Duration(seconds: 2));

    // Collectez toutes les données de l'écran 1
    Map<String, dynamic> DataInfos = {
      //'typeColis': _typeColis,
      'typeColis': _selectedOption,
      'typeService': "Courses",
      'nomReceptioneur': _nomRecepteur.text,
      'telephoneReceptioneur': '+225 ${_telephoneRecepteur.text}',
      'infosComplementaire': _infosComplementaire.text,
      'priceCalculed': montantCourse,
      'lieuDepart': _depart.text,
      'lieuDestination': _destination.text,
      'recevoirArgent': false,
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
  // Future<void> onTapNext(BuildContext context) async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   // Afficher la page de chargement
  //   showDialog(
  //     context: context,
  //     barrierDismissible:
  //         false, // Empêche de fermer la boîte de dialogue en cliquant à l'extérieur
  //     builder: (BuildContext context) {
  //       return LoadingPage(); // Vous devez créer et afficher votre widget LoadingPage
  //     },
  //   );

  //    // Calculez le tarif avant de continuer
  //   await calculateAndDisplayFare();

  //   // Simuler un délai de collecte de données
  //   await Future.delayed(Duration(seconds: 2));

  //   // Collectez toutes les données de l'écran 1
  //   Map<String, dynamic> DataInfos = {
  //     //'typeColis': _typeColis,
  //     'typeColis': _selectedOption,
  //     'typeService': "Courses",
  //     'nomReceptioneur': _nomRecepteur.text,
  //     'telephoneReceptioneur': '+225 ${_telephoneRecepteur.text}',
  //     'infosComplementaire': _infosComplementaire.text,
  //     'priceCalculed': montantCourse,
  //     'lieuDepart': _depart.text,
  //     'lieuDestination': _destination.text,
  //     'recevoirArgent': false,
  //   };

  //   // Passez les données à l'écran suivant et naviguez
  //   Get.toNamed(AppRoutes.selectCourierServiceScreen, arguments: DataInfos)
  //       ?.then((_) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     // Fermer la boîte de dialogue de chargement après la navigation
  //     Navigator.of(context)
  //         .pop(); // Cela fermera la boîte de dialogue de chargement
  //   });
  // }

  onTapArrowleft4() {
    Get.back();
  }
}
