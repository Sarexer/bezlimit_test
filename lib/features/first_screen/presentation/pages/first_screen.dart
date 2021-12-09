import 'package:bezlimit_test/features/first_screen/presentation/getx/rotation_controller.dart';
import 'package:bezlimit_test/features/second_screen/presentation/pages/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    controller.heightStream.listen((event) {
      height = event;
      var progress = (height / size.height) * 360;

      rotationController.updateProgress(progress);
      print(progress);
      if (progress == 360) {
        Get.snackbar(
          'Уведомление',
          'Шторка достигла конца экрана',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white
        );
      }
    });
    super.initState();
  }

  var rotationController = Get.put(RotationController());
  var controller = SolidController();
  late Size size;


  var pageViewController =
      PageController(initialPage: 0, viewportFraction: 0.3);
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: Obx(() => RotationTransition(
            turns: AlwaysStoppedAnimation(
                rotationController.rotationProgress.value / 360),
            child: Container(
              height: 200,
              width: 200,
              child: SvgPicture.asset('assets/svg/circle.svg'),
            ),
          )),
      bottomSheet: Container(
        color: Colors.transparent,
        child: SolidBottomSheet(
          controller: controller,
          minHeight: size.height / 2,
          maxHeight: size.height,
          draggableBody: true,
          autoSwiped: true,
          headerBar: Container(),
          body: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(24)),
            child: Center(
              child: SizedBox(
                height: 100,
                //width: 200,
                child: PageView.builder(
                  itemCount: 10,
                  pageSnapping: false,
                  controller: pageViewController,
                  padEnds: false,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () async {
                      int result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(index: index),
                          ));

                      pageViewController.animateToPage(
                        result,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );

                      setState(() {
                        _selectedIndex = result;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      color:
                          _selectedIndex == index ? Colors.blue : Colors.green,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
