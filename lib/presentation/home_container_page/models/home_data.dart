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
        "01 : Cliquez sur le bouton ‘Livraisons‘\n"
        "02 : Autorisez la demande de position.\n"
        "03 : Sélectionnez le type de colis.\n"
        "04 : Entrez le point de départ et d'arriver.\n"
        "05 : Entrez les informations de la personne à contacter en cas d’urgence, son contact et les informations complémentaires de votre livraison puis cliquez sur ‘Suivant’.\n"
        "06 : Sélectionnez le type d’engin entre Moto, Tricycle et Camion.\n"
        "07 : Sélectionnez le mode de paiement :\n"
        "• Payer maintenant : Payez via les services de mobile money\n"
        "• Payer à la livraison : Le réceptionneur du colis sera invité à scanner le code QR du livreur et procéder au paiement de la livraison.",
      ),
      HomeSlider(
        ImageConstant.imgSlider2nd, 
        "Courses", 
        "Les étapes à suivre pour une Course.\n"
        "01 : Cliquez sur le bouton ‘Courses‘\n"
        "02 : Sélectionnez le type de colis.\n"
        "03 : Entrez l'endroit où vous souhaiter faire votre course (facultatif) et votre destination.\n"
        "04 : Entrez les informations de la personne à contacter en cas d’urgence, son contact et les informations complémentaires de votre course puis cliquez sur ‘Suivant’\n"
        "05 : Sélectionnez le type d’engin entre Moto, Tricycle et Camion.\n"
        "06 : Sélectionnez le mode de paiement :\n"
        "• Payer maintenant : Payez via les services de mobile money\n"
        "• Payer à la livraison : Le réceptionneur du colis sera invité à scanner le code QR du livreur et procéder au paiement de la course.",
      ),
       HomeSlider(
        ImageConstant.imgSlider3rd, 
        "Expéditions", 
        "Les étapes à suivre pour une Expédition.\n"
        "01 : Cliquez sur le bouton ‘Expéditions‘\n"
        "02 : Sélectionnez le type de colis.\n"
        "03 : Sélectionnez la compagnie de transport par laquelle vous souhaitez faire transiter le colis.\n"
        "04 : Sélectionnez la gare de cette compagnie.\n"
        "05 : Entrez le point de recupération du colis\n"
        "06 : Entrez le point de destination du colis (facultatif).\n"
        "07 : Entrez les informations suivantes: poids, date de récupération, téléphone (obligatoire) puis des informations concernant le colis à expédier puis cliquez sur Suivant.\n"
        "08 : Sélectionnez le mode de paiement :\n"
        "• Payer maintenant : Payez via les services de mobile money\n"
        "• Payer à la livraison : Le réceptionneur du colis sera invité à scanner le code QR du livreur et procéder au paiement de la course.",
      ),
      // HomeSlider(
      //   ImageConstant.imgSlider3rd, 
      //   "Déménagements", 
      //   "Ce service sera disponible très bientôt."),
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
