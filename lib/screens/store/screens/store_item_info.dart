import 'package:flutter/material.dart';

class StoreItemInfo extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final double price;

  const StoreItemInfo(
      {Key? key,
      required this.title,
      required this.image,
      required this.description,
      required this.price})
      : super(key: key);

  @override
  State<StoreItemInfo> createState() => _StoreItemInfoState();
}

class _StoreItemInfoState extends State<StoreItemInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal[500], title: Text(widget.title)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.image,
                  width: width, height: width, fit: BoxFit.cover),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "\$${widget.price}",
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        )),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.teal,
                                textStyle: const TextStyle(fontSize: 20)),
                            onPressed: () {},
                            child: Text('Comprar')))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  widget.description,
                  style: TextStyle(color: Colors.grey[700], fontSize: 20),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ));
  }
}
