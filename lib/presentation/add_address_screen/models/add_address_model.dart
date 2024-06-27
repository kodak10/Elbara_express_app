import 'package:get/get.dart';
import 'package:elbara_express/data/models/selectionPopupModel/selection_popup_model.dart';

/// This class defines the variables used in the [add_address_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddAddressModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Abidjan - Abobo",
    ),
    SelectionPopupModel(
      id: 2,
      title: "Abidjan - Adjamé",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Abidjan - Anyama",
    ),
    SelectionPopupModel(
      id: 4,
      title: "Abidjan - Bassam",
    ),
    SelectionPopupModel(
      id: 5,
      title: "Abidjan - Bingerville",
    ),
    SelectionPopupModel(
      id: 6,
      title: "Abidjan - Cocody",
    ),
     SelectionPopupModel(
      id: 7,
      title: "Abidjan - Koumassi",
    ),
    SelectionPopupModel(
      id: 8,
      title: "Abidjan - Marcory",
    ),
    SelectionPopupModel(
      id: 9,
      title:  "Abidjan - Plateau",
    ),
    SelectionPopupModel(
      id: 10,
      title: "Abidjan - Songon",
    ),
    SelectionPopupModel(
      id: 11,
      title: "Abidjan - Treichville",
    ),
    SelectionPopupModel(
      id: 12,
      title: "Abidjan - Yopougon",
    ),
    SelectionPopupModel(
      id: 13,
      title: "Bouaké - Air France",
    ),
    SelectionPopupModel(
      id: 14,
      title: "Bouaké - Koko",
    ),
    SelectionPopupModel(
      id: 15,
      title: "Bouaké - Dar-Es-Salam",
    ),
    SelectionPopupModel(
      id: 16,
      title: "Bouaké - Commerce",
    ),
    SelectionPopupModel(
      id: 17,
      title: "Bouaké - Zone",
    ),
    SelectionPopupModel(
      id: 18,
      title: "Bouaké - Belleville",
    ),
    SelectionPopupModel(
      id: 19,
      title: "Bouaké - Ahougnanssou",
    ),
    SelectionPopupModel(
      id: 20,
      title: "Bouaké - N'Dakro",
    ),
    SelectionPopupModel(
      id: 21,
      title: "Bouaké - Gonfreville",
    ),
    SelectionPopupModel(
      id: 22,
      title: "Bouaké - Kennedy",
    ),
    SelectionPopupModel(
      id: 23,
      title: "Bouaké - Kondéyaokro",
    ),
    SelectionPopupModel(
      id: 24,
      title: "Bouaké - Nimbo",
    ),
    SelectionPopupModel(
      id: 25,
      title: "Bouaké - Dougouba",
    ),
    SelectionPopupModel(
      id: 26,
      title: "Bouaké - Sokoura",
    ),
    SelectionPopupModel(
      id: 27,
      title: "Bouaké - Yaokro",
    ),
    SelectionPopupModel(
      id: 28,
      title: "Bouaké - Djébonoua",
    ),
    SelectionPopupModel(
      id: 29,
      title: "Bouaké - Brobo",
    ),
    SelectionPopupModel(
      id: 30,
      title: "Bouaké - Abobo",
    ),
    SelectionPopupModel(
      id: 31,
      title: "Bouaké - Toumanguie",
    ),
    SelectionPopupModel(
      id: 32,
      title: "Bouaké - Petessou",
    ),
  ]);

   Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Abidjan - Abobo",
    ),
    SelectionPopupModel(
      id: 2,
      title: "Abidjan - Adjamé",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Abidjan - Anyama",
    ),
    SelectionPopupModel(
      id: 4,
      title: "Abidjan - Bassam",
    ),
    SelectionPopupModel(
      id: 5,
      title: "Abidjan - Bingerville",
    ),
    SelectionPopupModel(
      id: 6,
      title: "Abidjan - Cocody",
    ),
     SelectionPopupModel(
      id: 7,
      title: "Abidjan - Koumassi",
    ),
    SelectionPopupModel(
      id: 8,
      title: "Abidjan - Marcory",
    ),
    SelectionPopupModel(
      id: 9,
      title:  "Abidjan - Plateau",
    ),
    SelectionPopupModel(
      id: 10,
      title: "Abidjan - Songon",
    ),
    SelectionPopupModel(
      id: 11,
      title: "Abidjan - Treichville",
    ),
    SelectionPopupModel(
      id: 12,
      title: "Abidjan - Yopougon",
    ),
    SelectionPopupModel(
      id: 13,
      title: "Bouaké - Air France",
    ),
    SelectionPopupModel(
      id: 14,
      title: "Bouaké - Koko",
    ),
    SelectionPopupModel(
      id: 15,
      title: "Bouaké - Dar-Es-Salam",
    ),
    SelectionPopupModel(
      id: 16,
      title: "Bouaké - Commerce",
    ),
    SelectionPopupModel(
      id: 17,
      title: "Bouaké - Zone",
    ),
    SelectionPopupModel(
      id: 18,
      title: "Bouaké - Belleville",
    ),
    SelectionPopupModel(
      id: 19,
      title: "Bouaké - Ahougnanssou",
    ),
    SelectionPopupModel(
      id: 20,
      title: "Bouaké - N'Dakro",
    ),
    SelectionPopupModel(
      id: 21,
      title: "Bouaké - Gonfreville",
    ),
    SelectionPopupModel(
      id: 22,
      title: "Bouaké - Kennedy",
    ),
    SelectionPopupModel(
      id: 23,
      title: "Bouaké - Kondéyaokro",
    ),
    SelectionPopupModel(
      id: 24,
      title: "Bouaké - Nimbo",
    ),
    SelectionPopupModel(
      id: 25,
      title: "Bouaké - Dougouba",
    ),
    SelectionPopupModel(
      id: 26,
      title: "Bouaké - Sokoura",
    ),
    SelectionPopupModel(
      id: 27,
      title: "Bouaké - Yaokro",
    ),
    SelectionPopupModel(
      id: 28,
      title: "Bouaké - Djébonoua",
    ),
    SelectionPopupModel(
      id: 29,
      title: "Bouaké - Brobo",
    ),
    SelectionPopupModel(
      id: 30,
      title: "Bouaké - Abobo",
    ),
    SelectionPopupModel(
      id: 31,
      title: "Bouaké - Toumanguie",
    ),
    SelectionPopupModel(
      id: 32,
      title: "Bouaké - Petessou",
    ),
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList2 = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);
}
