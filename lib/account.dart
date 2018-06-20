import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountPage extends StatefulWidget {
  @override
  State createState() => new AccountPageState();
}

class AccountPageState extends State<AccountPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Image(
            image: new AssetImage("assets/menu.png"), fit: BoxFit.cover),
      ),
      backgroundColor: Colors.white,
      body: new StreamBuilder(
        stream: Firestore.instance.collection('medewerkers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return new ListView.builder(
            itemCount: snapshot.data.documents.length,
            padding: const EdgeInsets.only(top: 10.0),
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
              return createAccount(
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

  Widget createAccount(_personID, _personName, _personPhone, _personDepartment, _personFunction, _personEmail) {
    String _personImage = _personName[0];

    return new Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              new CircleAvatar(
                radius: 35.0,
                backgroundColor: new Color(0xFF534BA3),
                foregroundColor: Colors.white,
                child: new Text("$_personImage",textScaleFactor: 2.5 ,),
              ),

              new Flexible(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text("$_personName", textScaleFactor: 1.2 ,),
                    new Text("$_personDepartment", textScaleFactor: 1.2 ,),
                    new Text("$_personFunction", textScaleFactor: 1.2 ,),
                  ],
                ),
              ),
            ],
          ),
          new Divider(),
          new Divider(
            color: new Color(0xFF534BA3),
            height: 5.0,
          ),
          new Divider(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new Flexible(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text("Telefoonnummer mobiel:", textScaleFactor: 1.2 ,),
                    new Text("$_personPhone", textScaleFactor: 1.2 ,),

                    new Divider(),

                    new Text("Email adress:", textScaleFactor: 1.2 ,),
                    new Text("$_personEmail", textScaleFactor: 1.2 ,),
                  ],
                ),
              ),
            ],
          ),
        ]
      )
    );
  }


}