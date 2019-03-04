import 'package:flutter/material.dart';
import 'src/article.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

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
  List<int> _ids = [
  19264048,
  19263814,
  19264483,
  19263649,
  19265061,
  19265975,
  19264154,
  19264205,
  19265377,
  19257888
  ];

  Future<Article> _getArticle(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        child: ListView(
            children: _ids.map(
                (id) => FutureBuilder<Article>(
                  future: _getArticle(id),
                  builder: (BuildContext context, AsyncSnapshot<Article> article) {
                    if (article.connectionState == ConnectionState.done) {
                      return _buildItem(article.data);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                )
            ).toList()
          ),
        onRefresh: () async {
          await new Future.delayed(const Duration(seconds: 1));
          setState(() {
            _ids.shuffle();
          });

        },
      ),
    );
  }

  Widget _buildItem(Article article) {
      return new Row (
        key: Key(article.id.toString()),
        children: <Widget>[
          Expanded(
            child:
            new Padding(
                padding: EdgeInsets.all(0.0),
                child: new ExpansionTile(
                  title: new Text(article.title ?? null),
                  children: <Widget>[
                    new Row (
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                      new Text("${article.descendants} comments") ?? null,
                      new IconButton(
                        icon: new Icon(Icons.open_in_browser),
                        color: Colors.deepOrangeAccent,
                          onPressed: () {
                            _launchURL(article.url);
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

  if (await canLaunch(domain)) {
    await launch(domain);
  } else {
    throw 'Could not launch $domain';
  }
}