import 'package:colima_fc/screens/team/widgets/team_item.dart';
import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  List teamItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTeam();
  }

  Future<void> getTeam() async => {
        FirebaseFirestore.instance
            .collection('team')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((team) {
                    setState(() {
                      teamItems.add(team.data());
                      isLoading = false;
                    });
                  })
                })
      };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal[500], title: Text('Equipo')),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
          child: Wrap(
              children:
                  teamItems.map((item) => TeamItem(item: item)).toList())),
    );
  }
}
