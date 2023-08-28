import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../components/search_field.dart';
import '../components/text_widget.dart';
import '../controllers/chat/chat_controller.dart';
import '../core/app_apis.dart';

class TextGeneratorView extends GetView<ChatTextController> {
  const TextGeneratorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Generator'),
      ),
      body: Obx(() => Column(children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: controller.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final textData = controller.messages[index];
                  return textData.index == -999999
                      ? Padding(
                          padding: EdgeInsets.only(right: 80.w),
                          child: MyTextCard(textData: textData),
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: 50.w),
                          child: AiTextCard(textData: textData),
                        );
                },
              ),
            ),
            controller.state.value == ApiState.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox(),
            SizedBox(height: 12.h),
            SearchField(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.8),
                textEditingController: controller.searchTextController,
                onTap: () {
                  controller
                      .getTextCompletion(controller.searchTextController.text);
                }),
            SizedBox(height: 20.h),
          ])),
    );
  }
}
