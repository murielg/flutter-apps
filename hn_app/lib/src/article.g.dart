// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id']);
  return Article(
      json['id'] as int,
      json['deleted'] as bool,
      json['type'] as String,
      json['by'] as String,
      json['time'] as int,
      json['text'] as String,
      json['dead'] as bool,
      json['parent'] as int,
      json['poll'] as int,
      (json['kids'] as List)?.map((e) => e as int)?.toList(),
      json['url'] as String,
      json['score'] as int,
      json['title'] as String,
      (json['parts'] as List)?.map((e) => e as int)?.toList(),
      json['descendants'] as int);
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'deleted': instance.deleted,
      'type': instance.type,
      'by': instance.by,
      'time': instance.time,
      'text': instance.text,
      'dead': instance.dead,
      'parent': instance.parent,
      'poll': instance.poll,
      'kids': instance.kids,
      'url': instance.url,
      'score': instance.score,
      'title': instance.title,
      'parts': instance.parts,
      'descendants': instance.descendants
    };
