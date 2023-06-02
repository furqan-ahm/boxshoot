import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:boxshoot/game/boxGame.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/palette.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

class Explosion extends Component with HasGameRef<BoxGame>, HasOpacityProvider{

  Vector2 position;
  Explosion({required this.position});

  
  
  late Sprite _particleSprite;

  late ParticleSystemComponent particleComponent;
  late ExpandingCircle circle;
  

  
   Vector2 getRandomVector() {
      return (Vector2.random(game.random) - Vector2.random(game.random)) * 100;
    }

    // Returns a random direction vector with slight angle to +ve y axis.
    Vector2 getRandomDirection() {
      return (Vector2.random(game.random) - Vector2(0.5, -1)).normalized();
    }



  @override
  FutureOr<void> onLoad() async{

    
    _particleSprite=await game.loadSprite('particle.png');

    particleComponent = ParticleSystemComponent(
      particle: Particle.generate(
        count: 8,
        lifespan: 0.4,
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

    circle=ExpandingCircle(position: position.clone());

    add(circle);
    add(particleComponent);

    add(OpacityEffect.fadeOut(EffectController(duration: 0.4,),));
    return super.onLoad();
  }


  @override
  void update(double dt) {
    if(particleComponent.progress==1){
      removeFromParent();
    }
    super.update(dt);
  }
  


}





class ExpandingCircle extends Component{
  SpriteComponent? circle;

  ExpandingCircle({required this.position});

  Vector2 position;


  @override
  FutureOr<void> onLoad() async{
    circle=SpriteComponent()..position=position..sprite=await Sprite.load('smoke.png')..size=Vector2(2, 2)..anchor=Anchor.center;
    add(circle!);
    return super.onLoad();
  }


  @override
  void update(double dt) {
    circle?.scale+=Vector2(0.5,0.5);
    super.update(dt);
  }

}


mixin HasOpacityProvider on Component implements OpacityProvider {
  double _opacity = 1;
  Paint _paint = BasicPalette.white.paint();

  @override
  double get opacity => _opacity;

  @override
  set opacity(double value) {
    if (value == _opacity) return;
    _opacity = value;
    _paint = Paint()..color = Colors.white.withOpacity(value);
  }

  @override
  void renderTree(Canvas canvas) {
    canvas.saveLayer(null, Paint()..blendMode = BlendMode.srcOver);
    super.renderTree(canvas);
    canvas.drawPaint(_paint..blendMode = BlendMode.modulate);
    canvas.restore();
  }
}