import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Anthem extends StatefulWidget {
  const Anthem({Key? key}) : super(key: key);

  @override
  _AnthemState createState() => _AnthemState();
}

class _AnthemState extends State<Anthem> {
  List anthemItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getAnthem();
  }

  Future<void> getAnthem() async => {
        FirebaseFirestore.instance
            .collection('anthem')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((anthem) {
                    setState(() {
                      anthemItems.add(anthem.data());
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
          children: anthemItems
              .map((anthem) => Container(
                    margin: EdgeInsets.all(20),
                    width: width,
                    child: Text(
                      anthem['description'],
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                    ),
                  ))
              .toList()),
    ));
  }
}
