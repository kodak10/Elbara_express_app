import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbara_express/presentation/partenaires_page/models/partenaires_item_model.dart';
import 'package:get/get.dart';

class PartenairesController extends GetxController {

  //List<NotificationsItemModel> notificationData = NotificationsModel.notificationsItemList();

  var courierData = <Partenaires>[].obs;

  @override
  void onInit() {
    fetchCourierData();
    super.onInit();
  }

  void fetchCourierData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('partenaires').get();
      var allDocs = querySnapshot.docs.map((doc) => Partenaires.fromMap(doc.data() as Map<String, dynamic>)).toList();
      courierData.value = allDocs;
    } catch (e) {
      print("Erreur d'affichage des données: $e");
    }
  }
}
