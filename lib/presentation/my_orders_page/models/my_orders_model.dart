import 'package:get/get.dart';import 'my_orders_item_model.dart';/// This class defines the variables used in the [my_orders_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MyOrdersModel {Rx<List<MyOrdersItemModel>> myOrdersItemList = Rx(List.generate(4,(index) => MyOrdersItemModel()));

 }
