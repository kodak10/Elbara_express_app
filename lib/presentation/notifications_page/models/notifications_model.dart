import 'notifications_item_model.dart';

/// This class defines the variables used in the [notifications_page],
/// and is typically used to hold data that is passed between different parts of the application.
class NotificationsModel {
  // Rx<List<NotificationsItemModel>> notificationsItemList =
  //     Rx(List.generate(7, (index) => NotificationsItemModel()));

  static List<NotificationsItemModel> notificationsItemList() {
    return [
      NotificationsItemModel("Your order place",
          "Your Order has been placed successfully", "3 h ago"),
      NotificationsItemModel("Package insurance offer",
          "shipment with discount package insurance rates", "5 h ago"),
      NotificationsItemModel("Your order cancel",
          "Your Order has been successfully cancelled.", "8 h ago"),
      NotificationsItemModel("Limited-time promotion",
          "pickup service free for all orders within 48 hours.", "12 h ago"),
      NotificationsItemModel("Weekend warriors deal",
          "receive a 25% discount On Sunday deliveries.", "15 h ago"),
      NotificationsItemModel("New business offer",
          "Start your business relationship with us. ", "22 h ago"),
      NotificationsItemModel("Limited-time flash sale",
          "Get 30% off courier services for a limited period.", "24 h ago"),
      NotificationsItemModel("Your order place",
          "Your Order has been placed successfully", "3 h ago"),
      NotificationsItemModel("Package insurance offer",
          "shipment with discount package insurance rates", "5 h ago"),
      NotificationsItemModel("Your order cancel",
          "Your Order has been successfully cancelled.", "8 h ago"),
    ];
  }
}
