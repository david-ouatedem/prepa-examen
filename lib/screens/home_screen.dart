import 'package:flutter/material.dart';
import 'package:prepa_examen/common/ui/app_badge.dart';
import 'package:prepa_examen/common/ui/app_button.dart';
import 'package:prepa_examen/common/ui/exam_doc_grid_card.dart';
import 'package:prepa_examen/common/ui/sheet_widget.dart';
import 'package:prepa_examen/common/ui/tab_switch.dart';
import 'package:prepa_examen/l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:prepa_examen/modules/exam_papers/ui/widgets/filter_exam_docs_form.dart';

import '../common/ui/exam_doc_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;

  String? _selectedExam;
  String? _selectedSpeciality;
  String? _selectedSubject;
  String? _selectedYear;

  Future<void> _openFilterSheet() async {
    final result = await SheetWidget.show(
      context: context,
      title: 'Filter exam papers',
      child: const FilterExamDocsForm(),
    );

    if (result != null && mounted) {
      setState(() {
        _selectedExam = result['exam'];
        _selectedSpeciality = result['speciality'];
        _selectedSubject = result['subject'];
        _selectedYear = result['year'];
      });
    }
  }

  void _clearAllFilter(){
    setState(() {
      _selectedExam = null;
      _selectedSpeciality = null;
      _selectedSubject = null;
      _selectedYear = null;
    });
  }

  void _setCurrentTabIndex(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    bool isAnyFilterValueAvailable =
        (_selectedExam != null && _selectedExam!.isNotEmpty) ||
        (_selectedSpeciality != null && _selectedSpeciality!.isNotEmpty) ||
        (_selectedSubject != null && _selectedSubject!.isNotEmpty) ||
        (_selectedYear != null && _selectedYear!.isNotEmpty);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: l10n.filter,
                  icon: Icons.filter_list,
                  onPressed: _openFilterSheet,
                ),
                isAnyFilterValueAvailable ?
                AppButton(
                  label: "Clear filter",
                  icon: Icons.clear_all,
                  onPressed: _clearAllFilter,
                ) : const SizedBox.shrink(),
              ],
            ),

            isAnyFilterValueAvailable
                ? const SizedBox(height: 16)
                : const SizedBox.shrink(),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (_selectedExam != null)
                  AppBadge(label: "Exam", value: _selectedExam!),
                if (_selectedSpeciality != null)
                  AppBadge(label: "Speciality", value: _selectedSpeciality!),
                if (_selectedSubject != null)
                  AppBadge(label: "Subject", value: _selectedSubject!),
                if (_selectedYear != null)
                  AppBadge(label: "Year", value: _selectedYear!),
              ],
            ),
            const SizedBox(height: 16),
            TabSwitch(
              tabs: ["Grid", "List"],
              selectedTabIndex: _currentTabIndex,
              onChanged: (index) {
                _setCurrentTabIndex(index);
              },
            ),
            const SizedBox(height: 12),
            _currentTabIndex == 0
                ? Expanded(
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ExamDocGridCard(
                          fileName: index % 3 == 0
                              ? "Mathematics Paper ${index + 1} Very Long Title That Wraps Multiple Lines And Should Be Fully Visible Without Breaking Layout"
                              : "Math Paper ${index + 1}",
                          credits: 10,
                          imageUrl: "assets/images/image-1.jpg",
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: ExamDocListItem(
                            fileName: "Math Paper ${index + 1}",
                            credits: 10,
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
