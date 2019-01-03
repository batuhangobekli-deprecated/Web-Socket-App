import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class MyHomePage extends StatefulWidget{
  final WebSocketChannel channel;
  MyHomePage({@required this.channel});
  @override
  State<StatefulWidget> createState() {
    return new MyHomePageState();
  }
}
class MyHomePageState extends State<MyHomePage>{
  TextEditingController editingController = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Web Socket"),
        ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: new TextFormField(
                decoration: new InputDecoration(labelText: "Send message"),
                controller: editingController,
              ),
            ),
            new StreamBuilder(
              stream: widget.channel.stream,
              builder: (context,snapshot){
                return new Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: new Text(snapshot.hasData ? '${snapshot.data}':''),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.send),
        onPressed: _sendMessage,
      ),
    );
  }
  void _sendMessage(){
      if(editingController.text.isNotEmpty){
        widget.channel.sink.add("batuhantoken");
        widget.channel.sink.add(this.editingController.text);
      }
  }
  @override
  void dispose(){
    widget.channel.sink.close();
    super.dispose();
  }
}