import 'package:get/get.dart';import 'slidermaskgroup_item_model.dart';/// This class defines the variables used in the [home_container_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeContainerModel {Rx<List<SlidermaskgroupItemModel>> slidermaskgroupItemList = Rx(List.generate(2,(index) => SlidermaskgroupItemModel()));

 }
