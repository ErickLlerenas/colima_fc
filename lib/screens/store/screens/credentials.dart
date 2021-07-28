import 'package:colima_fc/screens/store/widgets/store_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Credentials extends StatefulWidget {
  const Credentials({Key? key}) : super(key: key);

  @override
  State<Credentials> createState() => _CredentialsState();
}

class _CredentialsState extends State<Credentials> {
  List credentialItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getCredentials();
  }

  Future<void> getCredentials() async => {
        FirebaseFirestore.instance
            .collection('credentials')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((credential) {
                    setState(() {
                      credentialItems.add(credential.data());
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
              children: credentialItems
                  .map((item) => StoreItem(item: item))
                  .toList())),
    );
  }
}
