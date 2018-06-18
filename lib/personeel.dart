import 'package:flutter/material.dart';
import 'functions.dart';
import 'menu.dart';

class PersoneelPage extends StatefulWidget {
  @override
  State createState() => new PersoneelPageState();
}

class PersoneelPageState extends State<PersoneelPage>
    with SingleTickerProviderStateMixin {
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
                  padding: const EdgeInsets.only(top: 10.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      createPerson("1", "Henk Pieters", "0612345678"),
                      createPerson("2", "Barry Badpak", "0612345678"),
                      createPerson("3", "Kennie koken", "0612345678"),
                      createPerson("4", "Henry heggeschaar", "0612345678"),
                      createPerson("5", "Cornelis Klaase", "0612345678"),
                      createPerson("6", "Jan jansen", "0612345678"),
                      createPerson("7", "Jos Schoot", "0612345678"),
                      createPerson("8", "Ton Zijnen", "0612345678"),
                      createPerson("9", "Loesje Zijnen", "0612345678"),
                      createPerson("10", "Roosmarijn Reimers", "0612345678"),
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

  Widget createPerson(_personID, _personName, _personPhone) {
    return new Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
        child: new Column(children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new CircleAvatar(
                backgroundColor: new Color(0xFF534BA3),
                foregroundColor: Colors.white,
                child: new Text(_personName[0]),
              ),
              new Flexible(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text("$_personName"),
                    new Text("$_personPhone")
                  ],
                ),
              ),
              new Flexible(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new IconButton(
                      color: Colors.red,
                      icon: new Icon(Icons.play_circle_filled),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => new UserInfo(),
                            ));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          new Divider(
            color: Colors.black,
            height: 1.0,
          ),
        ]));
  }
}

class UserInfo extends StatelessWidget {
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
                      userInfo(1), //TODO: Set user ID to variable
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
