import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estadísticas'),
        backgroundColor: Colors.teal[500],
      ),
      drawer: MyDrawer(),
      body: Container(),
    );
  }
}
