import 'package:flutter/material.dart';

class BNavBarItem extends StatelessWidget {
  const BNavBarItem({
    super.key,
    required this.icon,
    this.label,
    this.notification,
  });
  final IconData icon;
  final String? label;
  final int? notification;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
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
        ),
        //----------- Start Notification --------------------
        if (notification != null)
          Positioned(
            top: 10,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$notification',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 10),
              ),
            ),
          ),
      ],
    );
  }
}
