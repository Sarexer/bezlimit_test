import 'package:bezlimit_test/features/first_screen/presentation/getx/rotation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MainScreenController extends GetxController {
  late final RotationController rotationController;
  late final SolidController bottomSheetController;

  @override
  void onInit() {
    var rotationController = RotationController();
    var controller = SolidController();



    controller.heightStream.listen((event) {
      var height = event;
      var progress = (height / size.height) * 360;

      rotationController.updateProgress(progress);
      
      if (progress == 360) {
        Get.snackbar(
          'Уведомление',
          'Шторка достигла конца экрана',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white
        );
      }
    });
    super.onInit();
  }




}
