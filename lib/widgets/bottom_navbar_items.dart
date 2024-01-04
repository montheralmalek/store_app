import 'package:flutter/material.dart';

class BottomNavigationBarItems extends StatelessWidget {
  const BottomNavigationBarItems({
    super.key,
    required this.icon,
    this.label,
  });
  final IconData icon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        Text(
          label ?? '',
          style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }
}
