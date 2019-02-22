import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());




// https://github.com/seenickcode/fluttercrashcourse-lessons/blob/master/recipe02-lists/lesson07/lib/location_list.dart




// ################################################ //

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
    title: 'Hi',
      home: new RandomWords()
    );
  }
}

// ################################################ //

//TODO: Redux Equivalent? Look this up!!!
class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 24.0);

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext _context, int i) {
        if (i.isOdd) {
          return new Divider();
        }
        final int index = i ~/2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

// ################################################ //

 @override
  Widget build(BuildContext context) {
    //return new Text(WordPair.random().asPascalCase);

   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Random Name Generator")
     ),
     body: _buildSuggestions(),
   );
  }
}

// ################################################ //

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}