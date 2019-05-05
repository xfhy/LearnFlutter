import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
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
    //final wordPaid = new WordPair.random();
    //return new Text(wordPaid.asPascalCase);

    return new Scaffold(
      //状态栏
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      //body
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        //如果是奇数行,那么添加一个 一像素高度的分割线
        if (i.isOdd) {
          return new Divider();
        }

        // 这里是计算当前是第多少个,因为上面奇数行是规定的是分割线
        final index = i ~/ 2;   //  ~/是一个运算符,用于整除

        //如果到达了单词对列表的结尾处...
        if (index >= _suggestions.length) {
          // ...然后生成10个单词对到建议的名称列表中。  generateWordPairs()是三方库中的
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
