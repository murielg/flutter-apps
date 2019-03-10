import 'dart:async';
import 'dart:collection';

import 'package:hn_app/src/article.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

enum StoriesType {
  topStories,
  newStories,
}

class HackerNewsBloc {

  static List<int> _newIds = [
    19264048,
    19263814,
    19264483,
    19263649,
    19265061,
  ];

  static List<int> _topIds = [
    19265975,
    19264154,
    19264205,
    19265377,
    19257888
  ];

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  final _isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  var _articles = <Article>[];

  final _storiesTypeController = StreamController<StoriesType>();

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;




  HackerNewsBloc() {
    _getArticlesAndUpdate(_topIds);

    _storiesTypeController.stream.listen((storiesType) {

      if (storiesType == StoriesType.newStories) {
        _getArticlesAndUpdate(_newIds);
      }
      if (storiesType == StoriesType.topStories) {
        _getArticlesAndUpdate(_topIds);
      }
    });
  }

  _getArticlesAndUpdate(List<int> ids) async {

    _isLoadingSubject.add(true);

    await _updateArticles(ids);

    _articlesSubject.add(UnmodifiableListView(_articles));

    _isLoadingSubject.add(false);
  }

  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;



  Future<Null> _updateArticles(List<int> articleIds) async {
    final futureArticles = articleIds.map((id) => _getArticle(id));

    final articles = await Future.wait(futureArticles);

    _articles = articles;

  }

  Future<Article> _getArticle(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }

}

