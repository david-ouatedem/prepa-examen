import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExamDocListItem extends StatelessWidget {
  const ExamDocListItem({
    super.key,
    required this.fileName,
    required this.credits,
  });

  final String fileName;
  final int credits;

  @override
  Widget build(BuildContext context) {
    return (Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Icon(
              Icons.file_copy_outlined,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),

        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fileName,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                softWrap: true,
              ),
              const SizedBox(height: 8),
              Text(
                "$credits credits",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
