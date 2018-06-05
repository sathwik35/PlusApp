import 'package:flutter/material.dart';
import 'functions.dart';
import 'menu.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MenuBar(),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Theme(
                data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                        labelStyle: new TextStyle(
                            color: Colors.white, fontSize: 20.0))),
                child: new Container(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: new Column(
                    children: <Widget>[
                      createRequest("1", "Kees", "Woensdag 25-04-18", "18:00", "21:00"),
                      createRequest("2", "Harry", "Donderdag 26-04-18", "9:00", "18:00"),

                      createNotification("26-04-18 12:00", "Zoals jullie zien is het nieuwe rooster toegevoegd. Let er op dat vrijdag 27 april het rooster er iets anders uit ziet vanwege koningsdag.", "Joost"),

                      createUpdate("26-04-18 12:00", "Er is een nieuw rooster beschikbaar. Klik op de rooster tab in het menu om het rooster te kunnen bekijken."),
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
