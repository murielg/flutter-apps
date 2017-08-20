import 'package:flutter/material.dart';
void main() {
  runApp(new MaterialApp(

    home: new HomePage(
      title: new Text("Flutter - Navigation")
    ),
    routes: <String, WidgetBuilder> {
      "/DetailPage" : (BuildContext context) => new DetailPage(title: new Text("Detail Page"))
    }
  ));

}

class HomePage extends StatelessWidget {
  final Widget title;

  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: this.title, backgroundColor: Colors.green,),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new IconButton(
                  icon: new Icon(Icons.home),
                  color: Colors.greenAccent,
                  iconSize: 50.0,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/DetailPage");
                  }
              ),
              new Text("Home")

            ],
          ),
        )
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Widget title;

  DetailPage({this.title});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: this.title, backgroundColor: Colors.pink,),
      body: new Container(
          child: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.image),
                    color: Colors.pinkAccent,
                    iconSize: 50.0,
                    onPressed: null
                ),
                new Text("Detail Page")

              ],
            ),
          )
      ),
    );
  }
}