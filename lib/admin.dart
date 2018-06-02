import 'package:flutter/material.dart';
import 'functions.dart';
import 'menu.dart';
import 'personeeledit.dart';
import 'roosteredit.dart';
import 'mededeling.dart';
import 'invallen.dart';


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
      backgroundColor: Colors.white, // grey[300]
      body: new ListView(
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/background.png"),
            fit: BoxFit.cover,
            // color: Colors.black87,
            // colorBlendMode: BlendMode.darken,
          ),
          new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Medewerkers'),
                  subtitle: const Text('Een medewerker aanmaken, gegevens aanpassen, of de medewerker verwijderen'),
                ),
                new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('TOEVOEGEN'),
                        onPressed: () { 
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new Medewerkers();
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
                              return new Medewerkers();
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
                              return new Medewerkers();
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
                  title: const Text('Roosters'),
                  subtitle: const Text('Een rooster toevoegen aan een medewerker, het rooster wijzigen en verwijderen'),
                ),
                new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('TOEVOEGEN'),
                        onPressed: () { 
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new Roosters();
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
                              return new Roosters();
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
                              return new Roosters();
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
                  title: const Text('Mededeling aanmaken'),
                  subtitle: const Text('Stuur een bericht naar alle werknemers binnen de afdeling'),
                ),
                new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('AANMAKEN'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new Mededeling();
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
                              return new Mededeling();
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
                  subtitle: const Text('Een overzicht van de vakkenvullers en wanneer ze voor wie hebben ingevallen'),
                ),
                new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('BEKIJKEN'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              return new Inval();
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
                              return new Inval();
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

class Medewerkers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Medewerkers"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text("Push me"),
        ),
      ),
    );
  }
}
class Roosters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Roosters"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text("Push me"),
        ),
      ),
    );
  }
}
class Mededeling extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Mededeling"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text("Push me"),
        ),
      ),
    );
  }
}
class Inval extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Inval lijst"),
      ),
      body: new Center(
        child: new RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text("Push me"),
        ),
      ),
    );
  }
}