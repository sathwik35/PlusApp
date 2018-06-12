import 'package:flutter/material.dart';
import 'menu.dart';
import 'functions.dart';
import 'search_list.dart';
import 'dart:async';

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

class VervangingAdd extends StatefulWidget {
  @override
  State createState() => new VervangingAddState();
}

class VervangingAddState extends State<VervangingAdd> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();
  TimeOfDay _time2 = new TimeOfDay.now();
  String _hour = new TimeOfDay.now().hour.toString();
  String _minute = '00';
  String _hour2 = (new TimeOfDay.now().hour + 1).toString();
  String _minute2 = '00';
  
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2050),
    );

    if(picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if(picked != null && picked != _time) {
      setState(() {
        _time = picked;
        switch(_time.hour) {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            _hour = '0' + _time.hour.toString();
            break;
          default:
            _hour = _time.hour.toString();
        }

        switch(_time.minute) {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            _minute = '0' + _time.minute.toString();
            break;
          default:
            _minute = _time.minute.toString();
        }
      });
    }
  }
  
  Future<Null> _selectTime2(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time2,
    );

    if(picked != null && picked != _time2) {
      setState(() {
        _time2 = picked;
        switch(_time2.hour) {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            _hour2 = '0' + _time2.hour.toString();
            break;
          default:
            _hour2 = _time2.hour.toString();
        }

        switch(_time2.minute) {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            _minute2 = '0' + _time2.minute.toString();
            break;
          default:
            _minute2 = _time2.minute.toString();
        }
      });
    }
  }

  @override
  void _submit() {

  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Vervanging aanmaken", style: new TextStyle(color: Colors.white),),
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
                new ListTile(
                  leading: new Icon(Icons.today, color: Colors.grey[500]),
                  title: new Text('Datum: ${_date.day}-${_date.month}-${_date.year}'),
                  onTap: (){
                    _selectDate(context);
                  },
                ),

                new ListTile(
                  leading: new Icon(Icons.alarm, color: Colors.grey[500]),
                  title: new Text('Begintijd: $_hour:$_minute'),
                  onTap: (){
                    _selectTime(context);
                  },
                ),

                new ListTile(
                  leading: new Icon(Icons.alarm, color: Colors.white),
                  title: new Text('Eindtijd: $_hour2:$_minute2'),
                  onTap: (){
                    _selectTime2(context);
                  },
                ),

                new Divider(),

                new ListTile(
                  leading: new Icon(Icons.call_received, color: Colors.red),
                  title: new Text('Pietje werkt niet') ,
                  onTap: (){
                    new SearchList();
                  },
                ),

                new ListTile(
                  leading: new Icon(Icons.call_made, color: Colors.green),
                  title: new Text('jantje werkt wel'),
                  onTap: (){
                    new SearchList();
                  },
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

class VervangingEdit extends StatefulWidget {
  @override
  State createState() => new VervangingEditState();
}

class VervangingEditState extends State<VervangingEdit> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();
  TimeOfDay _time2 = new TimeOfDay.now();
  String _hour = new TimeOfDay.now().hour.toString();
  String _minute = '00';
  String _hour2 = (new TimeOfDay.now().hour + 1).toString();
  String _minute2 = '00';
  
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2050),
    );

    if(picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if(picked != null && picked != _time) {
      setState(() {
        _time = picked;
        switch(_time.hour) {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            _hour = '0' + _time.hour.toString();
            break;
          default:
            _hour = _time.hour.toString();
        }

        switch(_time.minute) {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            _minute = '0' + _time.minute.toString();
            break;
          default:
            _minute = _time.minute.toString();
        }

        switch(_time.minute) {
          case 58:
          case 59:
          case 0:
          case 1:
          case 2:
            _minute = '00';
            break;
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
            _minute = '05';
            break;
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
            _minute = '10';
            break;
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
            _minute = '15';
            break;
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
            _minute = '20';
            break;
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
            _minute = '25';
            break;
          case 28:
          case 29:
          case 30:
          case 31:
          case 32:
            _minute = '30';
            break;
          case 33:
          case 34:
          case 35:
          case 36:
          case 37:
            _minute = '35';
            break;
          case 38:
          case 39:
          case 40:
          case 41:
          case 42:
            _minute = '40';
            break;
          case 43:
          case 44:
          case 45:
          case 46:
          case 47:
            _minute = '45';
            break;
          case 48:
          case 49:
          case 50:
          case 51:
          case 52:
            _minute = '50';
            break;
          case 53:
          case 54:
          case 55:
          case 56:
          case 57:
            _minute = '55';
            break;
          default:
            _minute = '00';
            break;
        }

      });
    }
  }
  
  Future<Null> _selectTime2(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time2,
    );

    if(picked != null && picked != _time2) {
      setState(() {
        _time2 = picked;
        switch(_time2.hour) {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            _hour2 = '0' + _time2.hour.toString();
            break;
          default:
            _hour2 = _time2.hour.toString();
        }

        switch(_time2.minute) {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
            _minute2 = '0' + _time2.minute.toString();
            break;
          default:
            _minute2 = _time2.minute.toString();
        }

        switch(_time2.minute) {
          case 58:
          case 59:
          case 0:
          case 1:
          case 2:
            _minute2 = '00';
            break;
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
            _minute2 = '05';
            break;
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
            _minute2 = '10';
            break;
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
            _minute2 = '15';
            break;
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
            _minute2 = '20';
            break;
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
            _minute2 = '25';
            break;
          case 28:
          case 29:
          case 30:
          case 31:
          case 32:
            _minute2 = '30';
            break;
          case 33:
          case 34:
          case 35:
          case 36:
          case 37:
            _minute2 = '35';
            break;
          case 38:
          case 39:
          case 40:
          case 41:
          case 42:
            _minute2 = '40';
            break;
          case 43:
          case 44:
          case 45:
          case 46:
          case 47:
            _minute2 = '45';
            break;
          case 48:
          case 49:
          case 50:
          case 51:
          case 52:
            _minute2 = '50';
            break;
          case 53:
          case 54:
          case 55:
          case 56:
          case 57:
            _minute2 = '55';
            break;
          default:
            _minute2 = '00';
            break;
        }

      });
    }
  }

  @override
  void _submit() {

  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Vervanging wijzigen", style: new TextStyle(color: Colors.white),),
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

                new ListTile(
                  leading: new Icon(Icons.today, color: Colors.grey[500]),
                  title: new Text('Datum: ${_date.day}-${_date.month}-${_date.year}'),
                  onTap: (){
                    _selectDate(context);
                  },
                ),

                new ListTile(
                  leading: new Icon(Icons.alarm, color: Colors.grey[500]),
                  title: new Text('Begintijd: $_hour:$_minute'),
                  onTap: (){
                    _selectTime(context);
                  },
                ),

                new ListTile(
                  leading: new Icon(Icons.alarm, color: Colors.white),
                  title: new Text('Eindtijd: $_hour2:$_minute2'),
                  onTap: (){
                    _selectTime2(context);
                  },
                ),

                new Divider(),

                new ListTile(
                  leading: new Icon(Icons.call_received, color: Colors.red),
                  title: new Text('Pietje werkt niet') ,
                  onTap: (){
                    new SearchList();
                  },
                ),

                new ListTile(
                  leading: new Icon(Icons.call_made, color: Colors.green),
                  title: new Text('jantje werkt wel'),
                  onTap: (){
                    new SearchList();
                  },
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
        title: new Text("Vervanging verwijderen", style: new TextStyle(color: Colors.white),),
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
        title: new Text("Inval lijst bekijken", style: new TextStyle(color: Colors.white),),
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
        title: new Text("Inval lijst wijzigen", style: new TextStyle(color: Colors.white),),
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