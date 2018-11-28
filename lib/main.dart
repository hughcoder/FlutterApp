import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import './View.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//        title: 'Flutter Demo',
//        theme: new ThemeData(
//          // This is the theme of your application.
//          //
//          // Try running your application with "flutter run". You'll see the
//          // application has a blue toolbar. Then, without quitting the app, try
//          // changing the primarySwatch below to Colors.green and then invoke
//          // "hot reload" (press "r" in the console where you ran "flutter run",
//          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
//          // counter didn't reset back to zero; the application is not restarted.
//          primarySwatch: Colors.blue,
//        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter rolling demo'),
          ),
          body: MessageForm(),
        ));
  }
}

/// Text

class TextWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Text(
      "Put your text here dddddd",
      style: TextStyle(
          color: Colors.blue, fontSize: 16.0, fontWeight: FontWeight.bold),
    );
  }
}

/// 图片

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

/// 按钮btn
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

/// 文本输入框
class MessageForm extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MessageFormState();
  }
}

class _MessageFormState extends State<MessageForm> {
  var editController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("cccc");
    debugPrint('_onPressed');
    var data =[1,2,3,4];
    var stream = new Stream.fromIterable(data);
    stream.listen((e)=>print(e), onDone: () => print('Done'));
  }

  @override
  Widget build(BuildContext context) {
    // Row、Expand 都是用于布局的控件
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: editController,
          ),
        ),
        RaisedButton(
          child: Text("click"),
          onPressed: () => showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  content: Text(editController.text),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('ok'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                );
              }),
        )
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 手动调用 controller 的 dispose 方法以释放资源
    editController.dispose();
  }
}

/// 弹框加按钮
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

/// 布局 Flutter 里面所有的东西都是 Widget，所以，布局也是 Widget。
/// 控件 Container 可以让我们设置一个控件的尺寸、背景、margin 等
class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('文本信息'),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(4.0),
      width: 80.0,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(5.0)),
    );
  }
}

///如果我们只需要 padding，可以使用控件 Padding：
class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text('text'),
    );
  }
}

///Center 就跟它的名字一样，把一个控件放在中间：
class CenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(4.0),
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        // 背景色
        color: Colors.grey,
        // 圆角
        borderRadius: BorderRadius.circular(5.0),
      ),

      // 把文本放在 Container 的中间
      child: Center(
        child: Text('text'),
      ),
    );
  }
}

/// Flutter 里面所有的东西都是 Widget，所以，布局也是 Widget。水平布局我们可以使用 Row，竖直布局使用 Column。
class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // 只有一个子元素的 widget，一般使用 child 参数来设置；Row 可以包含多个子控件，
      // 对应的则是 children。
      children: <Widget>[
        Text('text1'),
        Text('text2'),
        Text('text3'),
        Text('text4'),
      ],
    );
  }
}

///Expand 一行按比例占位
class ExpandWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          // 占一行的 2/3
          flex: 2,
          child: RaisedButton(
            child: Text('btn1'),
          ),
        ),
        Expanded(
          // 占一行的 1/3
          flex: 1,
          child: RaisedButton(
            child: Text('btn2'),
          ),
        ),
      ],
    );
  }
}

/// Stack 布局 子控件都按 Stack 的左上角对齐，于是，上面的两个文本完全一上一下堆叠在一起。
class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text('foobar'),
        Text('barfoo'),
      ],
    );
  }
}


