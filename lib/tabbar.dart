import 'package:flutter/material.dart';

import 'pages/home.dart';

class Tabbar extends StatefulWidget {
  Tabbar({Key key}) : super(key: key);

  @override
  _Tabbar createState() => _Tabbar();
}

class _Tabbar extends State<Tabbar> {

  int _selectedIndex = 0;

  RandomWords _r = new RandomWords();

  List _widgetOptions = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _tabbarBuild(),
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

  Widget _tabbarBuild() {
    _widgetOptions = [
      _r,
      Text('Favorite'),
      Text('About')
    ];

    return _widgetOptions.elementAt(_selectedIndex);
  }
}