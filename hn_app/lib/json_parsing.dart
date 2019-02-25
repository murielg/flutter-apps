import 'dart:convert';

parseItem(String jsonData) {
  final parsed = jsonDecode(jsonData);

}

List<int> parseTopStories(String jsonData) {
  final parsed = jsonDecode(jsonData);
  return List<int>.from(parsed);

}