import 'package:boxshoot/controllers/game_controller.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreen extends GetView<GameController> {
const GameScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset('assets/images/bg.png', fit: BoxFit.fill, alignment: Alignment.center, colorBlendMode: BlendMode.softLight,)),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(255, 219, 88, 0).withOpacity(0.7),
          ),
          GameWidget(game: controller.game),
        ],
      ),
    );
  }
}