import 'package:get/get.dart';
import 'chat_controller.dart';

class ChatTextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatTextController>(
      () => ChatTextController(),
    );
  }
}
