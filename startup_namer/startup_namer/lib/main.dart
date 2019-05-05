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

  ///这个集合保存了用户喜欢的单词对，这里，Set 要优于 List，因为Set不允许出现重复元素
  final _saved = new Set<WordPair>();
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
        final index = i ~/ 2; //  ~/是一个运算符,用于整除

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
    //是否已经加入了收藏夹
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      //尾部
      trailing: new Icon(
        //Icons 中有很多图标
        //已收藏 未收藏 颜色不同  可以直接控制颜色
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),

      //item的单击事件
      onTap: () {
        //图标被点击后,会调用setState()回调函数来通知框架状态已经改变了
        //注:在Flutter的响应式框架中，调用setState() 会触发对 State 对象的 build() 方法的调用，从而导致UI的更新。
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}

///这是一个可变状态的View
class RandomWords extends StatefulWidget {
  @override
  State createState() => new RandomWordsState();
}
