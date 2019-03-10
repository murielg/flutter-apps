import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:hn_app/src/hn_bloc.dart';
import 'package:hn_app/src/article.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  final hnBloc = HackerNewsBloc();
  runApp(MyApp(bloc: hnBloc));
}

class MyApp extends StatelessWidget {
  final HackerNewsBloc bloc;
  MyApp({
    Key key,
    this.bloc
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(
        title: 'Flutter Hacker News',
        bloc: bloc
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {

  final HackerNewsBloc bloc;

  MyHomePage({Key key, this.title, this.bloc}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        stream: widget.bloc.articles,
        initialData: UnmodifiableListView<Article>([]),
        builder: (context, snapshot) => ListView(
          children: snapshot.data.map(_buildItem).toList(),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
          items: [
            BottomNavigationBarItem(
                title: Text('Top Stories'),
                icon: Icon(Icons.arrow_upward),
            ),
            BottomNavigationBarItem(
              title: Text('New Stories'),
              icon: Icon(Icons.date_range),
            ),
          ],
        onTap: (index) {
          if (index == 0) {
            widget.bloc.storiesType.add(StoriesType.topStories);
          } else {
            widget.bloc.storiesType.add(StoriesType.newStories);
          }
        },
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Row(
      key: Key(article.id.toString()),
      children: <Widget>[
        Expanded(
          child:
          Padding(
              padding: EdgeInsets.all(0.0),
              child: ExpansionTile(
                title: Text(article.title ?? null),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("${article.descendants} comments") ?? null,
                      IconButton(
                        icon: Icon(Icons.open_in_browser),
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