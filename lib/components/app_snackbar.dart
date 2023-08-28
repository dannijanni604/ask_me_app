import 'package:flutter/material.dart';
import 'package:get/get.dart';

sendAlert(String message) async {
  Get.snackbar("Successful", message,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM);
}
