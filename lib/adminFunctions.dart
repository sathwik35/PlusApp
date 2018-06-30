import 'package:flutter/material.dart';
import 'admin.dart';
import 'adminMedewerkers.dart';
import 'menu.dart';

class SaveData {
  String department;
  String email;
  String firstname;
  String function;
  String lastname;
  String password;
  String phone;
  String username;

  SaveData(
    this.department, 
    this.email, 
    this.firstname, 
    this.function, 
    this.lastname,
    this.password,
    this.phone,
    this.username
  );

  Map toJson() {
    return{
      "department" : department,
      "email" : email,
      "firstname" : firstname,
      "function" : function,
      "lastname" : lastname,
      "password" : password,
      "phone" : phone,
      "username" : username
    };
  }
}

class ConfirmPage extends StatefulWidget {
  @override
  State createState() => new ConfirmPageState();
}

class ConfirmPageState extends State<ConfirmPage> {
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MenuBar(),
      appBar: new AppBar(
        title: new Text("Medewerker toevoegen", style: new TextStyle(color: Colors.white),),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.fromLTRB(
              25.0, 10.0, 25.0, 0.0
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                  ),
                ),

                new Text(
                  "Toevoegen succesvol verwerkt!",
                  style: new TextStyle(fontSize: 22.0),
                ),

                new Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                  ),
                ),

                new RaisedButton(
                  color: Color(0xff207645),
                  textColor: Colors.white,
                  child: const Text('Nog een medewerker toevoegen'),
                  onPressed: () { 
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) {
                        return new MedewerkersAdd();
                      }
                    ));
                  },
                  splashColor: Colors.purple, 
                ),

                new Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                ),

                new RaisedButton(
                  color: Color(0xffe23a3a),
                  textColor: Colors.white,
                  child: const Text('Terug naar de admin pagina'),
                  onPressed: () { 
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) {
                        return new AdminPage();
                      }
                    ));
                  },
                  splashColor: Colors.purple, 
                )
              ]
            )
          )
        ]
      )
    );
  }
}