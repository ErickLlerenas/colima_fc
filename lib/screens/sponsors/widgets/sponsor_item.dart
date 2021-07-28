import 'package:colima_fc/screens/history/widgets/founder_item_info.dart';
import 'package:flutter/material.dart';

class SponsorItem extends StatelessWidget {
  final Map item;
  SponsorItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => FounderTeamInfo(
                    image: this.item['image'],
                    name: this.item['name'],
                    description: this.item['description'])))
      },
      child: Container(
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
                    this.item['description'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
