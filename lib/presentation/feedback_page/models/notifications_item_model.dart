import 'package:get/get.dart';

/// This class is used in the [notifications_item_widget] screen.

class NotificationsItemModel {
  Rx<String> orderplaceTxt = Rx("Your order place");

  Rx<String> orderstatusTxt = Rx("Your Order has been placed successfully");

  Rx<String> ordertimeTxt = Rx("3 h ago");

  Rx<String>? id = Rx("");


  String? title;
  String? subTitle;
  String? time;
  NotificationsItemModel(this.title,this.subTitle,this.time);
}
