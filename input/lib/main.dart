import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(
      home: new TextEditInput(),
    )
  );
}

class TextEditInput extends StatefulWidget {
  @override
  _TextEditInputState createState() => new _TextEditInputState();
}

class _TextEditInputState extends State<TextEditInput> {

  final TextEditingController editingController = new TextEditingController();

  String textEditInput = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Input Text"),
        backgroundColor: Colors.indigoAccent,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Type your text here!"
                ),
                onSubmitted: (String string) {
                  setState(() {
                    textEditInput = textEditInput + "\n" + string;
                  });

                  editingController.text = "";

                },
                controller: editingController
              ),
              new Text(textEditInput)
            ],
          ),
        ),
      ),
    );
  }
}

