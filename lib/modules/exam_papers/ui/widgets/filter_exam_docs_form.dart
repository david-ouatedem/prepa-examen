import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:prepa_examen/common/ui/form/input_select_field.dart';

// Example Form using the reusable components
class FilterExamDocsForm extends StatefulWidget {
  const FilterExamDocsForm({super.key});

  @override
  State<FilterExamDocsForm> createState() => _FilterExamDocsFormState();
}

class _FilterExamDocsFormState extends State<FilterExamDocsForm> {
  String? selectedExam;
  String? selectedType;
  String? selectedSubject;
  String? selectedYear;

  final List<String> subjects = [
    'Mathematics',
    'Physics',
    'Chemistry',
    'Biology',
    'English',
  ];
  final List<String> exams = [
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert',
  ];
  final List<String> years = ['2024', '2023', '2022', '2021', '2020'];
  final List<String> specialities = [
    'Past Paper',
    'Mock Exam',
    'Practice Test',
    'Sample Paper',
  ];

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return Column(
      children: [
        InputSelectField(
          label: 'Exam',
          value: selectedExam,
          items: exams,
          onChanged: (value) => setState(() => selectedExam = value),
        ),
        const SizedBox(height: 16),

        InputSelectField(
          label: 'Speciality',
          value: selectedType,
          items: specialities,
          onChanged: (value) => setState(() => selectedType = value),
        ),
        const SizedBox(height: 16),

        InputSelectField(
          label: 'Subject',
          value: selectedSubject,
          items: subjects,
          onChanged: (value) => setState(() => selectedSubject = value),
        ),
        const SizedBox(height: 16),

        InputSelectField(
          label: 'Year',
          value: selectedYear,
          items: years,
          onChanged: (value) => setState(() => selectedYear = value),
        ),
        const SizedBox(height: 32),

        // Action buttons
        Row(
          children: [
            Expanded(
              child: isIOS
                  ? CupertinoButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    )
                  : OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: isIOS
                  ? CupertinoButton.filled(
                      onPressed: _isFormValid() ? _submitForm : null,
                      child: const Text('Submit'),
                    )
                  : ElevatedButton(
                      onPressed: _isFormValid() ? _submitForm : null,
                      child: const Text('Submit'),
                    ),
            ),
          ],
        ),
      ],
    );
  }

  bool _isFormValid() {
    return selectedSubject != null ||
        selectedExam != null ||
        selectedYear != null ||
        selectedType != null;
  }

  void _submitForm() {
    Navigator.pop(context, {
      'subject': selectedSubject,
      'level': selectedExam,
      'year': selectedYear,
      'type': selectedType,
    });
  }
}
