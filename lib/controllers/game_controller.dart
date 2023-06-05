import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ysh/screens/game_screen.dart';
import 'package:ysh/widgets/back_button.dart';
import 'package:ysh/widgets/complete_dialog.dart';
import 'package:ysh/widgets/outlined_text.dart';

import '../game/boxGame.dart';

class GameController extends GetxController {
  SharedPreferences? pref;
  late Game game;

  RxBool isEnglish = true.obs;
  RxBool sound = true.obs;

  bool gameOver = false;

  RxInt levelUnlocked = 6.obs;

  String get Lang => isEnglish.value ? 'English' : 'Brazil';

  int currentLevel = 1;

  startGame(int level) {
    currentLevel = level;
    gameOver = false;
    game = BoxGame(level: level);
    Get.to(const GameScreen());
  }

  @override
  void onInit() {
    sound.listen((val) {
      pref?.setBool('sound', val);
      if(val){
        if(!FlameAudio.bgm.isPlaying)FlameAudio.bgm.play('bg.mp3');
      }
      else FlameAudio.bgm.stop();
    });

    levelUnlocked.listen((val) {
      pref?.setInt('level', val);
    });

    isEnglish.listen((val) {
      pref?.setBool('isEnglish', val);
    });

    SharedPreferences.getInstance().then((value) async {
      pref = value;
      sound.value = value.getBool('sound') ?? true;
      levelUnlocked.value = value.getInt('level') ?? 1;
      isEnglish.value = value.getBool('isEnglish') ?? true;

      await FlameAudio.audioCache
          .loadAll(['impact.mp3', 'shoot.wav', 'ui.mp3']);
    });
    super.onInit();
  }

  setGameOver() async{
    if (!gameOver) {
      if (sound.value) FlameAudio.play('impact.mp3');
      gameOver = true;
      if(levelUnlocked.value!=9)levelUnlocked.value=currentLevel+1;
      final result=await Get.generalDialog(
          //barrierColor: Colors.transparent,
          pageBuilder: (context, _, __) => const CompleteDialog());
      
      Get.back();
      if(result=='next'){
        if(currentLevel<9)startGame(currentLevel+1);
      }
    }
  }

  playExplosionSFX() {
    if (sound.value) FlameAudio.play('shoot.wav', volume: 0.5);
  }

  playUISFX() {
    if (sound.value) FlameAudio.play('ui.mp3');
  }
}
