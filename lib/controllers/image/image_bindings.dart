import 'package:get/get.dart';
import 'image_controller.dart';

class ChatImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatImageController>(
      () => ChatImageController(),
    );
  }
}
