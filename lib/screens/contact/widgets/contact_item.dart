import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactItem extends StatelessWidget {
  final String title;
  final String description;
  final FaIcon icon;
  final String link;
  ContactItem(
      {required this.title,
      required this.description,
      required this.icon,
      required this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(this.link),
      child: Container(
        height: 140,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.only(left: 30), child: this.icon)),
                  Expanded(
                      flex: 3,
                      child: Text(
                        this.title,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 30, top: 10),
                  child: Text(
                    this.description,
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
