import 'package:json_annotation/json_annotation.dart';

//https://flutter.dev/docs/development/data-and-backend/json

/// This allows the `Article` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'article.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.

@JsonSerializable()

class Article {

  Article(this.text, this.age, this.domain, this.by, this.commentsCount, this.score);

  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'domain')
  String domain;
  @JsonKey(name: 'by')
  String by;
  @JsonKey(name: 'age')
  String age;
  @JsonKey(name: 'score')
  int score;
  @JsonKey(name: 'commentsCount')
  int commentsCount;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}