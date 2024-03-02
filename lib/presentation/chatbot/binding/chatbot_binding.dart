import '../../../core/app_export.dart';
import '../controller/chat_bot_controller.dart';

class ChatbotScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatBotScreenController());
  }
}
