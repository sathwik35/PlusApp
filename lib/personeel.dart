import 'package:flutter/material.dart';
import 'menu.dart';

class PersoneelPage extends StatefulWidget {
  @override
  State createState() => new PersoneelPageState();
}

class PersoneelPageState extends State<PersoneelPage> with SingleTickerProviderStateMixin{
  // Logic
  @override
  void initState() {
    super.initState();
  }

  // PersoneelPage
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
                      new Text("Personeel Page")
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