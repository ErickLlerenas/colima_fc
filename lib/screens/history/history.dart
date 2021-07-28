import 'package:flutter/material.dart';
import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//screens
import 'package:colima_fc/screens/history/screens/anthem.dart';
import 'package:colima_fc/screens/history/screens/founders.dart';
import 'package:colima_fc/screens/history/screens/shield.dart';
import 'package:colima_fc/screens/history/screens/stadium.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Founders(),
    Anthem(),
    Shield(),
    Stadium()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historia'),
        backgroundColor: Colors.teal[500],
      ),
      drawer: MyDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.users),
            label: 'Fundadores',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.alignCenter),
            label: 'Himno',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shieldAlt),
            label: 'Escudo',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.futbol),
            label: 'Estadio',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
