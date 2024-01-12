import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RateProductShowWidget extends StatelessWidget {
  const RateProductShowWidget({
    super.key,
    required this.rateValue,
    this.backgroundColor,
  });
  final double rateValue;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Text('$rateValue'),
          const Gap(5),
          const Icon(
            Icons.star,
            size: 18,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
