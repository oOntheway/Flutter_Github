import 'package:flutter/material.dart';
import 'package:flutter_github/manager/dio-manger.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

  final _saved = new Set();

  final _biggerFont = const TextStyle(fontSize: 18.0);

  List<Map<String, dynamic>> _list = new List();

  void getData() {
    print('get data');
    DioManager
      .getInstance()
      .getHttp(
        "/search/repositories",
        { 'q': 'all', 'sort': 'starts' },
        (data) {
          List<Map<String, dynamic>> items = new List.from(data['items']);
          print('type is ${items.runtimeType}');
          setState(() {
            _list = items;
          });
        }
      );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Random Word'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.list),
              onPressed: _pushSaved
            ),
          ],
        ),
        body: _buildSuggestions()
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        // 在每一列之前，添加一个1像素高的分隔线widget
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        return _buildRow(_list[index]);
      },
      itemCount: _list.length > 0 ? 50 : 0
    );
  }

  Widget _buildRow(item) {
    final alreadySaved = _saved.contains(item);
    final owner = item['owner'];

    return new ListTile(
      title: new Text(
        item['name'],
        style: _biggerFont
      ),
      leading: Image.network(owner['avatar_url']),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        _pushWebview(item);
      },
    );
  }

  void _pushWebview(item) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new WebviewScaffold(
            url: item['html_url'],
            appBar: new AppBar(
              title: new Text(item['name']),
            ),
          );
        }
      )
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map((item) {
            return new ListTile(
              title: new Text(
                item['name'],
                style: _biggerFont,
              )
            );
          });

          final divided = ListTile
            .divideTiles(
              context: context,
              tiles: tiles
            )
            .toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Favorite'),
              ),
              body: new ListView(children: divided),
            );
        }
      )
    );
  }
}
