import 'package:colima_fc/screens/contact/widgets/contact_item.dart';
import 'package:colima_fc/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto'),
        backgroundColor: Colors.teal[500],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          ContactItem(
              title: 'Twitter',
              description: 'Colima Futbol Club @fc_colima',
              link: 'https://twitter.com/fc_colima',
              icon: FaIcon(
                FontAwesomeIcons.twitter,
                size: 40,
                color: Colors.blue,
              )),
          ContactItem(
              title: 'Facebook',
              description: 'FC_Colima',
              link: 'https://facebook.com/CaimanesColimaFC',
              icon: FaIcon(
                FontAwesomeIcons.facebook,
                size: 40,
                color: Colors.blue,
              )),
          ContactItem(
              title: 'Instagram',
              description: 'fc_colima',
              link: 'https://instagram.com/fc_colima/',
              icon: FaIcon(
                FontAwesomeIcons.instagram,
                size: 40,
                color: Colors.pink,
              )),
          ContactItem(
              title: 'Web',
              description: 'Colima Futbol Club',
              link: 'http://colimafc.mx',
              icon: FaIcon(
                FontAwesomeIcons.desktop,
                size: 35,
                color: Colors.grey,
              )),
          ContactItem(
              title: 'Correo',
              description: 'administracion@colimafc.mx',
              link:
                  'mailto:administracion@colimafc.mx?subject="Contacto desde Colima FC App"',
              icon: FaIcon(
                FontAwesomeIcons.mailBulk,
                size: 35,
                color: Colors.orange,
              )),
          ContactItem(
              title: 'Teléfono',
              description: '312 318 7776',
              link: 'tel:312 318 7776',
              icon: FaIcon(
                FontAwesomeIcons.phone,
                size: 35,
                color: Colors.green,
              )),
        ]),
      ),
    );
  }
}
