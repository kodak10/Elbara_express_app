import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/utils/color_constant.dart';
import 'package:elbara_express/core/utils/size_utils.dart';
import 'package:elbara_express/presentation/partenaires_page/controller/partenaires_controller.dart';
import 'package:elbara_express/presentation/partenaires_page/models/partenaires_item_model.dart';
import 'package:elbara_express/presentation/partenaires_page/widgets/partenaires_item_widget.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartenairePage extends StatefulWidget {
  const PartenairePage({Key? key}) : super(key: key);

  @override
  State<PartenairePage> createState() => _PartenairePageState();
}

class _PartenairePageState extends State<PartenairePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final PartenairesController controller = Get.put(PartenairesController());

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
              backgroundColor: ColorConstant.whiteA700,
              appBar: CustomAppBar(
                  height: getVerticalSize(79),
                  leadingWidth: 42,
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "Nos Partenaires".tr),
                  styleType: Style.bgFillWhiteA700),
              body: GetBuilder<PartenairesController>(
                init: PartenairesController(),
                builder: (controller) => Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Obx(() {
                          if (controller.courierData.isEmpty) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 15);
                              },
                              itemCount: controller.courierData.length,
                              itemBuilder: (context, index) {
                                Partenaires model = controller.courierData[index];
                                return CourierItemWidget(model);
                              },
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}