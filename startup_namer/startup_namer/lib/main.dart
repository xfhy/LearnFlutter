import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }
}

//StatefulWidget创建一个State的实例,StatefulWidget本身是不可变的,但是State是可变的,并且存在生命周期

//它保存了 RandomWords 类的状态，它会保存生成的单词对，
class RandomWordsState extends State<RandomWords> {
  //类属性的命名 注意
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final wordPaid = new WordPair.random();
    return new Text(wordPaid.asPascalCase);
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        //如果是奇数行,那么添加一个 一像素高度的分割线
        if (i.isOdd) {
          return new Divider();
        }

        // 这个"i ~/ 2"的表达式将i 除以 2，然后会返回一个整数结果。
        // 例： 1, 2, 3, 4, 5 会变成 0, 1, 1, 2, 2。
        // 这个表达式会计算 ListView 中单词对的真实数量
        final index = i ~/ 2;

        //如果到达了单词对列表的结尾处...
        if (index > _suggestions.length) {
          // ...然后生成10个单词对到建议的名称列表中。
          _suggestions.addAll(generateWordPairs().take(10));
        }

        //在每次生成单词对后，_buildSuggestions 会调用 _buildRow。这个函数使用 ListTile 组件显示每一个新的单词对，这使得每一行更加好看。
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

///这是一个可变状态的View
class RandomWords extends StatefulWidget {
  @override
  State createState() => new RandomWordsState();
}
