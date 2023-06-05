import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysh/controllers/game_controller.dart';
import 'package:ysh/widgets/background.dart';

import '../constants/textContent.dart';
import '../widgets/back_button.dart';
import '../widgets/outlined_text.dart';

class SettingsScreen extends GetView<GameController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Stack(
          children: [
            const GoBackButton(),
            Center(
              child: Obx(() {
                return Column(
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
                        OutlinedText(
                            text: content[controller.Lang]!['settings'] ??
                                'How to Play',
                            style: const TextStyle(fontSize: 32))
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.sound.value = true;
                          },
                          child: Column(
                            children: [
                              OutlinedText(
                                text: content[controller.Lang]!['on'] ?? 'ON',
                                style: const TextStyle(fontSize: 24),
                                strokeColor: controller.sound.value
                                    ? Colors.black
                                    : Colors.transparent,
                                fillColor: Colors.white.withOpacity(
                                    controller.sound.value ? 1 : 0.59),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Stack(//Doing this the round about way to avoid the image loading shenanigans on state change
                                children: [
                                  Image.asset(
                                    'assets/images/sound_on_${controller.sound.value ? 1 : 0}.png',
                                    width: 50,
                                  ),
                                  controller.sound.value?Image.asset('assets/images/sound_on_1.png', width: 50,):const SizedBox.shrink()
                                ],
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.sound.value = false;
                          },
                          child: Column(
                            children: [
                              OutlinedText(
                                text: 'OFF',
                                style: const TextStyle(fontSize: 24),
                                strokeColor: !controller.sound.value
                                    ? Colors.black
                                    : Colors.transparent,
                                fillColor: Colors.white.withOpacity(
                                    !controller.sound.value ? 1 : 0.59),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Stack(//Doing this the round about way to avoid the image loading shenanigans on state change
                                children: [
                                  Image.asset(
                                    'assets/images/sound_off_0.png',
                                    width: 50,
                                  ),
                                  !controller.sound.value?Image.asset('assets/images/sound_off_1.png', width: 50,):const SizedBox.shrink()
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.isEnglish.value = true;
                          },
                          child: Column(
                            children: [
                              OutlinedText(
                                text: 'ENGLISH',
                                style: const TextStyle(fontSize: 24),
                                strokeColor: controller.isEnglish.value
                                    ? Colors.black
                                    : Colors.transparent,
                                fillColor: Colors.white.withOpacity(
                                    controller.isEnglish.value ? 1 : 0.59),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: controller.isEnglish.value?145:135,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Colors.white.withOpacity(controller.isEnglish.value?1:0.59), width: controller.isEnglish.value?7:4)
                                ),
                                child: Image.asset('assets/images/english.png'),
                              )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.isEnglish.value = false;
                          },
                          child: Column(
                            children: [
                              OutlinedText(
                                text: 'BRAZIL',
                                style: const TextStyle(fontSize: 24),
                                strokeColor: !controller.isEnglish.value
                                    ? Colors.black
                                    : Colors.transparent,
                                fillColor: Colors.white.withOpacity(
                                    !controller.isEnglish.value ? 1 : 0.59),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: !controller.isEnglish.value?145:135,
                                decoration: BoxDecoration(
                                  border: Border.all(color:Colors.white.withOpacity(!controller.isEnglish.value?1:0.59), width: !controller.isEnglish.value?7:4)
                                ),
                                child: Image.asset('assets/images/brazil.png'),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
