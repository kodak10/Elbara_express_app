import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/presentation/home_container_page/models/recently_shipped_data_model.dart';

import 'corier_service_model.dart';
import 'home_slider_model.dart';

class HomeData {
  static List<HomeSlider> getSliderData() {
    return [
      HomeSlider(
        ImageConstant.imgSlider1st,
        "Livraisons",
        "Les étapes à suivre pour une Livraison.\n"
        "Etape 01 : Cliquez sur le bouton ‘Envoyer un colis‘\n"
        "Etape 02 : Sélectionnez 'Livraisons' comme type de service \n"
        "Etape 03 : Sélectionnez la zone de ramassage et de destination puis précisé les lieux.\n"
        "Etape 04 : Entrez les informations de personne à contacter en cas d’urgence et les informations complémentaires de votre livraison puis cliquez sur ‘Suivant’\n"
        "Etape 05 : Sélectionnez le type d’engin entre Moto, Tricycle et Camion.\n"
        "Etape 06 : Sélectionnez le mode de paiement :\n"
        "• Payer maintenant : Payez via les services de mobile money\n"
        "• Payer à la livraison : le réceptionneur du colis sera invité à scanner le code QR du livreur et procéder au paiement de la livraison.",
      ),
      HomeSlider(
        ImageConstant.imgSlider2nd, 
        "Courses", 
        "Les étapes à suivre pour une Course.\n"
        "Etape 01 : Cliquez sur le bouton ‘Envoyer un colis‘\n"
        "Etape 02 : Sélectionnez 'Courses' comme type de service \n"
        "Etape 03 : Sélectionnez la zone et le lieu où vous souhaitez faire votre course et la zone de destination.\n"
        "Etape 04 : Entrez les informations de la personne à contacter en cas d’urgence et les informations complémentaires de votre course puis cliquez sur ‘Suivant’\n"
        "Etape 05 : Sélectionnez le type d’engin entre Moto, Tricycle et Camion.\n"
        "Etape 06 : Sélectionnez le mode de paiement :\n"
        "• Payer maintenant : Payez via les services de mobile money\n"
        "• Payer à la livraison : Le réceptionneur du colis sera invité à scanner le code QR du livreur et procéder au paiement de la course.",
      ),
      HomeSlider(
        ImageConstant.imgSlider3rd, 
        "Déménagements", 
        "Ce service sera disponible très bientôt."),
    ];
  }

  static List<CourierService> getCourierData() {
    return [
      CourierService(
          ImageConstant.imgcourier1st,
          "Our New Customer Center guides you through all the ",
          "5.0",
          "Wed, 22 Jun ‘23",
          "\$500",
          "Becoming the first to know about Our service and new product updates, regulatory updates, service disruption notification and more!"),
      CourierService(
          ImageConstant.imgcourier2nd,
          "Our New Customer Center guides you through all the ",
          "5.0",
          "Wed, 23 Jun ‘23",
          "\$450",
          "Becoming the first to know about Our service and new product updates, regulatory updates, service disruption notification and more!"),
      CourierService(
          ImageConstant.imgcourier3rd,
          "Our New Customer Center guides you through all the ",
          "5.0",
          "Wed, 22 Jun ‘23",
          "\$350",
          "Becoming the first to know about Our service and new product updates, regulatory updates, service disruption notification and more!"),
      CourierService(
          ImageConstant.imgcourier4th,
          "Our New Customer Center guides you through all the ",
          "5.0",
          "Wed, 23 Jun ‘23",
          "\$480",
          "Becoming the first to know about Our service and new product updates, regulatory updates, service disruption notification and more!"),
    ];
  }

static Future<List<RecentlyShipped>> getShippedData() async {
    List<RecentlyShipped> shippedData = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('orders')
          .get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String name = data['name'] ?? '';
        String orderID = data['orderId'] ?? '';
        String date = data['date'] ?? '';
        String status = data['status'] ?? '';

        //RecentlyShipped shippedItem = RecentlyShipped(name, orderID, date, status);
        //shippedData.add(shippedItem);
      });
    } catch (e) {
      print('Erreur lors de la récupération des données: $e');
    }

    return shippedData;
  }
  
  // static List<RecentlyShipped> getShippedData() {
  //   return [
  //     RecentlyShipped("Aarav", "#202022194", "Sat, 18 Jun 23", "Delivered"),
  //     RecentlyShipped("Pranav", "#202022194", "Sat, 18 Jun 23", "In Transit"),
  //     RecentlyShipped("Ronald", "#202022194", "Sat, 18 Jun 23", "Cancelled"),
  //     RecentlyShipped("Estard", "#202022194", "Sat, 18 Jun 23", "Delivered"),
  //     RecentlyShipped("Pranav", "#202022194", "Sat, 18 Jun 23", "In Transit"),
  //   ];
  // }
}
