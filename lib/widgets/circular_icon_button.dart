import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
  });
  final double? size, iconSize;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor, iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: IconButton(
        iconSize: iconSize,
        padding: EdgeInsets.zero,
        // color: iconColor,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}
