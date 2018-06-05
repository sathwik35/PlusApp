import 'package:flutter/material.dart';
import 'menu.dart';

class VervangPage extends StatefulWidget {
  @override
  State createState() => new VervangPageState();
}

class VervangPageState extends State<VervangPage>
    with SingleTickerProviderStateMixin {
  @override
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
          new Image(
            image: new AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
            ],
          )
        ],
      ),
    );
  }
}