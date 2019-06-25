import 'package:flutter/material.dart';

class ContainerDemoPage extends StatefulWidget {
  @override
  State createState() => _ContainerDemoPageState();
}

class _ContainerDemoPageState extends State<ContainerDemoPage> {
  Expanded imageExpanded(String img) {
    return new Expanded(
      child: new Container(
        decoration: new BoxDecoration(
          border: new Border.all(
            width: 2,
            color: Colors.black38,
          ),
          borderRadius: const BorderRadius.all(
            const Radius.circular(8.0),
          ),
        ),
        margin: EdgeInsets.all(4),
        child: new Image.asset(img),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.black26,
      ),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              imageExpanded('images/image1.PNG'),
              imageExpanded('images/image2.PNG'),
            ],
          ),
          new Row(
            children: <Widget>[
              imageExpanded('images/image3.PNG'),
              imageExpanded('images/image4.PNG'),
            ],
          ),
          new Row(
            children: <Widget>[
              imageExpanded('images/image5.PNG'),
              imageExpanded('images/image6.PNG'),
            ],
          ),
        ],
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Container Page demo'),
      ),
      body: new Center(
        child: container,
      ),
    );
  }
}
