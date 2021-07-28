import 'package:colima_fc/screens/history/widgets/founder_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Founders extends StatefulWidget {
  const Founders({Key? key}) : super(key: key);

  @override
  State<Founders> createState() => _FoundersState();
}

class _FoundersState extends State<Founders> {
  List founderItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getFounders();
  }

  Future<void> getFounders() async => {
        FirebaseFirestore.instance
            .collection('founders')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((founder) {
                    setState(() {
                      founderItems.add(founder.data());
                      isLoading = false;
                    });
                  })
                })
      };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Wrap(
              children: founderItems
                  .map((item) => FounderItem(item: item))
                  .toList())),
    );
  }
}
