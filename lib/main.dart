import 'package:flutter/services.dart';
import 'package:ysh/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysh/screens/menu_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Box Shoot',
      initialBinding: GlobalBindings(),
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.blue,
      ),
      home: const MenuScreen(),
    );
  }
}
