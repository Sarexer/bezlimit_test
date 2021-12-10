import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RotationController extends GetxController {
  var rotationProgress = 0.0.obs;

  void updateProgress(double progress) {
    rotationProgress.value = progress;

    if (progress == 360) {
      _showSnack();
    }
  }

  void _showSnack() {
    Get.snackbar(
      'Уведомление',
      'Шторка достигла конца экрана',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
    );
  }
}
