import 'package:flutter/material.dart';
import 'menu.dart';
import 'dart:async';

class VervangPage extends StatefulWidget {
  @override
  State createState() => new VervangPageState();
}

class VervangPageState extends State<VervangPage> with SingleTickerProviderStateMixin {
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
      drawer: new MenuBar(),
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

                new Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                  ),
                ),

                new RaisedButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: new Text(
                    "Vraag aan!"
                  ),
                  onPressed: _submit,
                  splashColor: Colors.purple, 
                )

            ],
          )
        ],
      ),
    );
  }
}