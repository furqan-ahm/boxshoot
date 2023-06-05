import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysh/controllers/game_controller.dart';

import '../constants/colors.dart';
import '../constants/textContent.dart';
import '../screens/level_screen.dart';
import 'back_button.dart';
import 'outlined_text.dart';

class CompleteDialog extends GetWidget<GameController> {
  const CompleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          const Align(alignment: Alignment.topLeft, child: GoBackButton()),
          const Spacer(),
          Container(
            width:200,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: OutlinedText(
                text: content[controller.Lang]!['levelComp'] ?? 'LEVEL COMPLETE',
                style: const TextStyle(fontSize: 36)),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                controller.playUISFX();
                Get.back(result: 'next');
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
          const Spacer(flex: 2,)
        ],
      ),
    );
  }
}
