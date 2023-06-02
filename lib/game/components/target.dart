import 'dart:async';

import 'package:boxshoot/game/boxGame.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Target extends Component with ContactCallbacks{
  Target({required this.position});

  Vector2 position;

  @override
  FutureOr<void> onLoad() {
    spawnBoxes();
    return super.onLoad();
  }

  spawnBoxes() {
    for (int j = 0; j < 4; j++) {
      for (int i = -3; i <= 3; i++) {
        add(SmallTargetBox(
            position: Vector2(position.x + i * (1.6) - 0.8, position.y+j*(1.6))));
      }
    }
  }
}

class SmallTargetBox extends BodyComponent<BoxGame> {
  Vector2 position;
  Vector2 size = Vector2(1.6, 1.6);

  SmallTargetBox({required this.position});

  @override
  // TODO: implement renderBody
  bool get renderBody => false;

  @override
  Future<void> onLoad() async {
    SpriteComponent sprite = SpriteComponent()
      ..size = size
      ..sprite = await game.loadSprite('smallBox.png')
      ..anchor = Anchor.center;
    add(sprite);

    
    await super.onLoad();
    Future.delayed(const Duration(seconds: 2,), (){ready=true;});
  }


  bool ready=false;

  @override
  void update(double dt) {
    if(body.linearVelocity.length>0.01&&ready){
      body.linearVelocity=(body.linearVelocity.normalized()*150);
      ready=false;
    }
    super.update(dt);
  }

  @override
  Body createBody() {
    Shape shape = PolygonShape()..setAsBoxXY(size.x / 2, size.y / 2);
    BodyDef bodyDef = BodyDef(
        position: position + Vector2(size.x / 2, 0),
        type: BodyType.dynamic,
        gravityOverride: Vector2(0, 5),
        userData: this);
    FixtureDef fixtureDef = FixtureDef(
      shape,
      friction: 0.3,
      density: 5,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
