import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(new ChatApp());
}

const String _name = "Muriel";

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.teal,
  primaryColor:  Colors.grey[100],
  primaryColorBrightness: Brightness.light
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.lightBlue,
  accentColor: Colors.lightBlueAccent[500]
);


class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Chat App",
      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kDefaultTheme,
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messagesList = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat App"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new Container (
        decoration: Theme.of(context).platform == TargetPlatform.iOS ?
        new BoxDecoration(border: new Border(top: new BorderSide(color: Colors.grey[200]))) : null,
        child:new Column(
          children: <Widget>[
            new Flexible(
              child: new ListView.builder(
                padding: new EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messagesList[index],
                itemCount: _messagesList.length,
              ),
            ),
            new Divider(
              height: 5.0,
            ),
            new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor
              ),
              child: _buildTextComposer(),
            ),
          ],
        ),
      )
    );
  }

  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
       children: <Widget>[
         new Flexible (
          child: new TextField(
            controller: _textController,
            onChanged: (String text) {
              setState(() {
                _isComposing = text.length > 0;
              });
            },
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(
                hintText: "Send a message"
              )
          )
         ),
         new Container(
           margin: new EdgeInsets.symmetric(horizontal: 4.0),
           child: Theme.of(context).platform == TargetPlatform.iOS ?
             new CupertinoButton(
                 child: new Text("Send"),
                 onPressed: (){
                   _handleSubmitted(_textController.text);
                 }) :
             new IconButton(
                 icon: new Icon(Icons.send),
                 onPressed: () {
                   _handleSubmitted(_textController.text);
                 }),
         )
       ]
      )
    );
  }

  void _handleSubmitted (String messageText) {

    if (!_isComposing) {
      return null;
    }

    _textController.clear();
    setState((){
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      messageText: messageText,
      animationController: new AnimationController(
        duration: new Duration(microseconds: 600),
        vsync: this,
      ),
    );
    setState(() {
      _messagesList.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messagesList) {
      message.animationController.dispose();
    }
    super.dispose();
  }


}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.messageText, this.animationController});

  final AnimationController animationController;
  final String messageText;

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
    sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut
      ),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(
                child: new Text(_name[0]),
              ),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(messageText),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
