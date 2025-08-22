import 'package:flutter/material.dart';
import 'package:prepa_examen/l10n/app_localizations.dart';
import 'package:prepa_examen/screens/account_screen.dart';
import 'package:prepa_examen/screens/home_screen.dart';
import 'package:prepa_examen/screens/tutors_screen.dart';
import 'package:prepa_examen/screens/upload_screen.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get localized strings
    final l10n = AppLocalizations.of(context)!;

    final List<Widget> screens = [
      HomeScreen(title: l10n.homeTitle),
      const TutorsScreen(),
      const UploadScreen(),
      const AccountScreen(),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onNavBarTapped,
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home), label: l10n.home),
          NavigationDestination(
            icon: const Icon(Icons.groups),
            label: l10n.tutors,
          ),
          NavigationDestination(
            icon: const Icon(Icons.upload_file),
            label: l10n.upload,
          ),
          NavigationDestination(
            icon: const Icon(Icons.account_circle),
            label: l10n.account,
          ),
        ],
      ),
    );
  }
}
