import 'package:flutter/material.dart';
import 'package:flutter_listview/building.dart';
import 'package:flutter_listview/ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final buildings = [
    Building(BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
    Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
    Building(
        BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
    Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
    Building(BuildingType.theater, 'United Artists Stonestown Twin',
        '501 Buckingham Way'),
    Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
    Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
    Building(
        BuildingType.restaurant, 'Chaiya Thai Restaurant', '72 Claremont Blvd'),
    Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),

    // double 一下
    Building(BuildingType.theater, 'CineArts at the Empire', '85 W Portal Ave'),
    Building(BuildingType.theater, 'The Castro Theater', '429 Castro St'),
    Building(
        BuildingType.theater, 'Alamo Drafthouse Cinema', '2550 Mission St'),
    Building(BuildingType.theater, 'Roxie Theater', '3117 16th St'),
    Building(BuildingType.theater, 'United Artists Stonestown Twin',
        '501 Buckingham Way'),
    Building(BuildingType.theater, 'AMC Metreon 16', '135 4th St #3000'),
    Building(BuildingType.restaurant, 'K\'s Kitchen', '1923 Ocean Ave'),
    Building(
        BuildingType.restaurant, 'Chaiya Thai Restaurant', '72 Claremont Blvd'),
    Building(BuildingType.restaurant, 'La Ciccia', '291 30th St'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buildings"),
        ),
        body: BuildingListView(
            buildings,
            (index) => debugPrint('item $index '
                'clicked')),
      ),
    );
  }
}
