import 'package:colima_fc/screens/store/widgets/store_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List productItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Future<void> getProducts() async => {
        FirebaseFirestore.instance
            .collection('products')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((team) {
                    setState(() {
                      productItems.add(team.data());
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
                  productItems.map((item) => StoreItem(item: item)).toList())),
    );
  }
}
