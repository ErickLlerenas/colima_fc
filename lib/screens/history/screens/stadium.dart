import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Stadium extends StatefulWidget {
  const Stadium({Key? key}) : super(key: key);

  @override
  _StadiumState createState() => _StadiumState();
}

class _StadiumState extends State<Stadium> {
  List stadiumItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getStadium();
  }

  Future<void> getStadium() async => {
        FirebaseFirestore.instance
            .collection('stadium')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((stadium) {
                    setState(() {
                      stadiumItems.add(stadium.data());
                      isLoading = false;
                    });
                  })
                })
      };
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Wrap(
          children: stadiumItems
              .map((official) => GestureDetector(
                    onTap: () => {},
                    child: Image.network(
                      official['url'],
                      height: width / 2,
                      width: width / 2,
                      fit: BoxFit.cover,
                    ),
                  ))
              .toList()),
    ));
  }
}
