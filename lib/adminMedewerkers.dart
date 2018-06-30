import 'package:flutter/services.dart';
// import 'dart:convert';
import 'package:flutter/material.dart';
import 'adminFunctions.dart';
import 'search_list.dart';

// const jsonCodec = const JsonCodec();

class MedewerkersAdd extends StatefulWidget {
  @override
  State createState() => new MedewerkersAddState();
}

class MedewerkersAddState extends State<MedewerkersAdd> {
  String _firstname;
  String _lastname;
  String _wachtwoord;
  String _afdeling;
  String _functie;
  String _email;
  String _phone;
  String _username;

  List<String> _afdelingen = new List<String>();
  List<String> _functies = new List<String>();
    
  @override
  void initState() {
    _afdelingen.addAll(["KW"]);
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

  // _save(SaveData medewerkers) async {
  //   var json = jsonCodec.encode(medewerkers);
  //   print("json=$json"); //check output in de console

  // }

  void _submit() {
    // _save(new SaveData(
    //   _afdeling,
    //   _email,
    //   _firstname,
    //   _functie,
    //   _lastname,
    //   _wachtwoord,
    //   _phone,
    //   _username
    // ));

    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) {
        return new ConfirmPage();
      }
    ));
  }

  Widget build(BuildContext context) {
    return new Scaffold(
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
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Voornaam'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _firstname = val,
                ),

                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Achternaam'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _lastname = val,
                ),

                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Gebruikersnaam'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _username = val,
                ),

                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Wachtwoord'
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _wachtwoord = val,
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
                  onSaved: (val)=> _phone = val,
                ),

                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: 'Email adres'
                  ),
                  keyboardType: TextInputType.text,
                  onSaved: (val)=> _email = val,
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
      body: new SearchList(),
    );
  }
}

class MedewerkersEdit extends StatefulWidget {
  @override
  State createState() => new MedewerkersEditState();
}

class MedewerkersEditState extends State<MedewerkersEdit> {
  String _fullname;
  String _wachtwoord;
  String _afdeling;
  String _functie;

  List<String> _afdelingen = new List<String>();
  List<String> _functies = new List<String>();
    
  @override
  void initState() {
    _afdelingen.addAll(["KW"]);
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
        title: new Text("Medewerker wijzigen", style: new TextStyle(color: Colors.white),),
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
      body: new SearchList(),
    );
    
    // return new Scaffold(
    //   appBar: new AppBar(
    //     title: new Text("Medewerkers verwijderen"),
    //   ),
    //   body: new ListView(
    //     children: <Widget>[
    //       new Padding(
    //         padding: const EdgeInsets.fromLTRB(
    //           25.0, 10.0, 25.0, 0.0
    //         ),
    //         child: new Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
                
    //             new TextFormField(
    //               decoration: new InputDecoration(
    //                 labelText: 'Zoek op naam'
    //               ),
    //               keyboardType: TextInputType.text,
    //               onSaved: (val)=> _search = val,
    //             ),

    //             new Padding(
    //               padding: const EdgeInsets.only(
    //                 top: 40.0,
    //               ),
    //             ),

    //             new RaisedButton(
    //               color: Colors.red,
    //               textColor: Colors.white,
    //               child: new Text(
    //                 "Zoeken"
    //               ),
    //               onPressed: _submit,
    //               splashColor: Colors.purple, 
    //             )

    //           ],
    //         ),
    //       ),
    //     ]
    //   ),
    // );
  }
}