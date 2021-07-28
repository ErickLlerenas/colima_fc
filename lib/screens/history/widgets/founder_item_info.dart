import 'package:flutter/material.dart';

class FounderTeamInfo extends StatefulWidget {
  final String image;
  final String name;
  final String description;

  FounderTeamInfo(
      {Key? key,
      required this.image,
      required this.name,
      required this.description})
      : super(key: key);

  @override
  State<FounderTeamInfo> createState() => _FounderTeamInfoState();
}

class _FounderTeamInfoState extends State<FounderTeamInfo> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.teal[500], title: Text(widget.name)),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.network(widget.image,
              width: width, height: width, fit: BoxFit.cover),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              widget.description,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
          )
        ],
      )),
    );
  }
}
