import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/particles.dart';
import 'package:flame_forge2d/flame_forge2d.dart' as forge;
import 'package:flutter/material.dart';

class BoxGame extends forge.Forge2DGame with HasTappables{


  final _random=Random();


  @override
  Color backgroundColor() {
    // TODO: implement backgroundColor
    return Colors.transparent;
  }

  late Sprite _particleSprite;

  @override
  FutureOr<void> onLoad() async{
    _particleSprite=await loadSprite('particle.png');
    return super.onLoad();
  }



  @override
  void update(double dt) {
    super.update(dt);
  }



   Vector2 getRandomVector() {
      return (Vector2.random(_random) - Vector2.random(_random)) * 200;
    }

    // Returns a random direction vector with slight angle to +ve y axis.
    Vector2 getRandomDirection() {
      return (Vector2.random(_random) - Vector2(0.5, -1)).normalized();
    }



  showImpact(Vector2 position){
    final particleComponent = ParticleSystemComponent(
      particle: Particle.generate(
        count: 8,
        lifespan: 0.2,
        generator: (i) => AcceleratedParticle(
          acceleration: getRandomVector(),
          speed: getRandomVector(),
          position: position.clone(),
          child: SpriteParticle(
            sprite: _particleSprite,
            size: Vector2.all(2)
          ),
        ),
      ),
    );


    add(particleComponent);
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    showImpact(info.eventPosition.game);
    super.onTapDown(pointerId, info);
  }

}