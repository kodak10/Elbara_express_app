import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/password_reset_success_screen/models/password_reset_success_model.dart';

/// A controller class for the PasswordResetSuccessScreen.
///
/// This class manages the state of the PasswordResetSuccessScreen, including the
/// current passwordResetSuccessModelObj
class PasswordResetSuccessController extends GetxController {
  Rx<PasswordResetSuccessModel> passwordResetSuccessModelObj =
      PasswordResetSuccessModel().obs;
}
