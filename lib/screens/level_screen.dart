import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysh/constants/colors.dart';
import 'package:ysh/controllers/game_controller.dart';
import 'package:ysh/widgets/background.dart';
import 'package:ysh/widgets/bottom_bar.dart';

import '../constants/textContent.dart';
import '../widgets/back_button.dart';
import '../widgets/outlined_text.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({Key? key}) : super(key: key);

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  GameController get controller=>Get.find<GameController>();


  int offset=0;

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
                      OutlinedText(
                          text: content[controller.Lang]!['levels'] ??
                              'How to Play',
                          style: const TextStyle(fontSize: 32))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 50, mainAxisSpacing: 20, crossAxisCount: 2),
                      itemCount: offset>0?5:6,
                      itemBuilder: (context, index) {
                        final level=index+offset+1;
                        return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.to(const LevelScreen());
                          },
                          customBorder: const CircleBorder(),
                          child: Obx(
                            (){
                              return InkWell(
                                onTap: level<=controller.levelUnlocked.value?(){
                                  controller.playUISFX();
                                  if(level==6){
                                    setState(() {
                                      offset=4;
                                    });
                                  }
                                  else if(level==5&&offset>0){
                                    setState(() {
                                      offset=0;
                                    });
                                  }
                                  else{
                                    controller.startGame(level);
                                  }
                                }:null,
                                customBorder: const CircleBorder(),
                                child: Ink(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: level<=controller.levelUnlocked.value?fillColor:Colors.white.withOpacity(0.5),
                                      border: Border.all(color: Colors.white, width: 6)
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: Center(
                                      child: Text(
                                        (index==5&&offset==0)||(index==0&&offset>0)?'?':'$level',
                                        style: const TextStyle(
                                            fontSize: 32, color: Colors.white),
                                      ),
                                    )),
                              );
                            }
                          ),
                        ),
                      );
                      },
                    ),
                  )
                ],
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomBar(),
            )
          ],
        ),
      ),
    );
  }
}
