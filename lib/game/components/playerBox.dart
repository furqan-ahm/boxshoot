import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/particles.dart' as flame;
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:get/get.dart';

import '../../controllers/game_controller.dart';
import '../boxGame.dart';

class PlayerBox extends BodyComponent<BoxGame> with ContactCallbacks {
  PlayerBox({
    required this.position,
    required this.size,
  });

  Vector2 position;
  Vector2 size;

  @override
  bool get renderBody => false;
  

  GameController get controller=>Get.find<GameController>();



  applyImpact(Vector2 explodePoint){
    Vector2 impact=(body.position-explodePoint);
    
    double dforce=15-impact.length;
    dforce=dforce<0?0:dforce;

    body.applyLinearImpulse(impact.normalized()*(dforce)*1000);
  }


  @override
  void beginContact(Object other, Contact contact) {
    
  }

  @override
  Future<void> onLoad() async {
    SpriteComponent sprite = SpriteComponent()
      ..size = size
      ..sprite = await game.loadSprite('playerBox.png')
      ..anchor = Anchor.center;
    add(sprite);

    await super.onLoad();
    
  }


  
  @override
  void update(double dt) {
 
    super.update(dt);
  }

 
  @override
  Body createBody() {
    Shape shape = PolygonShape()..setAsBoxXY(size.x / 2, size.y / 2);
    BodyDef bodyDef = BodyDef(
        position: position + Vector2(size.x / 2, 0),
        type: BodyType.dynamic,
        userData: this);
    FixtureDef fixtureDef = FixtureDef(
      shape,
      friction: 0.3,
      density: 5,
      restitution: 0.2,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}