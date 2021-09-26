import 'package:flutter/material.dart';
import 'package:tech387task/screens/profile_screenn.dart';

import '../screens/fake_screens/fake_chat_screen.dart';
import '../screens/fake_screens/fake_home_screen.dart';
import '../screens/fake_screens/fake_notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  static const title = 'solomon_bottom_bar';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

// bottom navigation bar content
  final tabs = [
    const Center(child: fakeHomeScreen()),
    const Center(child: ChatScreen()),
    const Center(
      child: fakeNotification(),
    ),
    const Center(child: ProfileSc()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: tabs[_currentIndex],
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          gradient: const LinearGradient(
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              colors: [
                Color(0xFFCCCCFF),
                Color(0xFF96DED1),
                Color(0XFFB6D0E2),
                Color(0XFFB6D0E2),
                Color(0XFFB6D0E2),
                Color(0xFF96DED1),
              ],
              stops: [
                0.0,
                0.3,
                0.3,
                0.7,
                0.7,
                1.0
              ]),
        ),
      ),

      //Bottom bar icons and names
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: Text('Home'),
            backgroundColor: Color(0XFFB6D0E2),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            // ignore: deprecated_member_use
            title: Text('Chat'),
            backgroundColor: Color(0xFFCCCCFF),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            // ignore: deprecated_member_use
            title: Text('Notifications'),
            backgroundColor: Color(0xFF96DED1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            // ignore: deprecated_member_use
            title: Text('Profile'),
            backgroundColor: Color(0XFFB6D0E2),
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
