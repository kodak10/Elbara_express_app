

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CustomBottomBarController extends GetxController{
  int selectedIndex = 0;
  getIndex(int index){
    selectedIndex = index;
    update();
  }
}