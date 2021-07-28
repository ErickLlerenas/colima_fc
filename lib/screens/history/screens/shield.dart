import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Shield extends StatefulWidget {
  const Shield({Key? key}) : super(key: key);

  @override
  _ShieldState createState() => _ShieldState();
}

class _ShieldState extends State<Shield> {
  List shieldItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getShield();
  }

  Future<void> getShield() async => {
        FirebaseFirestore.instance
            .collection('shield')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((shield) {
                    setState(() {
                      shieldItems.add(shield.data());
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
          children: shieldItems
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
