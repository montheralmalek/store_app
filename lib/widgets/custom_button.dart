import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.icon,
    this.height,
    this.color,
    this.textColor,
    this.borderRadius = BorderRadius.zero,
  });
  final Widget text;
  final Icon? icon;
  final VoidCallback onTap;
  final double? height;
  final Color? color, textColor;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      onPressed: onTap,
      textColor: textColor ?? Theme.of(context).colorScheme.onPrimary,
      color: color ?? Theme.of(context).colorScheme.primary,
      // minWidth: 100,
      height: height,
      shape: ContinuousRectangleBorder(borderRadius: borderRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          text,
          const Gap(10),
          icon ?? const Icon(null),
        ],
      ),
    );
  }
}
