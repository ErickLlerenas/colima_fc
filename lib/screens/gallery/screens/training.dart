import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Training extends StatefulWidget {
  const Training({Key? key}) : super(key: key);

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  List friendlyGameItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTraining();
  }

  Future<void> getTraining() async => {
        FirebaseFirestore.instance
            .collection('training')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((games) {
                    setState(() {
                      friendlyGameItems.add(games.data());
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
          children: friendlyGameItems
              .map((training) => GestureDetector(
                    onTap: () => {_showMyDialog(training['url'])},
                    child: Image.network(
                      training['url'],
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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: const TextStyle(fontSize: 18)),
                    onPressed: () {
                      Navigator.pop(context);
                      downloadImage(image);
                    },
                    child: Text('Descargar'))
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> downloadImage(_image) async {
    var response = await http.get(Uri.parse(_image));
    await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
    Fluttertoast.showToast(
        msg: "La imagen ha sido guardada",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.teal,
        textColor: Colors.white,
        fontSize: 18.0);
  }
}
