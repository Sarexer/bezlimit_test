import 'package:bezlimit_test/features/first_screen/presentation/controllers/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/main_bottom_sheet.dart';
import '../widgets/rotating_circle.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  var mainScreenController = Get.put(MainScreenController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    mainScreenController.size = size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -100,
            child: Obx(
              () => SizedBox(
                width: 400,
                height: 400,
                child: RotatingCircle(
                  progress: mainScreenController
                      .rotationController.rotationProgress.value,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: MainBottomSheet(),
    );
  }
}
