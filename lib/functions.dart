import 'package:flutter/material.dart';

Widget createRequest(_replacementRequestID, _replacementRequestName, _replacementRequestDate, _replacementRequestTimeS, _replacementRequestTimeE) {
  return new Container(
    padding: const EdgeInsets.all(20.0),
    // decoration: const BoxDecoration(
    //   border: const Border(
    //     top: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
    //     left: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
    //     right: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
    //     bottom: const BorderSide(width: 1.0, color: const Color(0xFFFF000000)),
    //   )
    // ),
    child: new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("$_replacementRequestName heeft een vervanger nodig!")
                ],
              ),
            ),
          ],
        ),
        new Divider(
          color: Colors.black,
        ),
        new Row(
          children: <Widget>[
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("$_replacementRequestDate kan $_replacementRequestName niet komen werken van $_replacementRequestTimeS - $_replacementRequestTimeE")
                ],
              ),
            ),
          ],
        ),
        new Divider(),
        new Row(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  color: new Color(0xFF81BD1D),
                  textColor: Colors.white,
                  child: new Text(
                    "Ik kan werken!"
                  ),
                  onPressed: ()=> print("Accept: $_replacementRequestID"),
                  splashColor: Colors.purple, 
                ),
              ],
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: new Text(
                    "Ik kan niet werken"
                  ),
                  onPressed: ()=> print("cancel: $_replacementRequestID"),
                  splashColor: Colors.purple, 
                )
              ],
            )
          ],
        )
      ]
    )
  );
}

Widget createNotification(_notificationDateTime, _notificationMessage, _notificationSender) {
  return new Container(
    padding: const EdgeInsets.all(20.0),
    child: new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Flexible(
              child: new Column(
                children: <Widget>[
                  new Text("Mededeling : ")
                ],
              ),
            ),
            new Flexible(
              child: new Column(
                children: <Widget>[
                  new Text("$_notificationDateTime")
                ],
              ),
            ),
          ],
        ),
        new Divider(
          color: Colors.black,
        ),
        new Row(
          children: <Widget>[
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("$_notificationMessage")
                ],
              ),
            ),
          ],
        ),
        new Divider(
          height: 5.0,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text("Door : $_notificationSender")
                ],
              ),
            ),
          ],
        )
      ]
    )
  );
}

Widget createUpdate(_updateDateTime, _updateMessage) {
  return new Container(
    padding: const EdgeInsets.all(20.0),
    child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("Update : ")
                ],
              ),
            ),
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("$_updateDateTime")
                ],
              ),
            ),
          ],
        ),
        new Divider(
          color: Colors.black,
        ),
        new Row(
          children: <Widget>[
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("$_updateMessage")
                ],
              ),
            ),
          ],
        )
      ]
    )
  );
}

Widget userInfo(_personID, _personName, _personPhone, _personDepartment, _personFunction, _personEmail) {
  String _personImage = _personName[0];

  return new Scaffold(
    appBar: new AppBar(
      title: new Image(
          image: new AssetImage("assets/menu.png"), fit: BoxFit.cover),
    ),
    backgroundColor: Colors.white,
    body: new ListView(
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Theme(
              data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                          color: Colors.white, fontSize: 20.0))),
              child: new Container(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    new Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              new CircleAvatar(
                                radius: 35.0,
                                backgroundColor: new Color(0xFF534BA3),
                                foregroundColor: Colors.white,
                                child: new Text("$_personImage",textScaleFactor: 2.5 ,),
                              ),
                            
                              new Flexible(
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    new Text("$_personName", textScaleFactor: 1.2 ,),
                                    new Text("$_personDepartment", textScaleFactor: 1.2 ,),
                                    new Text("$_personFunction", textScaleFactor: 1.2 ,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          new Divider(),
                          new Divider(
                            color: new Color(0xFF534BA3),
                            height: 5.0,
                          ),
                          new Divider(),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Flexible(
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    
                                    new Text("Telefoonnummer mobiel:", textScaleFactor: 1.2 ,),
                                    new Text("$_personPhone", textScaleFactor: 1.2 ,),

                                    new Divider(),

                                    new Text("Email adres:", textScaleFactor: 1.2 ,),
                                    new Text("$_personEmail", textScaleFactor: 1.2 ,),
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ]
                      )
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    )
  );
}