import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new MaterialButton()
    )
  );
}

class MaterialButton extends StatefulWidget {
  @override
  ButtonState createState() => new ButtonState();
}

class ButtonState extends State<MaterialButton> {

  int counter = 0;
  List<String> mStrings = ["Flutter", "is", "Awesome"];
  String mDisplayMessage = " ";

  void onBtnPressed() {
   setState((){
     mDisplayMessage = mStrings[counter];
     counter = counter < mStrings.length - 1 ? counter + 1 : 0;
   });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stateful and Buttons"),
        backgroundColor: Colors.amberAccent,

      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(mDisplayMessage, style: new TextStyle(fontSize: 15.0, color: Colors.deepOrangeAccent),),
              new RaisedButton(
                child: new Text("Show Data", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold )),
                color: Colors.blueAccent,
                onPressed: onBtnPressed
              )
            ],
          ),
        ),
      )
    );
  }
}