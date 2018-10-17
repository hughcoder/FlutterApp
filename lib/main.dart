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
            child:  ButtonWidget()
          ),
        ));
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Put your text here dddddd",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 16.0,
          fontWeight: FontWeight.bold
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1539766773943&di=4ebf97fa06db7acdb69045e60a15fc57&imgtype=0&src=http%3A%2F%2Fi1.hdslb.com%2Fbfs%2Farchive%2F9cee584be54d5808b0e3b0f92971499b7cad9c52.jpg",
      width: 200.0,
      height: 150.0,
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var flatBtn = FlatButton(
      onPressed: () => print('FlatButton pressed'),
      child: Text('BUTTON'),
    );
    var raisedButton = RaisedButton(
      onPressed: () => print('RaisedButton pressed'),
      child: Text('BUTTON'),
    );
    return flatBtn;
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
