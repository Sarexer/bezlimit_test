import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../second_screen/presentation/pages/second_screen.dart';
import '../getx/pageview_controller.dart';

class HorizontalPageView extends StatelessWidget {
  HorizontalPageView({Key? key, required this.itemCount}) : super(key: key);

  final int itemCount;
  final PageViewController pageViewController = Get.put(PageViewController());

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: itemCount,
      pageSnapping: false,
      controller: pageViewController.pageController,
      padEnds: false,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => GestureDetector(
        child: Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: pageViewController.selectedPage.value == index
                ? Colors.blue
                : Colors.green,
            child: Center(
              child: Text(
                '$index',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
        onTap: () async {
          int selectedPageIndex = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(index: index, maxIndex: itemCount - 1,),
            ),
          );

          pageViewController.selectPage(selectedPageIndex);
        },
      ),
    );
  }
}
