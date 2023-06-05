import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysh/controllers/game_controller.dart';

import '../screens/help_screen.dart';
import '../screens/settings_screen.dart';

class BottomBar extends GetView<GameController> {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                controller.playUISFX();
                Get.to(const SettingsScreen());
              },
              child: Image.asset(
                'assets/images/settings.png',
                width: 34,
              )),
          GestureDetector(
              onTap: () {
                controller.playUISFX();
                Get.to(const HelpScreen());
              },
              child: Image.asset(
                'assets/images/help.png',
                width: 28,
              )),
        ],
      ),
    );
  }
}
