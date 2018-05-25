import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String tag = "home-page";

  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  // Logic
  @override
  void initState() {
    super.initState();
  }

  // HomePage
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background
          new Image(
            image: new AssetImage("assets/background.png"),
            fit: BoxFit.cover,
            // color: Colors.black87,
            // colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Position center
            children: <Widget>[
              new Theme(
                // Style
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
                // Content
                child: new Container(
                  padding: const EdgeInsets.all(60.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Textfields // INSERT PAGE STUFF HERE
                      new Text("HOME Page")
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