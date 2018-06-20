import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'menu.dart';

class RoosterPage extends StatefulWidget {
  @override
  State createState() => new RoosterPageState();
}

class RoosterPageState extends State<RoosterPage>
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
      body: new StreamBuilder(
        stream: Firestore.instance.collection('vervanging').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return new ListView.builder(
            itemCount: snapshot.data.documents.length,
            padding: const EdgeInsets.only(top: 10.0),
            itemExtent: 59.0,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
              createSchedule(
                "${ds['day']}", 
                "${ds['date']}", 
                "${ds['personOut']}", 
                "${ds['personIn']}", 
                "${ds['timeS']}", 
                "${ds['timeE']}", 
                "${ds['department']}"
              );
            }
          );
        },
      )
    );
  }

  Widget createSchedule(_scheduleDay, _scheduleDate, _schedulePersonOut, _schedulePersonIn, _scheduleTimeS, _scheduleTimeE, _scheduleFunction) {
    return new Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 5.0),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text("$_scheduleDay"),
                    new Text("$_scheduleDate")
                  ],
                ),
              ),
              new Flexible(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text("$_schedulePersonOut werkt niet"),
                    new Text("$_schedulePersonIn valt in")
                  ],
                ),
              ),
              new Flexible(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Text("$_scheduleTimeS - $_scheduleTimeE"),
                    new Text("$_scheduleFunction")
                  ],
                ),
              ),
            ],
          ),
          new Divider(
            color: Colors.black,
            height: 1.0,
          ),
        ]
      )
    );
  }

  
      // new ListView(
      //   children: <Widget>[
      //     new Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: <Widget>[
      //         new Theme(
      //           data: new ThemeData(
      //               brightness: Brightness.dark,
      //               primarySwatch: Colors.teal,
      //               inputDecorationTheme: new InputDecorationTheme(
      //                   labelStyle: new TextStyle(
      //                       color: Colors.white, fontSize: 20.0))),
      //           child: new Container(
      //             padding: const EdgeInsets.only(top: 10.0),
      //             child: new Column(
      //               children: <Widget>[
      //                 createSchedule("Ma", "18 juni 2018", "Niels", "Rik", "16:00", "19:00", "KW"),
      //                 createSchedule("Wo", "20 juni 2018", "Niels", "Rik", "16:00", "19:00", "KW"),
      //                 createSchedule("Wo", "20 juni 2018", "Niels", "Rik", "16:00", "19:00", "KW"),
      //                 createSchedule("Vr", "22 juni 2018", "Niels", "Rik", "16:00", "19:00", "KW"),
      //                 createSchedule("Vr", "22 juni 2018", "Niels", "Rik", "16:00", "19:00", "KW"),
      //                 createSchedule("Vr", "22 juni 2018", "Niels", "Rik", "16:00", "19:00", "KW"),
      //                 createSchedule("Za", "23 juni 2018", "Niels", "Rik", "16:00", "19:00", "KW")
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
  
}