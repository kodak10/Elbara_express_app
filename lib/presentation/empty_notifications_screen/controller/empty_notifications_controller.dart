import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/empty_notifications_screen/models/empty_notifications_model.dart';

/// A controller class for the EmptyNotificationsScreen.
///
/// This class manages the state of the EmptyNotificationsScreen, including the
/// current emptyNotificationsModelObj
class EmptyNotificationsController extends GetxController {
  Rx<EmptyNotificationsModel> emptyNotificationsModelObj =
      EmptyNotificationsModel().obs;
}
