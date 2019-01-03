import 'package:flutter/material.dart';
import 'package:web_socket_app/Pages/home_page.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      home: new MyHomePage(
        channel: new IOWebSocketChannel.connect("104.248.44.14:3000"),
      ),
      
    );
  }
}
