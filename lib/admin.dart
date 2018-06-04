import 'package:flutter/material.dart';
import 'menu.dart';

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
                              return new MedewerkersEdit();
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
                              return new MedewerkersDelete();
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
                  title: const Text('Mededelingen'),
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

class MedewerkersAdd extends StatefulWidget {
  @override
  State createState() => new MedewerkersAddState();
}

class MedewerkersAddState extends State<MedewerkersAdd> {
  String _fullname;
  String _wachtwoord;
  String _afdeling;
  String _functie;

  List<String> _afdelingen = new List<String>();
  List<String> _functies = new List<String>();
  
  @override
  void initState() {
    _afdelingen.addAll(["KW", "AGF", "Vers", "Kassa", "E-commerce", "Opleiding", "Overig"]);
    _afdeling = _afdelingen.elementAt(0);

    _functies.addAll(["KW manager", "Vulploegleider", "Magazijnmedewerker", "Vakkenvuller", "Overig"]);
    _functie = _functies.elementAt(0);
  }
  
  void _onChangedAfd(String afdeling) {
    setState(() {
      _afdeling = afdeling;
    });
  }

  void _onChangedFun(String functie) {
    setState(() {
      _functie = functie;
    });
  }

  void _submit() {
    
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Medewerkers toevoegen"),
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
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Voornaam'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _fullname = val,
                ),

                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Achternaam'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _fullname = val,
                ),

                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Gebruikersnaam'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _fullname = val,
                ),

                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Wachtwoord'
                  ),
                  obscureText: true,  // replace input with ****
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _fullname = val,
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      'Afdeling: ',
                      style: new TextStyle(fontSize: 17.0),
                    ),
                    new DropdownButton(
                      value: _afdeling,
                      items: _afdelingen.map((String value){
                        return new DropdownMenuItem(
                          value: value,
                          child: new Row(
                            children: <Widget>[          
                              new Text('$value')
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String afdeling) {_onChangedAfd(afdeling);},
                    ),
                  ],
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      'Functie: ',
                      style: new TextStyle(fontSize: 17.0),
                    ),
                    new DropdownButton(
                      value: _functie,
                      items: _functies.map((String value){
                        return new DropdownMenuItem(
                          value: value,
                          child: new Row(
                            children: <Widget>[          
                              new Text('$value')
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String functie) {_onChangedFun(functie);},
                    ),
                  ],
                ),

                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Mobiel nummer'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _fullname = val,
                ),

                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Email adres'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _fullname = val,
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
                    "Opslaan"
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

class MedewerkersEdit extends StatefulWidget {
  @override
  State createState() => new MedewerkersEditState();
}

class MedewerkersEditState extends State<MedewerkersEdit> {
  String _search;

  List<String> _afdelingen = new List<String>();
  List<String> _functies = new List<String>();
  
  @override
  void _submit() {
    
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Medewerkers wijzigen"),
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
                
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Zoek op naam'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _search = val,
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
                    "Zoeken"
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

class MedewerkersDelete extends StatefulWidget {
  @override
  State createState() => new MedewerkersDeleteState();
}

class MedewerkersDeleteState extends State<MedewerkersDelete> {
   String _search;

  List<String> _afdelingen = new List<String>();
  List<String> _functies = new List<String>();
  
  @override
  void _submit() {
    
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Medewerkers verwijderen"),
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
                
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Zoek op naam'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _search = val,
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
                    "Zoeken"
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

