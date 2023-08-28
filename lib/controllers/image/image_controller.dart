import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/app_apis.dart';
import '../../core/image_generation_model.dart';

class ChatImageController extends GetxController {
  List<ImageGenerationData> images = [];

  var state = ApiState.notFound.obs;

  getGenerateImages(String query) async {
    // print("call   " + query);

    state.value = ApiState.loading;
    images.clear();

    try {
      // ['256x256', '512x512', '1024x1024']
      Map<String, dynamic> rowParams = {
        "n": 8,
        "size": "256x256",
        "prompt": query,
      };

      final encodedParams = json.encode(rowParams);

      final response = await http.post(
        Uri.parse(endPoint("images/generations")),
        body: encodedParams,
        headers: headerBearerOption(openAiKey),
      );

      if (response.statusCode == 200) {
        images = ImageGenerationModel.fromJson(json.decode(response.body)).data;
        // print("succccccccccccccccccccccccc ");
        state.value = ApiState.success;
      } else {
        // print("Errorrrrrrrrrrrrrrr  ${response.body}");
        state.value = ApiState.error;
      }
    } catch (e) {
      // print("Errorrrrrrrrrrrrrrr  ");
    } finally {
      // searchTextController.clear();
      update();
    }
  }

  TextEditingController searchTextController = TextEditingController();

  clearTextField() {
    searchTextController.clear();
  }
}
