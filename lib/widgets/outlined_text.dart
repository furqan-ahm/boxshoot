import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  const OutlinedText({Key? key, required this.text, required this.style, this.strokeColor=Colors.black, this.fillColor=Colors.white})
      : super(key: key);

  final String text;
  final TextStyle style;
  final Color strokeColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: style.copyWith(
            color: null,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 7
              ..color = strokeColor,
          
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          text,
          style: style.copyWith(color: fillColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
