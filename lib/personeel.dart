import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: new StreamBuilder(
        stream: Firestore.instance.collection('medewerkers').orderBy("function").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return new ListView.builder(
            itemCount: snapshot.data.documents.length,
            padding: const EdgeInsets.only(top: 10.0),
            itemExtent: 59.0,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
              return createPerson(
                "${ds['username']}", 
                "${ds['firstname']} ${ds['lastname']}", 
                "${ds['phone']}",
                "${ds['department']}",
                "${ds['function']}",
                "${ds['email']}"
              );
            }
          );
        },
      )
    );
  }

  Widget createPerson(_personID, _personName, _personPhone, _personDepartment, _personFunction, _personEmail) {
    return new Container(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
        child: new Column(
          children: <Widget>[
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
                    new Text("$_personFunction")
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
                              builder: (context) => userInfo(_personID, _personName, _personPhone, _personDepartment, _personFunction, _personEmail),
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
        ]
      )
    );
  }
}