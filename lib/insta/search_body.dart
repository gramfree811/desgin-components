import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'insta_list.dart';

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
    const StaggeredTile.count(3, 2),
    const StaggeredTile.count(2, 3),
  ];

  List<Widget> _tiles = <Widget>[
    const _SearchTile(Colors.green, Icons.widgets),
    const _SearchTile(Colors.lightBlue, Icons.wifi),
    const _SearchTile(Colors.amber, Icons.panorama_wide_angle),
    const _SearchTile(Colors.brown, Icons.map),
    const _SearchTile(Colors.deepOrange, Icons.send),
    const _SearchTile(Colors.indigo, Icons.airline_seat_flat),
    const _SearchTile(Colors.red, Icons.bluetooth),
    const _SearchTile(Colors.pink, Icons.battery_alert),
    const _SearchTile(Colors.purple, Icons.desktop_windows),
    const _SearchTile(Colors.blue, Icons.radio),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                height:50,
                width: double.infinity,
                color: Colors.red,
              ),
            ],
          ),
          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 12.0),
          //     child: new StaggeredGridView.count(
          //       crossAxisCount: 5,
          //       staggeredTiles: _staggeredTiles,
          //       children: _tiles,
          //       mainAxisSpacing: 4.0,
          //       crossAxisSpacing: 4.0,
          //       padding: const EdgeInsets.all(4.0),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _SearchTile extends StatelessWidget {
  const _SearchTile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
