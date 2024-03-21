import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/core/utils/image_constant.dart';
import 'package:elbara_express/core/utils/size_utils.dart';
import 'package:elbara_express/routes/app_routes.dart';
import 'package:elbara_express/theme/app_decoration.dart';
import 'package:elbara_express/theme/app_style.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:elbara_express/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../utils/constants.dart';
import '../widgets/latest_orders.dart';
import '../widgets/location_slider.dart';



class DashboardGestionnaireGare extends StatefulWidget {
  @override
  _DashboardGestionnaireGareState createState() =>
      _DashboardGestionnaireGareState();
}

class _DashboardGestionnaireGareState extends State<DashboardGestionnaireGare> {
  late User? _user;
  int _activeIndex = 0;

  

  @override
  void initState() {
    _user = FirebaseAuth.instance.currentUser;
    super.initState();
  }
   final User? user = FirebaseAuth.instance.currentUser;
   



  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    ScreenUtil.init(context);

    return Scaffold(
      //appBar: BottomBarDefault(),
      
      backgroundColor: Constants.primaryColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0.0,
            top: -20.0,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                "assets/images/washing_machine_illustration.png",
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              //padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kToolbarHeight),
                  _buildUserInfo(),
                  SizedBox(height: 50.0),
                  _buildStatisticsSection(),
                  //_buildLatestOrders(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
  return StreamBuilder<DocumentSnapshot>(
    stream: FirebaseFirestore.instance.collection('users').doc(_user!.uid).snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Erreur : ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      }

      // Récupérer les données de l'utilisateur
      var userData = snapshot.data!.data() as Map<String, dynamic>;
      String? company = userData['compagnie'];
      String? station = userData['gare'];

      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Content de vous revoir ! ",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                    ),
                    TextSpan(
                      text: "Compagnie: $company, Gare: $station",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            Image.asset(
              "assets/images/user.png",
              height: 80,
              width: 80,
            )
          ],
        ),
      );
    },
  );
}


  Widget _buildStatisticsSection() {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 200.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        color: Constants.scaffoldBackgroundColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Statistiques",
              style: TextStyle(
                color: Color.fromRGBO(19, 22, 33, 1),
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(height: 7.0),
          Container(
            height: ScreenUtil().setHeight(100.0),
            child: Center(
              child: LocationSlider(),
            ),
          ),
          SizedBox(height: 16.0),
          _buildLatestOrders()
        ],
      ),
    );
  }

  Widget _buildLatestOrders() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              "Commandes récentes",
              style: AppStyle.txtSFProTextBold20,
            ),
          ),
          StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc(user!.uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Erreur : ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        // Récupérer les données du document utilisateur
        var userData = snapshot.data!.data() as Map<String, dynamic>;
        String? compagnieId = userData['compagnie'];
        String? gare = userData['gare'];

    // Maintenant que vous avez l'ID de la compagnie, vous pouvez interroger la collection de commandes
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('commande')
          .where('id_compagny', isEqualTo: compagnieId)
          .where('gare', isEqualTo: gare)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Erreur : ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        List<DocumentSnapshot> documents = snapshot.data!.docs;

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = documents[index];
                  var orderId = document.id;
                  var data = document.data() as Map<String, dynamic>;
                  String name = documents[index].get('nom_receptioneur');

                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        //Naviguer vers les détails de la commande
                        //Utilisez document pour accéder aux données de la commande
                        Get.toNamed(AppRoutes.gestionnaireOrderDetailPage,
                         arguments: {
                                                'name': data['nom_receptioneur'], // Nom de la personne
                                                'orderID': orderId, // Numéro de commande
                                                'status': data['status'], // Statut de la commande
                                                //'date': data['date'].toDate(), // Date de la commande
                                                // Vous pouvez ajouter d'autres informations de la commande ici
                                              },
                        );
                      },
                      child: Container(
                        decoration: AppDecoration.fillGray50.copyWith(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomIconButton(
                                  height: getSize(64),
                                  width: getSize(64),
                                  shape: IconButtonShape.CircleBorder32,
                                  padding: IconButtonPadding.PaddingAll14,
                                  child: CustomImageView(
                                    svgPath:
                                        ImageConstant.imgArrowdownDeepPurple600,
                                  ),
                                ),
                                SizedBox(width: getHorizontalSize(16)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      orderId,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyle.txtHeadline,
                                    ),
                                    SizedBox(height: getVerticalSize(6)),
                                     Text(
                                      name,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyle.txtHeadline,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgArrowright,
                              height: getSize(20),
                              width: getSize(20),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
      }
          )
        ],
      ),
    );
  }
}
