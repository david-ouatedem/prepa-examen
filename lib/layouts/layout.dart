import 'package:flutter/material.dart';
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

  final List<Widget> _screens = const [
    HomeScreen(title: "Home"),
    TutorsScreen(),
    UploadScreen(),
    AccountScreen(),
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onNavBarTapped,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.groups), label: "Tutors"),
          NavigationDestination(icon: Icon(Icons.upload_file), label: "Upload"),
          NavigationDestination(
              icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),
    );
  }

}