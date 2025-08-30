import 'package:flutter/material.dart';
import 'package:prepa_examen/modules/exam_papers/ui/widgets/filter_exam_docs_form.dart';

// Reusable Bottom Sheet Component
class SheetWidget extends StatelessWidget {
  const SheetWidget({
    super.key,
    required this.title,
    required this.child,
    this.showHandle = true,
    this.padding,
  });

  final String title;
  final Widget child;
  final bool showHandle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding:
              padding ??
              EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showHandle) ...[
                // Handle bar
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],

              // Title
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // Content
              child,
            ],
          ),
        ),
      ),
    );
  }

  // Static method to show the sheet
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget child,
    bool showHandle = true,
    EdgeInsets? padding,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (context) => SheetWidget(
        title: title,
        showHandle: showHandle,
        padding: padding,
        child: child,
      ),
    );
  }
}
