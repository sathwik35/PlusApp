import 'package:flutter/material.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.green
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  // Animation for logo
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

   // Input controller
  final textController = new TextEditingController();

  // Logic
  @override
  void initState() {
    super.initState();

    //Animation
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(
        milliseconds: 500
      )
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut
    );
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();

    // Login controller
    textController.addListener(printSomeValues);
  }

  printSomeValues(){
    print("Controller values ${textController.text}");
  }

  @override
  void dispose() {
    textController.removeListener(printSomeValues());
    textController.dispose();
    super.dispose();
  }

  // LoginPage
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.green,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background
          new Image(
            image: new AssetImage("assets/Background.png"),
            fit: BoxFit.cover,
            // color: Colors.black87,
            // colorBlendMode: BlendMode.darken,
          ),
          // Wrapper
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Position center
            children: <Widget>[
              // Logo
              new Image(
                image: new AssetImage("assets/LoginTransparent.png"),
                width: _iconAnimation.value * 200,
              ),
              // Login form
              new Form(
                child: new Theme(
                  // Style
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.white,
                        fontSize: 20.0
                      )
                    )
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(60.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Textfields
                        new TextField(
                          onChanged: (text)=>print("My Text $text"),
                          controller: textController, // For the input controller
                          decoration: new InputDecoration(
                            labelText: "Username"
                          ),
                        keyboardType: TextInputType.text,
                        ),
                        new TextField(
                          decoration: new InputDecoration(
                            labelText: "Password"
                          ),
                        keyboardType: TextInputType.text,
                        obscureText: true,  // replace input with ****
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(
                            top: 40.0,
                          ),
                        ),
                        // Button
                        new MaterialButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: new Text(
                            "Login"
                          ),
                          onPressed: ()=>{},  // Button click
                          splashColor: Colors.purple, 
                        ),
                        new Text(textController.text)
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}