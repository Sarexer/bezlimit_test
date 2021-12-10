import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/main_screen_controller.dart';
import '../widgets/main_bottom_sheet.dart';
import '../widgets/rotating_circle.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var mainScreenController = Get.put(MainScreenController(size: size));

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
