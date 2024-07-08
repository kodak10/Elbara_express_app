import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/feedbacks_item_widget.dart';
import 'controller/feedbacks_controller.dart';
import 'models/notifications_item_model.dart';

class FeedbacksPage extends StatefulWidget {
  FeedbacksPage({Key? key}) : super(key: key);

  @override
  State<FeedbacksPage> createState() => _FeedbacksPageState();
}

class _FeedbacksPageState extends State<FeedbacksPage> {
  FeedbacksController controller = Get.put(FeedbacksController());

  @override
  

  Widget build(BuildContext context) {
     User? user = FirebaseAuth.instance.currentUser;
    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: ColorfulSafeArea(
            color: ColorConstant.whiteA700,
            child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              appBar: CustomAppBar(
                  height: getVerticalSize(79),
                  leadingWidth: 42,
                  
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "My Feedback".tr),
                  styleType: Style.bgFillWhiteA700),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  

                 Expanded(
  child: StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: "OUVPapLggjU5TT3uZglU7zeBos82")
        .where('recevoirArgent', isEqualTo: true)
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Erreur : ${snapshot.error}');
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      }

      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return Center(
          child: Text('Aucune commande trouvée.'),
        );
      }

      List<DocumentSnapshot> documents = snapshot.data!.docs;

      return ListView.builder(
        itemCount: documents.length,
        itemBuilder: (context, index) {
          DocumentSnapshot doc = documents[index];
          var data = doc.data() as Map<String, dynamic>;
          var orderId = data['orderId']; // Assurez-vous que 'orderId' est bien un champ dans votre document

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(
                  AppRoutes.feedbackDetailsScreen,
                  arguments: {
                    'orderId': orderId,
                    'docID': doc.id,
                    'dateRegister': (data['date'] as Timestamp).toDate(),
                    'status': data['deliveryStatus'],
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomIconButton(
                            height: 64,
                            width: 64,
                            shape: IconButtonShape.CircleBorder32,
                            padding: IconButtonPadding.PaddingAll14,
                            child: CustomImageView(
                              svgPath: ImageConstant.imgArrowdownDeepPurple600,
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                orderId,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              // Ajoutez d'autres champs si nécessaire
                            ],
                          ),
                        ],
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgArrowright,
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  ),
),




                ],
              ),
            )));
  }

  onTapArrowleft21() {
    Get.back();
  }

  onTapArrowleft11() {
    Get.back();
  }
}
