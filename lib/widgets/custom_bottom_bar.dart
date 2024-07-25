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
        icon: ImageConstant.partenaire,
        title: "Partenaires",
        type: BottomBarEnum.Notification,
        selectedicon: ImageConstant.partenaireFond),
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
