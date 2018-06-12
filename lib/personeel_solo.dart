import 'package:flutter/material.dart';
import 'menu.dart';

class PersoneelSoloPage extends StatefulWidget {
  @override
  State createState() => new PersoneelSoloPageState();
}

class PersoneelSoloPageState extends State<PersoneelSoloPage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MenuBar(),
      appBar: new AppBar(
        title: new Image(
          image: new AssetImage("assets/menu.png"),
          fit: BoxFit.cover
        ),
      ),
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
           new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Theme(
                data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                    )
                  )
                ),
                child: new Container(
                  padding: const EdgeInsets.all(60.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Textfields // INSERT PAGE STUFF HERE
                      new Text("PersoneelSolo Page")
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