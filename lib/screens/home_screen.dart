import 'package:flutter/material.dart';
import 'package:prepa_examen/common/ui/app_badge.dart';
import 'package:prepa_examen/common/ui/app_button.dart';
import 'package:prepa_examen/l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
