import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_style.dart';
import 'custom_image_view.dart';
import 'custum_bottom_bar_controller.dart';

// ignore: must_be_immutable
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHomeUnselected,
      title: "Accueil",
      type: BottomBarEnum.Home,
      selectedicon: ImageConstant.imgHomeSelected,
    ),
    BottomMenuModel(
        icon: ImageConstant.imgOrderUnselected,
        title: "Mes commandes",
        type: BottomBarEnum.Order,
        selectedicon: ImageConstant.imgOrderSelected),
    BottomMenuModel(
        icon: ImageConstant.imgNotificationUnselected,
        title: "Notifications",
        type: BottomBarEnum.Notification,
        selectedicon: ImageConstant.imgNotificationSelected),
    BottomMenuModel(
        icon: ImageConstant.imgProfileUnselected,
        title: "Mon Profil",
        type: BottomBarEnum.Profile,
        selectedicon: ImageConstant.imgProfileSelected)
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstant.whiteA700,
      ),
      child: GetBuilder<CustomBottomBarController>(
        init: CustomBottomBarController(),
        builder: (controller) => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: controller.selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    svgPath: bottomMenuList[index].icon,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                    // color: ColorConstant.indigo800,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 11,
                    ),
                    child: Text(bottomMenuList[index].title ?? "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeMedium12),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomImageView(
                    svgPath: bottomMenuList[index].selectedicon,
                    height: getSize(
                      24,
                    ),
                    width: getSize(
                      24,
                    ),
                    // color: ColorConstant.indigo800,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 11,
                    ),
                    child: Text(bottomMenuList[index].title ?? "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtManropeMedium12Purple),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: (index) {
            controller.getIndex(index);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Order,
  Notification,
  Profile,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.selectedicon,
    this.title,
    required this.type,
  });

  String icon;
  String selectedicon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}







// import 'package:elbara_express/core/app_export.dart';
// import 'package:flutter/material.dart';
//
// class CustomBottomBar extends StatelessWidget {
//   CustomBottomBar({
//     Key? key,
//     this.onChanged,
//   }) : super(
//           key: key,
//         );
//
//   RxInt selectedIndex = 0.obs;
//
//   List<BottomMenuModel> bottomMenuList = [
//     BottomMenuModel(
//       icon: ImageConstant.imgHome,
//       title: "lbl_home".tr,
//       type: BottomBarEnum.Home,
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgArrowdownBlack90024x24,
//       title: "lbl_order".tr,
//       type: BottomBarEnum.Order,
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgLockBlack90024x24,
//       title: "lbl_notifications".tr,
//       type: BottomBarEnum.Notifications,
//     ),
//     BottomMenuModel(
//       icon: ImageConstant.imgUser,
//       title: "lbl_profile".tr,
//       type: BottomBarEnum.Profile,
//     )
//   ];
//
//   Function(BottomBarEnum)? onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: ColorConstant.whiteA700,
//       ),
//       child: Obx(
//         () => BottomNavigationBar(
//           backgroundColor: Colors.transparent,
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           elevation: 0,
//           currentIndex: selectedIndex.value,
//           type: BottomNavigationBarType.fixed,
//           items: List.generate(bottomMenuList.length, (index) {
//             return BottomNavigationBarItem(
//               icon: Container(
//                 padding: getPadding(
//                   left: 35,
//                   top: 20,
//                   right: 35,
//                   bottom: 20,
//                 ),
//                 decoration: AppDecoration.white,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CustomImageView(
//                       svgPath: bottomMenuList[index].icon,
//                       height: getSize(
//                         24,
//                       ),
//                       width: getSize(
//                         24,
//                       ),
//                       color: ColorConstant.black900,
//                       margin: getMargin(
//                         top: 22,
//                       ),
//                     ),
//                     Padding(
//                       padding: getPadding(
//                         top: 11,
//                         bottom: 20,
//                       ),
//                       child: Text(
//                         bottomMenuList[index].title ?? "",
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppStyle.txtManropeMedium12.copyWith(
//                           letterSpacing: getHorizontalSize(
//                             0.5,
//                           ),
//                           color: ColorConstant.black900,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               activeIcon: Container(
//                 padding: getPadding(
//                   left: 35,
//                   top: 20,
//                   right: 35,
//                   bottom: 20,
//                 ),
//                 decoration: AppDecoration.white,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CustomImageView(
//                       svgPath: bottomMenuList[index].icon,
//                       height: getSize(
//                         24,
//                       ),
//                       width: getSize(
//                         24,
//                       ),
//                       color: ColorConstant.deepPurple600,
//                       margin: getMargin(
//                         top: 22,
//                       ),
//                     ),
//                     Padding(
//                       padding: getPadding(
//                         top: 11,
//                         bottom: 20,
//                       ),
//                       child: Text(
//                         bottomMenuList[index].title ?? "",
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: AppStyle.txtManropeMedium12.copyWith(
//                           letterSpacing: getHorizontalSize(
//                             0.5,
//                           ),
//                           color: ColorConstant.black900,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               label: '',
//             );
//           }),
//           onTap: (index) {
//             selectedIndex.value = index;
//             onChanged?.call(bottomMenuList[index].type);
//           },
//         ),
//       ),
//     );
//   }
// }
//
// enum BottomBarEnum {
//   Home,
//   Order,
//   Notifications,
//   Profile,
// }
//
// class BottomMenuModel {
//   BottomMenuModel({
//     required this.icon,
//     this.title,
//     required this.type,
//   });
//
//   String icon;
//
//   String? title;
//
//   BottomBarEnum type;
// }
//
// class DefaultWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.all(10),
//       child: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Please replace the respective Widget here',
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
