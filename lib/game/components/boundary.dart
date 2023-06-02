import 'dart:ui';

import 'package:flame_forge2d/flame_forge2d.dart';

class Boundary extends BodyComponent{

  
  Boundary({
    required this.position,
    required this.size,
    required this.isPlatform,
  });


  
  Vector2 position;
  Vector2 size;
  bool isPlatform;


  @override
  // TODO: implement renderBody
  bool get renderBody => isPlatform;

  @override
  // TODO: implement paint
  Paint get paint => super.paint..color=Color(0xff141B25);

  

  @override
  Body createBody() {
    Shape shape=PolygonShape()..setAsBoxXY(size.x/2, size.y/2);
    BodyDef bodyDef= BodyDef(position: position+Vector2(size.x/2, size.y/2), type: BodyType.static, userData: this);
    FixtureDef fixtureDef = FixtureDef(shape, friction: 0.8, density: 1, restitution: 0);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }




}