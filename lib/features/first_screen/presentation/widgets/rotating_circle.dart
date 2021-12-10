import 'package:bezlimit_test/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RotatingCircle extends StatelessWidget {
  const RotatingCircle({
    Key? key,
    required this.progress,
  }) : super(key: key);

  final double progress;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(
        progress / 360,
      ),
      child: SvgPicture.asset(AppImages.circle),
    );
  }
}