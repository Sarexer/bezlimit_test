import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import 'rotation_controller.dart';

class MainScreenController extends GetxController {
  final rotationController = RotationController();
  final bottomSheetController = SolidController();
  late Size size;

  MainScreenController();

  @override
  void onInit() {
    bottomSheetController.heightStream.listen(_heightStremListener);

    super.onInit();
  }

  void _heightStremListener(height) {
    var progress = (height / size.height) * 360;

    rotationController.updateProgress(progress);

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
