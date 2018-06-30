import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String _globalName = "";
String _globalFunction = "";

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
      body: new StreamBuilder(
        stream: Firestore.instance.collection('medewerkers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return new ListView.builder(
            itemCount: snapshot.data.documents.length,
            padding: const EdgeInsets.only(top: 10.0),
            itemExtent: 25.0,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
              _globalName = "${ds['firstname']} ${ds['lastname']}"; // voor de menu page
              _globalFunction = "${ds['function']}";                // voor de menu page
            }
          );
        }
      ),
    );
  }
}