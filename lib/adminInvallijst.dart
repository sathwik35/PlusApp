import 'package:flutter/material.dart';
import 'Adminfunctions.dart';

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