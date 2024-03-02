import 'listeye_item_model.dart';

/// This class defines the variables used in the [select_pickup_address_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SelectPickupAddressModel {
  // Rx<List<ListeyeItemModel>> listeyeItemList =
  //     Rx(List.generate(3, (index) => ListeyeItemModel()));

  static List<ListeyeItemModel> listeyeItemList() {
    return [
      ListeyeItemModel("Home", "4140 Parker Rd.", "Allentown,", "New Mexico",
          "", "", "31134", ""),
      ListeyeItemModel("Office", "3891 Ranchview", "Dr. Richardson,",
          "California", "", "", "62639", ""),
      ListeyeItemModel("Home 2", "9656 Ranchview", "Dr. Richardson,",
          "California", "", "", "35264", ""),
    ];
  }
}
