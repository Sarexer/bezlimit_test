import 'package:bezlimit_test/features/first_screen/presentation/controllers/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import 'horizontal_pageview.dart';

class MainBottomSheet extends StatelessWidget {
  MainScreenController mainScreenController = Get.find<MainScreenController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SolidBottomSheet(
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
              child: HorizontalPageView(itemCount: 1000,),
            ),
          ),
        ),
      ),
    );
  }
}
