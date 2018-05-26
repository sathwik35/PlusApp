import 'package:flutter/material.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
   // Variables
   final scaffoldKey = new GlobalKey<ScaffoldState>();
   final formKey = new GlobalKey<FormState>();
  String _username; // Private
  String _password; // Private

  // Logic
  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    final form = formKey.currentState;

    if(form.validate()) { // If no validation errors occured
      form.save();
      
      if ((_username != "123456") || (_password != "123456")) {
        // error
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

  // LoginPage
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.green,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background
          new Image(
            image: new AssetImage("assets/background.png"),
            fit: BoxFit.cover,
            // color: Colors.black87,
            // colorBlendMode: BlendMode.darken,
          ),
          // Wrapper
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Position center
            children: <Widget>[
              // Logo
              new Image(
                image: new AssetImage("assets/login_transparent.png"),
                width: 200.0,
              ),
              // Login form
              new Form(
                key: formKey,
                child: new Theme(
                  // Style
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
                        // Textfields
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Username"
                          ),
                          keyboardType: TextInputType.text,
                          //validator: (val)=> !val.contains("@")?"Invalid Email":null, // INPUT CHECKER
                          validator: (val)=> val.length<6?"Username is too short":null, // Lenght checker
                          onSaved: (val)=> _username = val, // Save Data
                        ),
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Password"
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,  // replace input with ****
                          validator: (val)=> val.length<6?"Password is too short":null, // Lenght checker
                          onSaved: (val)=> _password = val, // Save Data
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                          ),
                        ),
                        // Button
                        new RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: new Text(
                            "Login"
                          ),
                          onPressed: _submit,  // Button click
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