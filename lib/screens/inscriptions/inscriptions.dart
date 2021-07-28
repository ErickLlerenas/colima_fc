import 'package:colima_fc/screens/inscriptions/inscription_info.dart';
import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Inscriptions extends StatefulWidget {
  const Inscriptions({Key? key}) : super(key: key);

  @override
  _InscriptionsState createState() => _InscriptionsState();
}

class _InscriptionsState extends State<Inscriptions> {
  List inscriptionItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getInscriptions();
  }

  Future<void> getInscriptions() async => {
        FirebaseFirestore.instance
            .collection('inscriptions')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((inscription) {
                    setState(() {
                      inscriptionItems.add(inscription.data());
                      isLoading = false;
                    });
                  })
                })
      };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscripciones'),
        backgroundColor: Colors.teal[500],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: inscriptionItems
            .map((item) => (GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => InscriptionInfo(
                                  title: item['title'],
                                  description: item['description'],
                                )))
                  },
                  child: Container(
                    height: 200,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Text(
                              item['title'],
                              style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 10),
                              child: Text(
                                item['description'],
                                maxLines: 3,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Container(
                              margin:
                                  EdgeInsets.only(left: 30, right: 30, top: 10),
                              child: Text(
                                'Inscripciones: ' +
                                    item['list'].length.toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ))
                        ],
                      ),
                    ),
                  ),
                )))
            .toList(),
      ),
    );
  }
}
