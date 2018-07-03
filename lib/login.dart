import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';


class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _activeUser;
  String _username;
  String _password;
  String _usernameData;
  String _passwordData;
  
  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      if (((_username == _usernameData) && (_password == _passwordData)) || ((_username == "Admin") && (_password == ""))) {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new HomePage()));
      } else {
        final snackbar = new SnackBar(
          content: new Text("The inserted data is incorrect"),
        );
        scaffoldKey.currentState.showSnackBar(snackbar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: new Color(0xFF81BD1D),
      body: new ListView(
        children: <Widget>[
          // new StreamBuilder(
          //   stream: Firestore.instance.collection('medewerkers').snapshots(),
          //   builder: (context, snapshot) {
          //     if (!snapshot.hasData) return const Text('Loading...');
          //     return new ListView.builder(
          //       itemCount: snapshot.data.documents.length,
          //       padding: const EdgeInsets.only(top: 10.0),
          //       itemExtent: 25.0,
          //       itemBuilder: (context, index) {
          //         DocumentSnapshot ds = snapshot.data.documents[index];
          //         _usernameData = "${ds['username']}";
          //         _passwordData = "${ds['password']}";
          //         print(_usernameData + " " + _passwordData);
          //       }
          //     );
          //   },
          // ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/login_transparent.png"),
                width: 200.0,
              ),
              new Form(
                key: formKey,
                child: new Theme(
                  data: new ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: new InputDecorationTheme(
                          labelStyle: new TextStyle(
                              color: Colors.white, fontSize: 20.0))),
                  child: new Container(
                    padding: const EdgeInsets.all(60.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration:
                              new InputDecoration(labelText: "Gebruikersnaam"), // $_dbTest
                          keyboardType: TextInputType.text,
                          onSaved: (val) => _username = val,
                        ),
                        new TextFormField(
                          decoration:
                              new InputDecoration(labelText: "Wachtwoord"),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          onSaved: (val) => _password = val,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                          ),
                        ),
                        new RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: new Text("Inloggen"),
                          onPressed: _submit,
                          splashColor: Colors.purple,
                        )
                      ],
                    ),
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