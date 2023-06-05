import 'dart:async';

import 'package:ysh/game/components/target.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import '../boxGame.dart';
import '../components/boundary.dart';
import '../components/playerBox.dart';

class MapLevel extends Component with HasGameRef<BoxGame>{

  MapLevel({required this.level}):super();

  int level;

  late Vector2 mapSize;

  @override
  FutureOr<void> onLoad() async{
    TiledComponent map=await TiledComponent.load('level$level.tmx', Vector2.all(32)/10, priority: 20);
    add(map);
    mapSize=map.scaledSize;
    

    final spawnLayer=map.tileMap.getLayer<ObjectGroup>('spawn');

    final platformLayer=map.tileMap.getLayer<ObjectGroup>('components');


    for(final platform in platformLayer!.objects){
      game.add(Boundary(position: Vector2(platform.x/10, platform.y/10), size: Vector2(platform.width/10, platform.height/10), isPlatform: platform.class_=='platform'));
    }

    for(final spawn in spawnLayer!.objects){
      if(spawn.class_=='playerSpawn'){
        await game.addPlayer(PlayerBox(position: Vector2(spawn.x/10,spawn.y/10), size: Vector2(spawn.width/10, spawn.height/10)*0.8));
      }


      if(spawn.class_=='targetSpawn'){
        game.add(Target(position: Vector2(spawn.x/10,spawn.y/10)+Vector2(spawn.width/20, spawn.width/40)));
      }

    }


    if(level==1){

    }
    
    
    if(level==4||level==5||level==8||level==9)game.player?.cameraFollow();
    else game.camera.followVector2(Vector2(map.scaledSize.x/2, map.scaledSize.y/2));
    return super.onLoad();
  }

}