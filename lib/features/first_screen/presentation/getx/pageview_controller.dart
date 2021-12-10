import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.3);
  var selectedPage = (-1).obs;


  void selectPage(int index){
    selectedPage.value = index;
    animateTo(index);

  }

  void animateTo(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
