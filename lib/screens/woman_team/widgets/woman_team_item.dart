import 'package:flutter/material.dart';

class WomanTeamItem extends StatelessWidget {
  final Map item;
  WomanTeamItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width / 2,
      child: Card(
          child: Column(
        children: [
          SizedBox(
              height: width / 2,
              width: width / 2,
              child: Container(
                margin: EdgeInsets.all(25),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                    this.item['image'],
                  ),
                ),
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(this.item['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(height: 10),
                Text(
                  this.item['position'],
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                SizedBox(height: 15),
              ],
            ),
          )
        ],
      )),
    );
  }
}
