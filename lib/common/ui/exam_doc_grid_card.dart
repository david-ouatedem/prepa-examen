import 'package:flutter/material.dart';

class ExamDocGridCard extends StatelessWidget {
  const ExamDocGridCard({
    super.key,
    required this.fileName,
    required this.credits,
    required this.imageUrl,
  });

  final String fileName;
  final int credits;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 8),
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
    );
  }
}