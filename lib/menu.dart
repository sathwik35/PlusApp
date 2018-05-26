import 'package:flutter/material.dart';
import 'home.dart';
import 'rooster.dart';
import 'personeel.dart';
import 'account.dart';

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => new _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget> [
          new UserAccountsDrawerHeader(
            accountName: new Text("User name"),
            accountEmail: new Text("Vakkenvuller"),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text("U"),
            ),
          ),
          new ListTile(
            title: new Text('Home'),
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
            title: new Text('Personeel'),
            trailing: new Icon(Icons.group),
            onTap: () {
              Navigator.pop(
                context,
                new MaterialPageRoute(builder: (context) => new PersoneelPage())
              );
            },
          ),
          new ListTile(
            title: new Text('Account'),
            trailing: new Icon(Icons.account_circle),
            onTap: () {
              Navigator.pop(
                context,
                new MaterialPageRoute(builder: (context) => new AccountPage())
              );
            },
          ),
          new Divider(),
          // new ListTile(
          //   title: new Text('Admin'),
          //   onTap: () {
          //     Navigator.pop(
          //       context,
          //       new MaterialPageRoute(builder: (context) => new AdminPage())
          //     );
          //   },
          // ),
          new ListTile(
            title: new Text('Close'),
            trailing: new Icon(Icons.close),
            onTap: ()=>  Navigator.of(context).pop(),
          ),
        ],
      )
    );
  }
}
