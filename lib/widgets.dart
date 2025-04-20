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

  typedef CallbackSetting = void Function(String, int);
class SettingButton extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final String setting;
  final int value;
  final CallbackSetting callback;
  const SettingButton({super.key, required this.color, 
  required this.text, required this.value, 
  required this.size, required this.setting, required this.callback});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: color,
      minWidth: size,
      onPressed: () => callback(setting, value),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      );
  }
}