import 'package:flutter/material.dart';
import 'functions.dart';
import 'menu.dart';

class RoosterPage extends StatefulWidget {
  @override
  State createState() => new RoosterPageState();
}

class RoosterPageState extends State<RoosterPage> with SingleTickerProviderStateMixin{
    
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
      backgroundColor: Colors.white, // grey[300]
      body: new ListView(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    children: <Widget>[

                      // Schedule
                      createSchedule("Ma", "16:00", "18:00", "7 mei 2018", "KW"),
                      createSchedule("Wo", "18:00", "21:00", "9 mei 2018", "KW"),
                      createSchedule("Vr", "15:30", "21:30", "11 mei 2018", "KW"),
                      createSchedule("Ma", "16:00", "18:00", "14 mei 2018", "KW"),
                      createSchedule("Wo", "18:00", "21:00", "16 mei 2018", "Opleiding"),
                      createSchedule("Vr", "15:30", "21:30", "18 mei 2018", "KW"),
                      createSchedule("Za", "07:00", "13:00", "19 mei 2018", "KW"),
                      createSchedule("Za", "18:00", "20:00", "19 mei 2018", "Kassa"),
                      createSchedule("Ma", "16:00", "18:00", "21 mei 2018", "KW"),
                      createSchedule("Di", "17:00", "20:00", "22 mei 2018", "Kassa"),
                      // Double for testing purposes
                      createSchedule("Ma", "16:00", "18:00", "7 mei 2018", "KW"),
                      createSchedule("Wo", "18:00", "21:00", "9 mei 2018", "KW"),
                      createSchedule("Vr", "15:30", "21:30", "11 mei 2018", "KW"),
                      createSchedule("Ma", "16:00", "18:00", "14 mei 2018", "KW"),
                      createSchedule("Wo", "18:00", "21:00", "16 mei 2018", "Opleiding"),
                      createSchedule("Vr", "15:30", "21:30", "18 mei 2018", "KW"),
                      createSchedule("Za", "07:00", "13:00", "19 mei 2018", "KW"),
                      createSchedule("Za", "18:00", "20:00", "19 mei 2018", "Kassa"),
                      createSchedule("Ma", "16:00", "18:00", "21 mei 2018", "KW"),
                      createSchedule("Di", "17:00", "20:00", "22 mei 2018", "Kassa"),

                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}