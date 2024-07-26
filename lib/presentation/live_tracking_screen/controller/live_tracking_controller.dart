import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/live_tracking_screen/models/live_tracking_model.dart';

/// A controller class for the LiveTrackingScreen.
///
/// This class manages the state of the LiveTrackingScreen, including the
/// current liveTrackingModelObj
class LiveTrackingController extends GetxController {
  Rx<LiveTrackingModel> liveTrackingModelObj = LiveTrackingModel().obs;

  var user = {}.obs;

  void fetchUserDetails(String deliveryID) async {
    try {
      // Remplacez `users` par le nom de votre collection Firestore
      var snapshot = await FirebaseFirestore.instance.collection('users').doc(deliveryID).get();
      if (snapshot.exists) {
        user.value = snapshot.data()!;
      } else {
        print("User not found");
      }
    } catch (e) {
      print("Error fetching user details: $e");
    }
  }
}
