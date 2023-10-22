import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../components/image_widget.dart';
import '../../components/search_field.dart';
import '../../controllers/image/image_controller.dart';
import '../../core/app_apis.dart';

class ImageGeneratorView extends GetView<ChatImageController> {
  const ImageGeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.getGenerateImages("cat");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Image Generator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => Center(
                child: controller.state.value == ApiState.loading
                    ? const CircularProgressIndicator()
                    : controller.state.value == ApiState.success
                        ? ImageCard(images: controller.images)
                        : controller.state.value == ApiState.notFound
                            ? const Center(
                                child: Text("Search what ever you want."),
                              )
                            : Center(
                                child: Text(
                                  "Image Generation Failed!",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle().copyWith(height: 2),
                                ),
                              ))),
          ),
          const SizedBox(height: 8),
          SearchField(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
            textEditingController: controller.searchTextController,
            onTap: () {
              controller
                  .getGenerateImages(controller.searchTextController.text);
              // controller.clearTextField();
            },
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
