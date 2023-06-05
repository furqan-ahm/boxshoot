import 'package:flutter/material.dart';

class Background extends StatelessWidget {
const Background({ Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/bg.png'), fit: BoxFit.fill, alignment: Alignment.center, colorFilter: ColorFilter.mode(Color(0xffFF6801), BlendMode.hardLight))
      ),
      child: child,
    );
  }
}