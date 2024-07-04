import 'package:get/get.dart';
import 'package:elbara_express/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_address_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddAddressModel {
  

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Orange Money",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Mtn Money",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Moov Money",
    ),
    SelectionPopupModel(
      id: 4,
      title: "Wave",
    ),
  ]);
}