import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyStatelessWidget()
  ));
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Stateless Example")),
      body: new Container(
        padding: new EdgeInsets.all(5.0),
        child: new ListView(
          children: <Widget>[
            new CardView(
              title: new Text("Call Log"),
              icon: new Icon(Icons.call, color: Colors.green,)
            ),
            new CardView(
              title: new Text("Messages"),
              icon: new Icon(Icons.message, color: Colors.blue,)
            ),
            new CardView(
              title: new Text("Photos"),
              icon: new Icon(Icons.photo, color: Colors.pinkAccent,)
            )
          ]
        )
      )
    );
  }
}

class CardView extends StatelessWidget {
  final Widget title;
  final Widget icon;

  CardView({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(bottom: 2.0) ,
      child: new Card(
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: new Row(
            children: <Widget>[
              this.icon,
              this.title
            ]
          )
        )
      )
    );
  }

}