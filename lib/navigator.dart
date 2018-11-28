import 'package:flutter/material.dart';

import 'dart:math' as Math;

void main() => runApp(new MyApp());

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        "/nameRoute": (BuildContext context) => new SecondPage(),
        '/a': (BuildContext context) => new MyPage(title: 'A 页面'),
        '/b': (BuildContext context) => new MyPage(title: 'B 页面'),
        '/c': (BuildContext context) => new MyPage(title: 'C 页面'),
      },
    );
  }
}

class MyPage extends StatelessWidget {
  MyPage({Key key, this.title}) : super(key: key);
  final String title;

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(title)),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("演示跳转"),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new FlatButton(
                onPressed: () {
                  print("点击跳转啊");
                  Navigator.pushNamed(context, "/nameRoute");
//                  Navigator.of(context).pushNamed('/nameRoute');
                },
                child: new Text("直接使用name跳转")),
            new FlatButton(
                onPressed: () {
                  Navigator.push<String>(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                        return new ThirdPage(title: "请输入昵称");
                      })).then((String result) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            content: new Text("您输入的昵称为:$result"),
                          );
                        });
                  });
                },
                child: new Text("跳转传参并返回值")),
            new RaisedButton(
              child: new Text('A按钮'),
              onPressed: () {
//                Navigator.of(context).pushNamed('/a');
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => new DetailScreen(todo: new Todo("哈哈","嘻嘻")),
                  ),
                );
              },
            ),
            new RaisedButton(
              child: new Text('B按钮'),
              onPressed: () {
                Navigator.of(context).pushNamed('/b');
              },
            ),
            new RaisedButton(
              child: new Text('C按钮'),
              onPressed: () {
                Navigator.of(context).pushNamed('/c');
              },
            )
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo
  final Todo todo;

  // In the constructor, require a Todo
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${todo.title}"),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Text('${todo.description}'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第二页"),
      ),
      body: new Center(
        child: new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text("return")),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  final String title;

  ThirdPage({this.title});

  @override
  State<StatefulWidget> createState() {
    return new _ThirdPageState();
  }
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController controller;

  @override
  void initState() {
    controller = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new TextField(
            decoration: new InputDecoration(labelText: "请输入昵称"),
            controller: controller,
          ),
          new RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                if (controller.text == '') {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => new AlertDialog(
                        title: new Text("请输入昵称"),
                      ));
                  return;
                }
                Navigator.pop(context, controller.text);
              },
              child: new Text("OK"))
        ],
      ),
    );
  }
}
