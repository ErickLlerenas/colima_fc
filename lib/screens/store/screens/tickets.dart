import 'package:colima_fc/screens/store/widgets/store_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tickets extends StatefulWidget {
  const Tickets({Key? key}) : super(key: key);

  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  List ticketItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTickets();
  }

  Future<void> getTickets() async => {
        FirebaseFirestore.instance
            .collection('tickets')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((ticket) {
                    setState(() {
                      ticketItems.add(ticket.data());
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
              children:
                  ticketItems.map((item) => StoreItem(item: item)).toList())),
    );
  }
}
