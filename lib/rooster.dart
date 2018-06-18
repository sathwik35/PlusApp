import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'functions.dart';
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
            itemExtent: 25.0,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
              createSchedule(
                "${ds['day']}", 
                "${ds['date']}", 
                "${ds['personOut']}", 
                "${ds['personIn']}", 
                "${ds['timeS']}", 
                "${ds['timeE']}", 
                "${ds['department']}");
            }
          );
        },
      )
      
      
      
      
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
    );
  }
}