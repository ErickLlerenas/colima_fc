import 'package:colima_fc/screens/woman_team/widgets/woman_team_item.dart';
import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WomanTeam extends StatefulWidget {
  const WomanTeam({Key? key}) : super(key: key);

  @override
  State<WomanTeam> createState() => _WomanTeamState();
}

class _WomanTeamState extends State<WomanTeam> {
  List teamItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTeam();
  }

  Future<void> getTeam() async => {
        FirebaseFirestore.instance
            .collection('women_team')
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
      appBar: AppBar(
          backgroundColor: Colors.teal[500], title: Text('Equipo Femenil')),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
          child: Wrap(
              children:
                  teamItems.map((item) => WomanTeamItem(item: item)).toList())),
    );
  }
}
