import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:http/http.dart' as http;
// import 'package:fluttertoast/fluttertoast.dart';

class OfficialGames extends StatefulWidget {
  const OfficialGames({Key? key}) : super(key: key);

  @override
  _OfficialGamesState createState() => _OfficialGamesState();
}

class _OfficialGamesState extends State<OfficialGames> {
  List officialItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getOfficialGames();
  }

  Future<void> getOfficialGames() async => {
        FirebaseFirestore.instance
            .collection('official_games')
            .get()
            .then((QuerySnapshot querySnapshot) => {
                  querySnapshot.docs.forEach((games) {
                    setState(() {
                      officialItems.add(games.data());
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
          children: officialItems
              .map((official) => GestureDetector(
                    onTap: () => {_showMyDialog(official['url'])},
                    child: Image.network(
                      official['url'],
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
    print(response.statusCode);
    var filePath =
        await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
    print(filePath);

    // Fluttertoast.showToast(
    //     msg: "La imagen ha sido guardada",
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.teal,
    //     textColor: Colors.white,
    //     fontSize: 18.0);
  }
}
