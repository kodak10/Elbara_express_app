import 'package:connectivity_plus/connectivity_plus.dart';

// Pour vérifier la connectivité Internet
abstract class NetworkInfoI {
  Future<bool> isConnected();

  Future<ConnectivityResult> get connectivityResult;

  Stream<ConnectivityResult> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;

  NetworkInfo(this.connectivity) {
    connectivity = this.connectivity;
  }

  /// Vérifie si Internet est connecté ou non
  /// Renvoie [true] si Internet est connecté
  /// Sinon, renvoie [false]
  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    if (result != ConnectivityResult.none) {
          print('resultat: $result');

      return true;
    }
    return false;

  }

  // Pour vérifier le type de connectivité Internet
  @override
  Future<ConnectivityResult> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  // Vérifie le type de connexion Internet lors du changement de la connexion Internet
  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}
