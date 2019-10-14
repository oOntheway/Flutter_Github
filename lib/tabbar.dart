import 'package:flutter/material.dart';
import 'package:flutter_github/pages/test.dart';
import 'pages/home.dart';

class Tabbar extends StatefulWidget {
  Tabbar({Key key}) : super(key: key);

  @override
  _Tabbar createState() => _Tabbar();
}

class _Tabbar extends State<Tabbar> {

  int _selectedIndex = 0;

  final List<Widget> _widgetList = [
    Home(),
    Test(),
    Test()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('About'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
