import 'package:colima_fc/screens/news/widgets/new_item.dart';
import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List newsItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async => {
        FirebaseFirestore.instance
            .collection('news')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((news) {
                    setState(() {
                      newsItems.add(news.data());
                      isLoading = false;
                    });
                  })
                })
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.teal[500], title: Text('Noticias')),
      drawer: MyDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Wrap(
                  children:
                      newsItems.map((item) => NewsItem(item: item)).toList())),
    );
  }
}
