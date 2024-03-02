import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/grid_screen/models/grid_model.dart';

/// A controller class for the GridScreen.
///
/// This class manages the state of the GridScreen, including the
/// current gridModelObj
class GridController extends GetxController {
  Rx<GridModel> gridModelObj = GridModel().obs;
}
