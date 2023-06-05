import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame_audio/flame_audio.dart';
import 'package:get/get.dart';
import 'package:ysh/controllers/game_controller.dart';
import 'package:ysh/game/components/explosion.dart';
import 'package:ysh/game/components/playerBox.dart';
import 'package:ysh/game/maps/map.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart' as forge;
import 'package:flutter/material.dart';

class BoxGame extends forge.Forge2DGame with HasTappables{


  BoxGame({required this.level}):super(gravity: Vector2(0, 30));


  int level;

  late MapLevel map;

  
  final random=Random();

  PlayerBox? player;


  GameController get controller=>Get.find<GameController>();



  addPlayer(PlayerBox player)async{
    this.player?.removeFromParent();
    this.player=player;
    await add(player);
  }



  @override
  Color backgroundColor() {
    return Colors.transparent;
  }

  @override
  FutureOr<void> onLoad() async{
    map=MapLevel(level: level);
    await add(map);
    camera.zoom=canvasSize.x/(32+5);

    return super.onLoad();
  }



  @override
  void update(double dt) {
    super.update(dt);
  }




  applyExplosion(Vector2 position){
    add(Explosion(position: position));
    controller.playExplosionSFX();
    player?.applyImpact(position);
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    applyExplosion(info.eventPosition.game);
    super.onTapDown(pointerId, info);
  }

}