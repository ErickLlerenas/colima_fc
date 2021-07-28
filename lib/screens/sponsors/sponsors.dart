import 'package:colima_fc/screens/sponsors/widgets/sponsor_item.dart';
import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
  List sponsorItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getSponsors();
  }

  Future<void> getSponsors() async => {
        FirebaseFirestore.instance
            .collection('sponsors')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((sponsor) {
                    setState(() {
                      sponsorItems.add(sponsor.data());
                      isLoading = false;
                    });
                  })
                })
      };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patrocinadores'),
        backgroundColor: Colors.teal[500],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
          child: Wrap(
              children: sponsorItems
                  .map((item) => SponsorItem(item: item))
                  .toList())),
    );
  }
}
