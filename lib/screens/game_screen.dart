import 'package:ysh/controllers/game_controller.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysh/widgets/background.dart';
import 'package:ysh/widgets/bottom_bar.dart';

import '../constants/textContent.dart';
import '../widgets/back_button.dart';
import '../widgets/outlined_text.dart';

class GameScreen extends GetView<GameController> {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Stack(
          children: [
            SizedBox.expand(child: GameWidget(game: controller.game)),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: OutlinedText(text: '${content[controller.Lang]!['level']} ${controller.currentLevel}',style: TextStyle(fontSize: 32),),
              ),
            ),
            controller.currentLevel==1?Obx(
              () {
                return Align(
                  alignment: Alignment.center+Alignment(0.43, -250/MediaQuery.of(context).size.height),
                  child: Text(content[controller.Lang]!['tap']??'tap', style: TextStyle(color: Colors.white),),
                );
              }
            ):const SizedBox.shrink(),
            controller.currentLevel==1?Obx(
              () {
                return Align(
                  alignment: Alignment.center+Alignment(0, 300/MediaQuery.of(context).size.height),
                  child: Text(content[controller.Lang]!['target']??'target', style: TextStyle(color: Colors.white),),
                );
              }
            ):const SizedBox.shrink(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                GoBackButton(),
                BottomBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
