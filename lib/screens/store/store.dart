import 'package:colima_fc/screens/store/screens/credentials.dart';
import 'package:colima_fc/screens/store/screens/products.dart';
import 'package:colima_fc/screens/store/screens/tickets.dart';
import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);
  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Products(),
    Credentials(),
    Tickets()
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
        title: Text('Tienda'),
        backgroundColor: Colors.teal[500],
      ),
      drawer: MyDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shoppingBag),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.addressCard),
            label: 'Credenciales',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.ticketAlt),
            label: 'Boletos',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
