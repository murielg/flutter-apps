import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
//https://flutter.dev/docs/development/data-and-backend/json
/// This allows the `Article` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'article.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.

@JsonSerializable()
class Article {

  Article(this.id, this.deleted, this.type, this.by, this.time, this.text,
      this.dead, this.parent, this.poll, this.kids, this.url, this.score,
      this.title, this.parts, this.descendants);

  @JsonKey(name: 'id', required: true)
  int id;

  @JsonKey(name: 'deleted', nullable: true)
  bool deleted;

  /// This is the type of the article
  ///
  /// "job", "story", "comment", "poll", or "pollopt"

  @JsonKey(name: 'type', nullable: true)
  String type;

  @JsonKey(name: 'by', nullable: true)
  String by;

  @JsonKey(name: 'time', nullable: true)
  int time;

  @JsonKey(name: 'text', nullable: true)
  String text;

  @JsonKey(name: 'dead', nullable: true)
  bool dead;

  @JsonKey(name: 'parent', nullable: true)
  int parent;

  @JsonKey(name: 'poll', nullable: true)
  int poll;

  @JsonKey(name: 'kids', nullable: true)
  List<int> kids;

  @JsonKey(name: 'url', nullable: true)
  String url;

  @JsonKey(name: 'score', nullable: true)
  int score;

  @JsonKey(name: 'title', nullable: true)
  String title;

  @JsonKey(name: 'parts', nullable: true)
  List<int> parts;

  @JsonKey(name: 'descendants', nullable: true)
  int descendants;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}

parseArticle(String jsonData) {
  final parsed = jsonDecode(jsonData);
  return Article.fromJson(parsed);
}

List<int> parseTopStories(String jsonData) {
  final parsed = jsonDecode(jsonData);
  return List<int>.from(parsed);
}