import 'package:flutter/material.dart';
import 'Adminfunctions.dart';
import 'functions.dart';

class MededelingAdd extends StatefulWidget {
  @override
  State createState() => new MededelingAddState();
}

class MededelingAddState extends State<MededelingAdd> {
  @override
  void _submit() {

  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mededeling aanmaken", style: new TextStyle(color: Colors.white),),
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

                new TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
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
                    "Aanmaken"
                  ),
                  onPressed: _submit,
                  splashColor: Colors.purple, 
                )

              ],
            ),
          ),
        ]       
      ),
    );
  }
}

class MededelingDelete extends StatefulWidget {
  @override
  State createState() => new MededelingDeleteState();
}

class MededelingDeleteState extends State<MededelingDelete> {
  @override
  void _submit() {

  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mededeling verwijderen", style: new TextStyle(color: Colors.white),),
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

                new Card(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      createNotification(
                        "26-04-18 12:00", 
                        "Zoals jullie zien is het nieuwe rooster toegevoegd. Let er op dat vrijdag 27 april het rooster er iets anders uit ziet vanwege koningsdag.", 
                        "Joost"
                      ),
                      new FlatButton(
                        child: const Text('VERWIJDER BERICHT'),
                        onPressed: () {
                          // delete message from DB
                        },
                        textColor: Color(0xffe23a3a),
                      ),
                    ]
                  ),
                ),

                new Card(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      createNotification(
                        "26-04-18 12:00", 
                        "Zoals jullie zien is het nieuwe rooster toegevoegd. Let er op dat vrijdag 27 april het rooster er iets anders uit ziet vanwege koningsdag.", 
                        "Joost"
                      ),
                      new FlatButton(
                        child: const Text('VERWIJDER BERICHT'),
                        onPressed: () {
                          // delete message from DB
                        },
                        textColor: Color(0xffe23a3a),
                      ),
                    ]
                  ),
                ),

                new Card(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      createNotification(
                        "26-04-18 12:00", 
                        "Zoals jullie zien is het nieuwe rooster toegevoegd. Let er op dat vrijdag 27 april het rooster er iets anders uit ziet vanwege koningsdag.", 
                        "Joost"
                      ),
                      new FlatButton(
                        child: const Text('VERWIJDER BERICHT'),
                        onPressed: () {
                          // delete message from DB
                        },
                        textColor: Color(0xffe23a3a),
                      ),
                    ]
                  ),
                ),

                new Card(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      createNotification(
                        "26-04-18 12:00", 
                        "Zoals jullie zien is het nieuwe rooster toegevoegd. Let er op dat vrijdag 27 april het rooster er iets anders uit ziet vanwege koningsdag.", 
                        "Joost"
                      ),
                      new FlatButton(
                        child: const Text('VERWIJDER BERICHT'),
                        onPressed: () {
                          // delete message from DB
                        },
                        textColor: Color(0xffe23a3a),
                      ),
                    ]
                  ),
                ),

                new Card(
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      createNotification(
                        "26-04-18 12:00", 
                        "Zoals jullie zien is het nieuwe rooster toegevoegd. Let er op dat vrijdag 27 april het rooster er iets anders uit ziet vanwege koningsdag.", 
                        "Joost",
                      ),
                      new FlatButton(
                        child: const Text('VERWIJDER BERICHT'),
                        onPressed: () {
                          // delete message from DB
                        },
                        textColor: Color(0xffe23a3a),
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ]       
      ),
    );
  }
}