import 'package:flutter/material.dart';
import 'package:tech387task/screens/fake_screens/fake_chat_screen.dart';
import 'package:tech387task/screens/fake_screens/fake_home_screen.dart';
import 'package:tech387task/screens/fake_screens/fake_notifications_screen.dart';

import './pofile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const title = 'solomon_bottom_bar';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  final tabs = [
    const Center(child: fakeHomeScreen()),
    const Center(child: ChatScreen()),
    const Center(
      child: fakeNotification(),
    ),
    const Center(child: ProfilePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: tabs[_currentIndex],
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFB8D0DE),
              Color(0xfF9FC2D6),
              Color(0xfF86B4CF),
            ],
          ),
        ),
      ),

      //Bottom bar icons and names
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFB8D0DE),
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('Home'),
            backgroundColor: Color(0xfF86B4CF),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            // ignore: deprecated_member_use
            title: Text('Chat'),
            backgroundColor: Color(0xfF86B4CF),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            // ignore: deprecated_member_use
            title: Text('Notifications'),
            backgroundColor: Color(0xfF86B4CF),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            // ignore: deprecated_member_use
            title: Text('Profile'),
            backgroundColor: Color(0xfF86B4CF),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
