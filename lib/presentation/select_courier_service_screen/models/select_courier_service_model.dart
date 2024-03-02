import 'package:get/get.dart';import 'listsignal_item_model.dart';/// This class defines the variables used in the [select_courier_service_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SelectCourierServiceModel {Rx<List<ListsignalItemModel>> listsignalItemList = Rx(List.generate(4,(index) => ListsignalItemModel()));

 }
