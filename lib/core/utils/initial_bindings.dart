import 'package:elbara_express/core/app_export.dart';
import 'package:elbara_express/data/apiClient/api_client.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:elbara_express/core/network/network_info.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
    Get.put(ApiClient());
    Connectivity connectivity = Connectivity();
    Get.put(NetworkInfo(connectivity));
  }
}

