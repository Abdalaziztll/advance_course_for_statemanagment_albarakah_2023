import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;

  add() {
    count++;
  }

  minus() {
    if (count <= 0) {
      Get.dialog(FlutterLogo());

      Get.snackbar('Alert', 'You Can not Minus The Counter',
          snackPosition: SnackPosition.TOP);
    } else {
      count--;
    }
  }
}
