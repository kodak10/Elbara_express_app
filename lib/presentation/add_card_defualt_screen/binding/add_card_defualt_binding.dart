import '../controller/add_card_defualt_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddCardDefualtScreen.
///
/// This class ensures that the AddCardDefualtController is created when the
/// AddCardDefualtScreen is first loaded.
class AddCardDefualtBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCardDefualtController());
  }
}
