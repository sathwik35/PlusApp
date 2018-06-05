import 'package:flutter/material.dart';
import 'home.dart';
import 'rooster.dart';
import 'personeel.dart';
import 'account.dart';
import 'admin.dart'; 

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => new _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  String _uname = "Tim Oldenburger";
  String _functie = "Vulploegleider";
  
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget> [
          new UserAccountsDrawerHeader(
            accountName: new Text(_uname),
            accountEmail: new Text(_functie),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text("T"),
            ),
          ),
          new ListTile(
            title: new Text('Startpagina'),
            trailing: new Icon(Icons.home),
            onTap: () {
              ()=>  Navigator.of(context).pop();
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new HomePage())
              );
            },
          ),
          new ListTile(
            title: new Text('Rooster'),
            trailing: new Icon(Icons.date_range),
            onTap: () {
              ()=>  Navigator.of(context).pop();
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new RoosterPage())
              );
            },
          ),
          new ListTile(
            title: new Text('Medewerkers'),
            trailing: new Icon(Icons.group),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new PersoneelPage())
              );
            },
          ),
          new ListTile(
            title: new Text('Account'),
            trailing: new Icon(Icons.account_circle),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new AccountPage())
              );
            },
          ),
          
          new Divider(),

          new ListTile(
            title: new Text('Administrator'),
            trailing: new Icon(Icons.lock),
            enabled: _functie == "Vulploegleider" || _functie == "KW manager", // if (functie == "Vulploegleider" || functie == "KW manager") {}
            onTap: () {
              ()=>  Navigator.of(context).pop();
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new AdminPage())
              );
            },
          ),
            
          
          new Divider(),

          new ListTile(
            title: new Text('Uitloggen'),
            trailing: new Icon(Icons.exit_to_app),
            onTap: ()=>  Navigator.of(context).pop(),
          ),
        ],
      )
    );
  }
}
