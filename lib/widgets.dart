import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Color color;
  final String name;
  final double size;
  final VoidCallback onPressed;
  const Buttons({super.key, required this.color, required this.name, required this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color(0xff19222f),
      minWidth: size,
      child: Text(
        name,
        style: TextStyle(
          color: Color(0xffd8dcdf),
        ),
      ),
    );
  }
}