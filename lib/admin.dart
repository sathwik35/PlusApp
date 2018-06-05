import 'package:flutter/material.dart';
import 'menu.dart';

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
          new Image(
            image: new AssetImage("assets/background.png"),
            fit: BoxFit.cover,
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
                new ButtonTheme.bar(
                  child: new ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: const Text('TOEVOEGEN'),
                        onPressed: () { 
                          Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) {
                              _action = "toevoegen";
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
        title: new Text("Medewerker $_action"),
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
                  obscureText: true,
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

class MedewerkersSearch extends StatefulWidget {
  @override
  State createState() => new MedewerkersSearchState();
}

class MedewerkersSearchState extends State<MedewerkersSearch> {
  String _search;
  
  @override
  void _submit() {
    
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Medewerker zoeken"),
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
                  onPressed: () { 
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) {
                        return new MedewerkersAdd();
                      }),
                    );
                  } 
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
        title: new Text("Mededeling aanmaken"),
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
        title: new Text("Mededeling verwijderen"),
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

                //TODO: iets waarmee je een mededeling kan selecteren en verwijderen

                new Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                  ),
                ),

                new RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: new Text(
                    "Verwijderen"
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

class VervangingAdd extends StatefulWidget {
  @override
  State createState() => new VervangingAddState();
}

class VervangingAddState extends State<VervangingAdd> {
  @override
  void _submit() {

  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Vervanging aanmaken"),
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

class VervangingEdit extends StatefulWidget {
  @override
  State createState() => new VervangingEditState();
}

class VervangingEditState extends State<VervangingEdit> {
  @override
  void _submit() {

  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Vervanging wijzigen"),
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

                

              ],
            ),
          ),
        ]       
      ),
    );
  }
}

class VervangingDelete extends StatefulWidget {
  @override
  State createState() => new VervangingDeleteState();
}

class VervangingDeleteState extends State<VervangingDelete> {
  @override
  void _submit() {

  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Vervanging verwijderen"),
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

                

              ],
            ),
          ),
        ]       
      ),
    );
  }
}

class InvalShow extends StatefulWidget {
  @override
  State createState() => new InvalShowState();
}

class InvalShowState extends State<InvalShow> {
  @override
  void _submit() {

  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Inval lijst bekijken"),
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

                

              ],
            ),
          ),
        ]       
      ),
    );
  }
}

class InvalEdit extends StatefulWidget {
  @override
  State createState() => new InvalEditState();
}

class InvalEditState extends State<InvalEdit> {
  @override
  void _submit() {

  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Inval lijst wijzigen"),
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