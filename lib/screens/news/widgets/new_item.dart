import 'package:colima_fc/screens/news/news_info.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  final Map item;
  NewsItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => NewsInfo(
                    title: this.item['title'],
                    image: this.item['image'],
                    description: this.item['description'])))
      },
      child: Container(
        child: Card(
            child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(this.item['image'],
                  height: 150, fit: BoxFit.cover),
            ),
            Expanded(
              flex: 2,
              child: Container(
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
                    SizedBox(height: 10),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
