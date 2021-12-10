import '../getx/main_screen_controller.dart';
import 'horizontal_pageview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MainBottomSheet extends StatelessWidget {
  final MainScreenController mainScreenController =
      Get.find<MainScreenController>();
  late final Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return SolidBottomSheet(
      controller: mainScreenController.bottomSheetController,
      minHeight: size.height / 2,
      maxHeight: size.height,
      draggableBody: true,
      autoSwiped: true,
      headerBar: Container(),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: SizedBox(
            height: 100,
            child: HorizontalPageView(),
          ),
        ),
      ),
    );
  }
}
