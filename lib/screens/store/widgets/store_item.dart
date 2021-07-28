import 'package:colima_fc/screens/store/screens/store_item_info.dart';
import 'package:flutter/material.dart';

class StoreItem extends StatelessWidget {
  final Map item;
  StoreItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => StoreItemInfo(
                    title: this.item['title'],
                    image: this.item['image'],
                    description: this.item['description'],
                    price: this.item['price'].toDouble())))
      },
      child: Container(
        width: width / 2,
        child: Card(
            child: Column(
          children: [
            Image.network(
              this.item['image'],
              height: width / 2,
              width: width / 2,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(this.item['title'],
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
                        fontSize: 14),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '\$' + this.item['price'].toString(),
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
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
