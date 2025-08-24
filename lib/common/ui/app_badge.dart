import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  final String label;
  final String value;
  final Color? backgroundColor; // allow overriding
  final Color? textColor;

  const AppBadge({
    super.key,
    required this.label,
    required this.value,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20), // rounded pill shape
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor ?? Colors.white,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            value,
            style: TextStyle(
              color: textColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
