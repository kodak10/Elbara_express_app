import 'listeye1_item_model.dart';

/// This class defines the variables used in the [select_delivery_address_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SelectDeliveryAddressModel {
  // Rx<List<Listeye1ItemModel>> listeye1ItemList =
  //     Rx(List.generate(3, (index) => Listeye1ItemModel()));

  static List<Listeye1ItemModel> listeye1ItemList() {
    return [
      Listeye1ItemModel("Home", "4140 Parker Rd.", "Allentown,", "New Mexico",
          "", "", "31134", ""),
      Listeye1ItemModel("Office", "3891 Ranchview", "Dr. Richardson,",
          "California", "", "", "62639", ""),
      Listeye1ItemModel("Home 2", "9656 Ranchview", "Dr. Richardson,",
          "California", "", "", "35264", ""),
    ];
  }
}
