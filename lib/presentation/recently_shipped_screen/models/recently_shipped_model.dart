import 'package:get/get.dart';import 'recently_item_model.dart';/// This class defines the variables used in the [recently_shipped_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class RecentlyShippedModel {Rx<List<RecentlyItemModel>> recentlyItemList = Rx(List.generate(4,(index) => RecentlyItemModel()));

 }
