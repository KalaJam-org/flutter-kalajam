import 'package:flutter/material.dart';
import 'package:kalajam/style.dart';
import 'package:kalajam/views/screens/record_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({
    Key? key
  }) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _pageIdx = 0;

  Widget _getScreenByIdx(int idx) {
    switch(idx) {
      case 0: return const Text("Home screen");
      case 1: return const Text("Explore screen");
      //case 2:
      case 3: return const Text("Search screen");
      case 4: return const Text("Profile screen");
      default: return const Text("404");
    }
  }

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RecordScreen())
            );
          } else {
            setState(() {
              _pageIdx = value;
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: KalaStyle.kalaBlue,
        backgroundColor: KalaStyle.backgroundColor,
        currentIndex: _pageIdx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore, size: 30),
            label: "Explore"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 50,
              color: Colors.black,
              shadows: [
                Shadow(
                  offset: Offset(0.0, 0.0),
                  color: Colors.black,
                  blurRadius: 5,
                ),
                Shadow(
                  offset: Offset(2.0, 2.0),
                  color: Colors.amber,
                  blurRadius: 0,
                ),
                Shadow(
                  offset: Offset(-2.0, -2.0),
                  color: Colors.blue,
                  blurRadius: 0,
                ),
              ],
            ),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: "Search"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: "Profile"
          ),
        ],
      ),
      body: _getScreenByIdx(_pageIdx),
    );
}
