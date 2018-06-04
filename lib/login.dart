import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _username; // Private
  String _password; // Private

  void _submit() {
    final form = formKey.currentState;

    if(form.validate()) { // If no validation errors occurred
      form.save();
      
      if ((_username != "123456") || (_password != "123456")) {
        final snackbar = new SnackBar(
          content: new Text("The inserted data is incorrect"),
        );
        scaffoldKey.currentState.showSnackBar(snackbar);
      }
      else {
        // If nothing wrong do this redirect
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new HomePage())
        );
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
                        color: Colors.white,
                        fontSize: 20.0
                      )
                    )
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(60.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Username"
                          ),
                          keyboardType: TextInputType.text,
                          //validator: (val)=> !val.contains("@")?"Invalid Email":null, // INPUT CHECKER
                          validator: (val)=> val.length<6?"Username is too short":null, // Length checker
                          onSaved: (val)=> _username = val, // Save Data
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Password"
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,  // replace input with ****
                          validator: (val)=> val.length<6?"Password is too short":null, // Length checker
                          onSaved: (val)=> _password = val, // Save Data
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                          ),
                        ),
                        new RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: new Text(
                            "Login"
                          ),
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