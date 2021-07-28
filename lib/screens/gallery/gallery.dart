import 'package:colima_fc/screens/gallery/screens/events.dart';
import 'package:colima_fc/screens/gallery/screens/friendly_games.dart';
import 'package:colima_fc/screens/gallery/screens/official_games.dart';
import 'package:colima_fc/screens/gallery/screens/training.dart';
import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);
  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    OfficialGames(),
    FriendlyGames(),
    Training(),
    Events()
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
        title: Text('Gallery'),
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
            icon: FaIcon(FontAwesomeIcons.images),
            label: 'Oficial',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.images),
            label: 'Amistoso',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.images),
            label: 'Entrenamiento',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.images),
            label: 'Eventos',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
