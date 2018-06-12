import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'functions.dart';
import 'menu.dart';

class PersoneelPage extends StatefulWidget {
  @override
  State createState() => new PersoneelPageState();
}

class PersoneelPageState extends State<PersoneelPage> with SingleTickerProviderStateMixin{
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
                      color: Colors.white,
                      fontSize: 20.0
                    )
                  )
                ),
                child: new Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                        // Staff members
                        createPerson("1", "Henk Pieters", "0612345678", "H"),
                        createPerson("2", "Barry Badpak", "0612345678", "B"),
                        createPerson("3", "Kennie koken", "0612345678", "K"),
                        createPerson("4", "Henry heggeschaar", "0612345678", "H"),
                        createPerson("5", "Cornelis Klaase", "0612345678", "C"),
                        createPerson("6", "Jan jansen", "0612345678", "J"),
                        createPerson("7", "Jos Schoot", "0612345678", "J"),
                        createPerson("8", "Ton Zijnen", "0612345678", "T"),
                        createPerson("9", "Loesje Zijnen", "0612345678", "L"),
                        createPerson("10", "Roosmarijn Reimers", "0612345678", "R"),

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