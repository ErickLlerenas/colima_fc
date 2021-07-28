import 'package:flutter/material.dart';

class InscriptionInfo extends StatefulWidget {
  final String title;
  final String description;

  InscriptionInfo({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  _InscriptionInfoState createState() => _InscriptionInfoState();
}

class _InscriptionInfoState extends State<InscriptionInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.teal[500],
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.description,
                    style: TextStyle(color: Colors.grey[700], fontSize: 18),
                    textAlign: TextAlign.justify),
                SizedBox(height: 50),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu nombre',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu nombre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu teléfono',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu teléfono';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                      }
                    },
                    child: const Text('Inscribirme'),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
