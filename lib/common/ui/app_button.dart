import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white, // text/icon color
        shape: const StadiumBorder(), // rounded-full
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // px-4 h-10
        minimumSize: const Size(84, 40), // min-w-[84px] h-10
        maximumSize: const Size(480, 40), // max-w-[480px]
        textStyle: const TextStyle(
          fontSize: 14, // text-sm
          fontWeight: FontWeight.bold,
          letterSpacing: 0.015 * 14, // tracking-[0.015em]
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: Colors.white),
          const SizedBox(width: 8), // gap-2
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis, // truncate
            ),
          ),
        ],
      ),
    );
  }
}
