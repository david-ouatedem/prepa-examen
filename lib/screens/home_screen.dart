import 'package:flutter/material.dart';
import 'package:prepa_examen/common/ui/app_badge.dart';
import 'package:prepa_examen/common/ui/app_button.dart';
import 'package:prepa_examen/common/ui/exam_doc_grid_card.dart';
import 'package:prepa_examen/common/ui/tab_switch.dart';
import 'package:prepa_examen/l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;

  void _setCurrentTabIndex(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
            AppButton(
              label: l10n.filter,
              icon: Icons.filter_list,
              onPressed: () {
                print("Filter button pressed");
              },
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                AppBadge(label: "Exam", value: "BAC"),
                AppBadge(label: "Speciality", value: "BAGN"),
                AppBadge(label: "Subject", value: "Mathematics paper 2"),
                AppBadge(label: "Year", value: "2020"),
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
            Expanded(
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
