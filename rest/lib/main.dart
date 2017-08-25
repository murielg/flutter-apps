import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String HN_BASE_URL = "https://hacker-news.firebaseio.com/v0/";
const String HN_TOP_STORIES = "topstories.json";

void main() {
  runApp(
    new MaterialApp(
      home: new HomePage()  
    )
  );
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  Future<bool> getTopStories() async {
    String url = HN_BASE_URL + HN_TOP_STORIES;
    http.Response response = await http.get(
      Uri.encodeFull(url),
      headers: {
        "Accept" : "application/json"
      }
    );

    List storiesList = JSON.decode(response.body);

    getStories(storiesList);

    return true;
  }
  
  getStories(List stories) {
    stories.forEach((story) async {
      String url = HN_BASE_URL + "item/" + story.toString() + ".json";
      http.Response response = await http.get(
        Uri.encodeFull(url),
        headers: {
          "Accept" : "application/json"
        }
      );
      print(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
          child: new Text("Get Data"),
          onPressed: getTopStories,
        ),
      )
    );
  }
}
