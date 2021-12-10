import 'rotation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MainScreenController extends GetxController {
  late final RotationController rotationController;
  late final SolidController bottomSheetController;

  final Size size;

  MainScreenController({required this.size});

  @override
  void onInit() {
    rotationController = RotationController();
    bottomSheetController = SolidController();

    bottomSheetController.heightStream.listen(_heightStremListener);
    super.onInit();
  }

  void _heightStremListener(height) {
    var progress = (height / size.height) * 360;

    rotationController.updateProgress(progress);
  }
}
