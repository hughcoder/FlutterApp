import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter rolling demo'),
          ),
          body: Center(
            child: TextWidget(),
          ),
        ));
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Put your text here",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 16.0,
          fontWeight: FontWeight.bold
      ),
    );
  }
}

class RollingButton extends StatefulWidget {
  // StatefulWidget 需要实现这个方法，返回一个 State
  @override
  State createState() {
    return _RollingState();
  }
}

class _RollingState extends State<RollingButton> {
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Roll'),
      onPressed: _onPressed,
    );
  }

  List<int> _roll() {
    final roll1 = _random.nextInt(6) + 1;
    final roll2 = _random.nextInt(6) + 1;
    return [roll1, roll2];
  }

  void _onPressed() {
    debugPrint('_onPressed'); //用commond+4打开
    final rollResults = _roll();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text('Roll result:(${rollResults[0]},${rollResults[1]})'),
          );
        });
  }
}
