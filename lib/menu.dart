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
  @override
  Widget build(BuildContext context) {
    var uname = "Tim Oldenburger";
    var functie = "Vulploegleider";
    return new Drawer(
      child: new ListView(
        children: <Widget> [
          new UserAccountsDrawerHeader(
            accountName: new Text(uname),
            accountEmail: new Text(functie),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.white,
              child: new Text("T"),
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
          
          // if (functie == "Vulploegleider" || functie == "KW manager") {}
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
              title: new Text('Admin'),
              trailing: new Icon(Icons.lock),
              enabled: functie == "Vulploegleider" || functie == "KW manager",
              onTap: () {
                ()=>  Navigator.of(context).pop();
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new AdminPage())
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
            title: new Text('Logout'),
            trailing: new Icon(Icons.exit_to_app),
            onTap: ()=>  Navigator.of(context).pop(),
          ),
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
