import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new Button()
    )
  );
}

class Button extends StatefulWidget {
  @override
  ButtonState createState() => new ButtonState();
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stateful and Buttons"),
        backgroundColor: Colors.amberAccent,

      ),
    );
  }
}