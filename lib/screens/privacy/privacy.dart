import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal[500],
            title: Text('Política de privacidad')),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Erick creó la aplicación Colima FC como una aplicación gratuita. Este SERVICIO es proporcionado por Erick sin costo y está diseñado para usarse tal cual.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
              Text(
                'Esta app se utiliza para informar a los visitantes sobre mis políticas con la recopilación, uso y divulgación de Información personal si alguien decide utilizar mi Servicio.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
              Text(
                'Si elige utilizar mi Servicio, entonces acepta la recopilación y el uso de información en relación con esta política. La información personal que recopilo se utiliza para proporcionar y mejorar el servicio. No usaré ni compartiré su información con nadie excepto como se describe en esta Política de Privacidad.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
              Text(
                'Los términos utilizados en esta Política de privacidad tienen el mismo significado que en nuestros Términos y condiciones, a los que se puede acceder en Colima FC a menos que se defina lo contrario en esta Política de privacidad.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
              Text(
                'Recopilación y uso de información',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Para una mejor experiencia, al utilizar nuestro Servicio, es posible que le solicite que nos proporcione cierta información de identificación personal, que incluye, entre otros, Colima FC. La información que solicito se conservará en su dispositivo y no la recopilaré de ninguna manera.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
              Text(
                'La aplicación utiliza servicios de terceros que pueden recopilar información utilizada para identificarlo.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
              Text(
                'Enlace a la política de privacidad de los proveedores de servicios externos utilizados por la aplicación',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
              Text(
                '⚽ Servicios de Google Play',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 20),
              Text(
                '⚽ Firebase Firestore',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 17,
                    fontWeight: FontWeight.normal),
              ),
            ]),
          ),
        ));
  }
}
