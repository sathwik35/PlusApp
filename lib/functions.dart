import 'package:flutter/material.dart';
import 'personeel.dart';

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

Widget createSchedule(_scheduleDay, _scheduleTimeS, _scheduleTimeE, _scheduleDate, _scheduleFunction) {
  return new Container(
    padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 5.0, bottom: 5.0),
    child: new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("$_scheduleDay")
                ],
              ),
            ),
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text("$_scheduleTimeS - $_scheduleTimeE"),
                  new Text("$_scheduleFunction")
                ],
              ),
            ),
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new Text("$_scheduleDate")
                ],
              ),
            ),
          ],
        ),
        new Divider(
          color: Colors.black,
          height: 1.0,
        ),
      ]
    )
  );
}

Widget userInfo(_personID) {
  String _personFName = "";
  String _personLName = "";
  String _personLocation = "";
  String _personFunction = "";
  String _personPhone = "";
  String _personEmail = "";
  String _personImage = "";

  if (_personID == 1) {
    _personFName = "Henk";
    _personLName = "Pieters";
    _personLocation = "Dordrecht";
    _personFunction = "Vakkenvuller";
    _personPhone = "0612345678";
    _personEmail = "h.pieters@plus.nl";
    _personImage = "H";
  }

  return new Container(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
    child: new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new BackButton(
                    color: const Color(0xFFFF000000),
                  ),
            new CircleAvatar(
              radius: 40.0,
              backgroundColor: new Color(0xFF534BA3),
              foregroundColor: Colors.white,
              child: new Text("$_personImage",textScaleFactor: 3.0 ,),
            ),
          
            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Text("$_personFName", textScaleFactor: 1.2 ,),
                  new Text("$_personLName", textScaleFactor: 1.2 ,),
                  new Text("$_personLocation", textScaleFactor: 1.2 ,),
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

                  new Text("Email adress:", textScaleFactor: 1.2 ,),
                  new Text("$_personEmail", textScaleFactor: 1.2 ,),
                ],
              ),
            ),
            
          ],
        ),
      ]
    )
  );
}


Widget createAccount(_personID) {
  String _personFName = "";
  String _personLName = "";
  String _personLocation = "";
  String _personFunction = "";
  String _personPhone = "";
  String _personEmail = "";
  String _personImage = "";

  if (_personID == 1) {
    _personFName = "Henk";
    _personLName = "Pieters";
    _personLocation = "Dordrecht";
    _personFunction = "Vakkenvuller";
    _personPhone = "0612345678";
    _personEmail = "h.pieters@plus.nl";
    _personImage = "H";
  }

  return new Container(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 5.0),
    child: new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            new CircleAvatar(
              radius: 40.0,
              backgroundColor: new Color(0xFF534BA3),
              foregroundColor: Colors.white,
              child: new Text("$_personImage",textScaleFactor: 3.0 ,),
            ),

            new Flexible(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Text("$_personFName", textScaleFactor: 1.2 ,),
                  new Text("$_personLName", textScaleFactor: 1.2 ,),
                  new Text("$_personLocation", textScaleFactor: 1.2 ,),
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

                  new Text("Email adress:", textScaleFactor: 1.2 ,),
                  new Text("$_personEmail", textScaleFactor: 1.2 ,),
                ],
              ),
            ),
          ],
        ),
      ]
    )
  );
}