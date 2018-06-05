import 'package:flutter/material.dart';
import 'functions.dart';
import 'menu.dart';

class AccountPage extends StatefulWidget {
  @override
  State createState() => new AccountPageState();
}

class AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Image(
            image: new AssetImage("assets/menu.png"), fit: BoxFit.cover),
      ),
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Theme(
                data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                            color: Colors.white, fontSize: 20.0))),
                child: new Container(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      createAccount(1),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
