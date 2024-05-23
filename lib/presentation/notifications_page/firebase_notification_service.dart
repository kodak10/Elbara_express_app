import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationService {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> setupFirebase() async {
    // Demander la permission de recevoir des notifications (uniquement pour iOS)
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
        getToken(); // Récupérer le token FCM lors de l'initialisation de l'écran


    // Écouter les messages entrants
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Afficher une notification à l'utilisateur
      showNotification(message);
    });

    // Gérer les interactions lorsque l'utilisateur appuie sur une notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Gérer l'interaction avec la notification
    });
  }

  void getToken() async {
    String? token = await _firebaseMessaging.getToken();
    print('Token FCM: $token');
  }

  void showNotification(RemoteMessage message) {
    // Construire la notification avec le contenu du message
    // Par exemple, afficher le message dans une notification à l'écran
    String title = message.notification?.title ?? '';
    String body = message.notification?.body ?? '';
    // Afficher la notification à l'utilisateur
    // Utilisez par exemple le package flutter_local_notifications pour afficher une notification
  }
}
