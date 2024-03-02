import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/profile_details_screen/models/profile_details_model.dart';

/// A controller class for the ProfileDetailsScreen.
///
/// This class manages the state of the ProfileDetailsScreen, including the
/// current profileDetailsModelObj
class ProfileDetailsController extends GetxController {
  Rx<ProfileDetailsModel> profileDetailsModelObj = ProfileDetailsModel().obs;
}
