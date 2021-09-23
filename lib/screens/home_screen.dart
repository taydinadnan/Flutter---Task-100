import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const title = 'solomon_bottom_bar';
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  final tabs = [
    const Center(child: Text('Hey')),
    const Center(child: Text('hey')),
    const Center(
      child: Text('heyyy'),
    ),
    const Center(
      child: Text(
        'Work done will appear in this tab',
        style: TextStyle(
            fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    ),
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
            title: Text('Home'),
            backgroundColor: Color(0xFF22577A),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Chat'),
            backgroundColor: Color(0xFF38A3A5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
            backgroundColor: Color(0xFF57CC99),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            backgroundColor: Color(0xFF80ED99),
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
