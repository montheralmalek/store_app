import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.height = 40,
    this.width = double.infinity,
    this.color,
    this.textColor,
    this.borderRadius = BorderRadius.zero,
    this.borderSide,
  });
  final Widget text;
  final Icon? icon;
  final VoidCallback onPressed;
  final double height, width;
  final BorderSide? borderSide;
  final Color? color, textColor;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon ?? const SizedBox(),
      label: text,
      style: ButtonStyle(
          iconColor: MaterialStateProperty.all(textColor),
          textStyle: MaterialStateProperty.all(TextStyle(
            color: textColor,
          )),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: borderRadius)),
          side: MaterialStateProperty.all(borderSide),
          minimumSize: MaterialStateProperty.all(Size(width, height))),
    );
  }
}
