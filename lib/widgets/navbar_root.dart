import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/messages_screen.dart';
import 'package:flutter_application_1/screens/schedule_screen.dart';
import 'package:flutter_application_1/screens/setting_screen.dart';

class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;

  // List of screens to navigate
  final List<Widget> _screens = [
    HomeScreen(),
    MessagesScreen(),
    ScheduleScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF7165D6),
      unselectedItemColor: Colors.black26,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: _buildBottomNavigationBarItems(),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.chat_bubble_text_fill),
        label: "Messages",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.calendar_month),
        label: "Schedule",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Settings",
      ),
    ];
  }
}