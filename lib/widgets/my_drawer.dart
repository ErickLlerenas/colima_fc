import 'package:colima_fc/screens/contact/contact.dart';
import 'package:colima_fc/screens/gallery/gallery.dart';
import 'package:colima_fc/screens/history/history.dart';
import 'package:colima_fc/screens/privacy/privacy.dart';
import 'package:colima_fc/screens/sponsors/sponsors.dart';
// import 'package:colima_fc/screens/statistics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Screens
// import 'package:colima_fc/screens/inscriptions/inscriptions.dart';
import 'package:colima_fc/screens/news/news.dart';
import 'package:colima_fc/screens/store/store.dart';
import 'package:colima_fc/screens/team/team.dart';
import 'package:colima_fc/screens/woman_team/woman_team.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.teal[900]),
              accountName: Text("Colima FC"),
              accountEmail: Text("Equipo de fútbol"),
              currentAccountPicture: Image.asset('assets/colima_fc.png')),
          ListTile(
            trailing: Icon(Icons.navigate_next),
            leading: FaIcon(FontAwesomeIcons.newspaper),
            title: Text('Noticias'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => News()));
            },
          ),
          // ListTile(
          //   trailing: Icon(Icons.navigate_next),
          //   leading: FaIcon(FontAwesomeIcons.addressCard),
          //   title: Text('Inscripciones'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => Inscriptions()));
          //   },
          // ),
          ListTile(
            trailing: Icon(Icons.navigate_next),
            leading: FaIcon(FontAwesomeIcons.users),
            title: Text('Equipo'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Team()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.navigate_next),
            leading: FaIcon(FontAwesomeIcons.users),
            title: Text('Equipo Femenil'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WomanTeam()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.navigate_next),
            leading: FaIcon(FontAwesomeIcons.shoppingBag),
            title: Text('Tienda'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Store()));
            },
          ),
          // ListTile(
          //   trailing: Icon(Icons.navigate_next),
          //   leading: FaIcon(FontAwesomeIcons.chartLine),
          //   title: Text('Estadísticas'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (_) => Statistics()));
          //   },
          // ),
          ListTile(
            trailing: Icon(Icons.navigate_next),
            leading: FaIcon(FontAwesomeIcons.photoVideo),
            title: Text('Galería'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Gallery()));
            },
          ),
          ListTile(
            trailing: Icon(Icons.navigate_next),
            leading: FaIcon(FontAwesomeIcons.mailBulk),
            title: Text('Contacto'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Contact()));
            },
          ),
          ListTile(
            // trailing: Icon(Icons.navigate_next),
            leading: FaIcon(FontAwesomeIcons.userTie),
            title: Text('Patrocinadores'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Sponsors()));
            },
          ),
          ListTile(
            // trailing: Icon(Icons.navigate_next),
            leading: FaIcon(FontAwesomeIcons.infoCircle),
            title: Text('Historia'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => History()));
            },
          ),
          Divider(),
          ListTile(
            // trailing: Icon(Icons.navigate_next),
            leading: FaIcon(FontAwesomeIcons.infoCircle),
            title: Text('Política de privacidad'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Privacy()));
            },
          ),
        ],
      ),
    );
  }
}
