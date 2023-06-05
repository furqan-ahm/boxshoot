import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysh/controllers/game_controller.dart';
import 'package:ysh/widgets/background.dart';
import 'package:ysh/widgets/outlined_text.dart';

import '../constants/textContent.dart';
import '../widgets/back_button.dart';

class HelpScreen extends GetView<GameController> {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Stack(
          children: [
            const GoBackButton(),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: MediaQuery.of(context).size.width / 3,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: OutlinedText(text: content[controller.Lang]!['help']??'How to Play', style: const TextStyle(fontSize: 32)))
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: OutlinedText(text: content[controller.Lang]!['instructions']!, style: const TextStyle(fontSize: 24, height: 1.8), fillColor: Colors.black, strokeColor: Colors.white,),
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
