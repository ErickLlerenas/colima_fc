import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker_saver/image_picker_saver.dart';
// import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List eventGames = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  Future<void> getEvents() async => {
        FirebaseFirestore.instance
            .collection('events')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((games) {
                    setState(() {
                      eventGames.add(games.data());
                      isLoading = false;
                    });
                  })
                })
      };
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Wrap(
          children: eventGames
              .map((events) => GestureDetector(
                    onTap: () => {_showMyDialog(events['url'])},
                    child: Image.network(
                      events['url'],
                      height: width / 2,
                      width: width / 2,
                      fit: BoxFit.cover,
                    ),
                  ))
              .toList()),
    ));
  }

  Future<void> _showMyDialog(String image) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.network(image),
                SizedBox(height: 20),
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //         primary: Colors.blue,
                //         textStyle: const TextStyle(fontSize: 18)),
                //     onPressed: () {
                //       Navigator.pop(context);
                //       downloadImage(image);
                //     },
                //     child: Text('Descargar'))
              ],
            ),
          ),
        );
      },
    );
  }

  // Future<void> downloadImage(image) async {
  //   var response = await http.get(Uri.parse(image));
  //   if (response.statusCode == 200)
  //     await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
  //   Fluttertoast.showToast(
  //       msg: "La imagen ha sido guardada",
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.teal,
  //       textColor: Colors.white,
  //       fontSize: 18.0);
  // }
}
