import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysh/constants/colors.dart';
import 'package:ysh/controllers/game_controller.dart';
import 'package:ysh/screens/level_screen.dart';
import 'package:ysh/widgets/background.dart';
import 'package:ysh/widgets/bottom_bar.dart';
import 'package:ysh/widgets/outlined_text.dart';

class MenuScreen extends GetView<GameController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width / 3,
            ),
            const SizedBox(
              height: 15,
            ),
            const OutlinedText(
                text: 'BOX SHOOT', style: TextStyle(fontSize: 36)),
            const SizedBox(
              height: 50,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  controller.playUISFX();
                  Get.to(const LevelScreen());
                },
                customBorder: const CircleBorder(),
                child: Ink(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Ink(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: fillColor,
                    ),
                    padding: const EdgeInsets.all(46),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.white,
                      size: 64,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const BottomBar()
          ],
        ),
      ),
    );
  }
}
