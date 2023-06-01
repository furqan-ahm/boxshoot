import 'dart:async';

import 'package:flame/components.dart';

class Explosion extends Component{

  Vector2 position;

  Explosion({required this.position});

  @override
  FutureOr<void> onLoad() {
    
    return super.onLoad();
  }



  


}





class ExpandingCircle extends Component{
  late SpriteComponent circle;

  ExpandingCircle({required this.position});

  Vector2 position;


  @override
  FutureOr<void> onLoad() async{
    circle=SpriteComponent()..position=position..sprite=await Sprite.load('smoke.png')..size=Vector2(2, 2)..anchor=Anchor.center;
    add(circle);
    return super.onLoad();
  }

}