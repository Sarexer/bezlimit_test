import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RotationController extends GetxController {
  var rotationProgress = 0.0.obs;

  void updateProgress(double progress) {
    rotationProgress.value = progress;
  }
}
