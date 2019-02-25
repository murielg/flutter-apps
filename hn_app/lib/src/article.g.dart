// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
      json['text'] as String,
      json['age'] as String,
      json['domain'] as String,
      json['by'] as String,
      json['commentsCount'] as int,
      json['score'] as int);
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'text': instance.text,
      'domain': instance.domain,
      'by': instance.by,
      'age': instance.age,
      'score': instance.score,
      'commentsCount': instance.commentsCount
    };
