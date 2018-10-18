import 'package:flutter/material.dart';

void main() => runApp(new View());

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final titleSection = _TitleSection(
        'Oeschinen Lake Campground', 'Kandersteg, Switzerland', 41);
    Widget buttonSection = Container(
      child: Row(
        // 沿水平方向平均放置
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //有间隔的
        children: <Widget>[
          _buildButtonColumn(context, Icons.call, 'CALL'),
          _buildButtonColumn(context, Icons.near_me, 'Route'),
          _buildButtonColumn(context, Icons.share, 'SHARE'),
        ],
      ),
    );
    final textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
          ''',
        softWrap: true,
      ),
    );

    return MaterialApp(
        title: 'Flutter UI basic 1',
        home: Scaffold(
          appBar: AppBar(
            title: Text('lakes'),
          ),
          body: ListView(
            children: <Widget>[
              Image.asset(
                'images/lake.jpg',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          )
        ));
  }
}

class _TitleSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final int starCount;

  _TitleSection(this.title, this.subtitle, this.starCount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[500]),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(starCount.toString())
        ],
      ),
    );
  }
}

class titleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      // main axis 跟我们前面提到的 cross axis 相对应，对 Column 来说，指的就是竖直方向。
      // 在放置完子控件后，屏幕上可能还会有一些剩余的空间（free space），min 表示尽量少占用
      // free space；类似于 Android 的 wrap_content。
      // 对应的，还有 MainAxisSize.max
      return new Column(
        mainAxisSize: MainAxisSize.min,
        // 沿着 main axis 居中放置
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icon,
            color: color,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 0.8),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }
  }
}

Widget _buildButtonColumn(BuildContext context, IconData icon, String label) {
  final color = Theme.of(context).primaryColor;
  return Column(
    // main axis 跟我们前面提到的 cross axis 相对应，对 Column 来说，指的就是竖直方向。
    // 在放置完子控件后，屏幕上可能还会有一些剩余的空间（free space），min 表示尽量少占用
    // free space；类似于 Android 的 wrap_content。
    // 对应的，还有 MainAxisSize.max
    mainAxisSize: MainAxisSize.min,
    // 沿着 main axis 居中放置
    mainAxisAlignment: MainAxisAlignment.center,

    children: <Widget>[
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      )
    ],
  );
}
