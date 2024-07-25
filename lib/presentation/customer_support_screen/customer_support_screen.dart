import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/widgets/app_bar/appbar_image.dart';
import 'package:elbara_express/widgets/app_bar/appbar_subtitle_1.dart';
import 'package:elbara_express/widgets/app_bar/custom_app_bar.dart';
import 'package:elbara_express/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'controller/customer_support_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({Key? key}) : super(key: key);

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  CustomerSupportController controller = Get.put(CustomerSupportController());

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ColorConstant.whiteA700,
          statusBarIconBrightness: Brightness.dark),
    );
    super.initState();
  }

  Future<void> _launchCaller(String phoneNumber) async {
    final Uri url = Uri(path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _openWhatsApp() async {
    const String url = 'https://wa.me/message/5YBZZS742R6CD1';
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunch(uri.toString())) {
        await launch(uri.toString());
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      // Gérez les erreurs ici
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur: $e'),
        ),
      );
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
              resizeToAvoidBottomInset: true,
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
                        onTapArrowleft32();
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle1(text: "msg_customer_support".tr),
                  styleType: Style.bgFillWhiteA700),
              body: Stack(
                children: [
                  Padding(
                    padding: getPadding(left: 24, right: 24, top: 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: getPadding(right: 1),
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.whatsapp),
                                SizedBox(
                                    width:
                                        16), // Espacement entre l'icône et le champ
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      _openWhatsApp();
                                    },
                                    child: AbsorbPointer(
                                      child: CustomTextFormField(
                                        hintText: "+225 0716225556",
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: getVerticalSize(16)),
                          Padding(
                            padding: getPadding(right: 1),
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.squarePhone),
                                SizedBox(
                                    width:
                                        16), // Espacement entre l'icône et le champ
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      final Uri url = Uri(
                                          scheme: 'tel',
                                          path: "+2250716225556");
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      } else {
                                        print('erreur envoi de tel');
                                      }

                                      // await _launchCaller('+');
                                    },
                                    child: AbsorbPointer(
                                      child: CustomTextFormField(
                                        hintText:
                                            "0716225556",
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ),

SizedBox(
                                    width:
                                        16),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      final Uri url = Uri(
                                          scheme: 'tel',
                                          path: "+2250501146545");
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      } else {
                                        print('erreur envoi de tel');
                                      }

                                      // await _launchCaller('+');
                                    },
                                    child: AbsorbPointer(
                                      child: CustomTextFormField(
                                        hintText:
                                            "0501146545",
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                        textInputType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: getVerticalSize(16)),
                          Padding(
                            padding: getPadding(right: 1),
                            child: Row(
                              children: [
                                FaIcon(FontAwesomeIcons.envelope),
                                SizedBox(
                                    width:
                                        16), // Espacement entre l'icône et le champ
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      final Uri emailUrl = Uri(
                                        scheme: 'mailto',
                                        path: 'elbaraexpress@gmail.com',
                                      );
                                      if (await canLaunchUrl(emailUrl)) {
                                        await launchUrl(emailUrl);
                                      } else {
                                        throw 'Could not launch $emailUrl';
                                      }
                                    },
                                    child: AbsorbPointer(
                                      child: CustomTextFormField(
                                        hintText: "Elbaraexpress@gmail.com",
                                        textInputAction: TextInputAction.done,
                                        variant:
                                            TextFormFieldVariant.OutlineGray300,
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(54)),
                                        textInputType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            )));
  }

  onTapArrowleft32() {
    Get.back();
  }
}
