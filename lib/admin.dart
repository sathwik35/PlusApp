import 'package:flutter/material.dart';
import 'menu.dart';
import 'adminFunctions.dart';
import 'adminMedewerkers.dart';
import 'adminMededelingen.dart';
import 'adminVervanging.dart';
import 'adminInvallijst.dart';

String _action;

class AdminPage extends StatefulWidget {
  @override
  State createState() => new AdminPageState();
}

class AdminPageState extends State<AdminPage> with SingleTickerProviderStateMixin{
    @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      drawer: new MenuBar(),
      appBar: new AppBar(
        title: new Image(
          image: new AssetImage("assets/menu.png"),
          fit: BoxFit.cover
        ),
      ),
      backgroundColor: Colors.white,
      body: new ListView(
        children: <Widget>[
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Medewerkers'),
                  subtitle: const Text('Een medewerker aanmaken, gegevens aanpassen, of de medewerker verwijderen'),
                ),
                new ButtonTheme.bar(
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('TOEVOEGEN'),
                        onPressed: () { 
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new MedewerkersAdd();
                            }
                          ));
                        },
                        textColor: Color(0xff207645),
                      ),
                      new FlatButton(
                        child: const Text('WIJZIGEN'),
                        onPressed: () { 
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              _action = "wijzigen";
                              return new MedewerkersSearch();
                            }
                          ));
                        },
                        textColor: Color(0xff534da7),
                      ),
                      new FlatButton(
                        child: const Text('VERWIJDEREN'),
                        onPressed: () { 
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              _action = "verwijderen";
                              return new MedewerkersSearch();
                            }
                          ));
                        },
                        textColor: Color(0xffe23a3a),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Mededelingen'),
                  subtitle: const Text('Stuur een bericht naar alle werknemers binnen de afdeling'),
                ),
                new ButtonTheme.bar(
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('AANMAKEN'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new MededelingAdd();
                            }
                          ));
                        },
                        textColor: Color(0xff207645),
                      ),
                      new FlatButton(
                        child: const Text('VERWIJDEREN'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new MededelingDelete();
                            }
                          ));
                        },
                        textColor: Color(0xffe23a3a),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Vervanging rooster'),
                  subtitle: const Text('Een rooster waar overzichtelijk per dag staat aangegeven wie er werkt en wie dus niet'),
                ),
                new ButtonTheme.bar(
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('TOEVOEGEN'),
                        onPressed: () { 
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new VervangingAdd();
                            }
                          ));  
                        },
                        textColor: Color(0xff207645),
                      ),
                      new FlatButton(
                        child: const Text('WIJZIGEN'),
                        onPressed: () { 
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new VervangingEdit();
                            }
                          ));
                        },
                        textColor: Color(0xff534da7),
                      ),
                      new FlatButton(
                        child: const Text('VERWIJDEREN'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new VervangingDelete();
                            }
                          ));
                        },
                        textColor: Color(0xffe23a3a),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: const Icon(Icons.cached),
                  title: const Text('Inval lijst'),
                  subtitle: const Text('Een lijst van de vakkenvullers waar per persoon staat aangegeven hoe actief ze zijn in het vervangen van anderen'),
                ),
                new ButtonTheme.bar(
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('BEKIJKEN'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new InvalShow();
                            }
                          ));
                        },
                        textColor: Color(0xff207645),
                      ),
                      new FlatButton(
                        child: const Text('WIJZIGEN'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new InvalEdit();
                            }
                          ));
                        },
                        textColor: Color(0xff534da7),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}