import 'package:flutter/material.dart';

void main() {
  runApp(new ChatApp());
}

const String _name = "Muriel";

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Chat App",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messagesList = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat App"),
      ),
      body: new Column(
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
          )
        ],
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
            onSubmitted: _handleSubmitted,
            decoration: new InputDecoration.collapsed(
                hintText: "Send a message"
              )
          )
         ),
         new Container(
           margin: new EdgeInsets.symmetric(horizontal: 4.0),
           child: new IconButton(
               icon: new Icon(Icons.send, color: Colors.lightBlueAccent,),
               /*
               *  In Dart syntax, the fat arrow function declaration
               *  => expression is shorthand for { return expression; }.
               */
               onPressed: () => _handleSubmitted(_textController.text)
           ),
         )
       ]
      )
    );
  }

  void _handleSubmitted (String messageText) {
    _textController.clear();
    ChatMessage message = new ChatMessage(
      messageText: messageText
    );
    setState(() {
      _messagesList.insert(0, message);
    });
  }

}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.messageText});
  final String messageText;
  @override
  Widget build(BuildContext context) {
    return new Container(
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
    );
  }
}
