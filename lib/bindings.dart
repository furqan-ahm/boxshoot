import 'package:ysh/controllers/game_controller.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings{


  @override
  void dependencies() {
    Get.put(GameController());
  }

}