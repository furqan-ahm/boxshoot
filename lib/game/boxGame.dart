import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:boxshoot/game/components/explosion.dart';
import 'package:boxshoot/game/components/playerBox.dart';
import 'package:boxshoot/game/maps/map.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart' as forge;
import 'package:flutter/material.dart';

class BoxGame extends forge.Forge2DGame with HasTappables{


  BoxGame():super(gravity: Vector2(0, 30));

  final map=MapLevel();

  
  final random=Random();

  PlayerBox? player;



  addPlayer(PlayerBox player){
    this.player?.removeFromParent();
    this.player=player;
    add(player);
  }



  @override
  Color backgroundColor() {
    return Colors.transparent;
  }

  @override
  FutureOr<void> onLoad() async{
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
    player?.applyImpact(position);
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    applyExplosion(info.eventPosition.game);
    super.onTapDown(pointerId, info);
  }

}