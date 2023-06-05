import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysh/controllers/game_controller.dart';

class GoBackButton extends GetWidget<GameController> {
  const GoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
          onTap: () {
            controller.playUISFX();
            Get.back();
          },
          child: Image.asset(
            'assets/images/back.png',
            width: 28,
          )),
    );
  }
}
