import 'package:flutter/material.dart';
import 'home.dart';
import 'rooster.dart';
import 'personeel.dart';
import 'account.dart';
import 'admin.dart';
import 'vervang.dart';
import 'login.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => new _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {

  String _name = "Tim Oldenburger";
  String _function = "Vulploegleider";

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text(_name),
            accountEmail: new Text(_function),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text(_name[0],textScaleFactor: 2.5,style:new TextStyle(color: Colors.black),),
            ),
            onDetailsPressed: () {
              // Navigator.push(context,
              //     new MaterialPageRoute(builder: (context) => new AccountPage()));
            },
          ),
          new ListTile(
            title: new Text('Startpagina'),
            trailing: new Icon(Icons.home),
            onTap: () {
              () => Navigator.of(context).pop();
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new HomePage()));
            },
          ),        
          new ListTile(
            title: new Text('Inval rooster'),
            trailing: new Icon(Icons.cached),
            onTap: () {
              () => Navigator.of(context).pop();
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new RoosterPage()));
            },
          ),
          new ListTile(
            title: new Text('Rooster'),
            trailing: new Icon(Icons.date_range),
            enabled: false,
            onTap: () {
              () => Navigator.of(context).pop();
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new RoosterPage()));
            },
          ),
          new ListTile(
            title: new Text('Medewerkers'),
            trailing: new Icon(Icons.group),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new PersoneelPage()));
            },
          ),
          new ListTile(
            title: new Text('Vervanging aanvragen'),
            trailing: new Icon(Icons.add),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new VervangPage()));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text('Administrator'),
            trailing: new Icon(Icons.lock),
            enabled: _function == "Vulploegleider" || _function == "KW manager",
            onTap: () {
              () => Navigator.of(context).pop();
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new AdminPage()));
            },
          ),
          new Divider(),
          new ListTile(
            title: new Text('Uitloggen'),
            trailing: new Icon(Icons.exit_to_app),
            onTap: () {
              () => Navigator.of(context).pop();
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new LoginPage())); // log out works but is not solid yet
            }
          ),
        ],
      )
    );
  }
}
