import 'package:flutter/material.dart';

class NewsInfo extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  const NewsInfo(
      {Key? key,
      required this.title,
      required this.image,
      required this.description})
      : super(key: key);

  @override
  State<NewsInfo> createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {
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
