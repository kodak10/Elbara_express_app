import 'package:get/get.dart';

/// This class is used in the [slidertrackyour_item_widget] screen.

class SlidertrackyourItemModel {
  Rx<String>? id = Rx("");
  String? image;
  String? title;
  String? subTitle;
  SlidertrackyourItemModel(this.image,this.title,this.subTitle);

}
