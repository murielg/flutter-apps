import 'package:flutter/material.dart';
import 'src/article.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'HN Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> _articles = articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new RefreshIndicator(
        child: new ListView(
            children: _articles.map(_buildItem).toList()
          ),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1));
          setState(() {
            _articles.shuffle();
          });

        },
      ),
    );
  }

  Widget _buildItem(Article article) {
      return new Row (
        children: <Widget>[
          Expanded(
            child:
            new Padding(
                padding: EdgeInsets.all(0.0),
                child: new ExpansionTile(
                  title: new Text(article.text),
                  children: <Widget>[
                    new Row (
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                      new Text("${article.commentsCount} comments"),
                      new IconButton(
                        icon: new Icon(Icons.open_in_browser),
                        color: Colors.deepOrangeAccent,
                          onPressed: () {
                            _launchURL(article.domain);
                          },
                      )
                    ],
                    )

                  ],
                  

                )
            ),
          )
        ],
      );
  }

}

_launchURL(String domain) async {
  final url = "https://" + domain;

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}