import 'package:flutter/material.dart';

class MainList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Widget List',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('FutureBuilderExample'),
            onTap: () => _redirect(context,'/futureBuilderExample'),
          ),
          ListTile(
            title: Text('Slider'),
            onTap: () => _redirect(context,'/sliderWidget'),
          ),
          ListTile(
            title: Text('Task1'),
            onTap: () => _redirect(context,'/MyHomePage'),
          ),
          ListTile(
            title: Text('Bottom Widget'),
            onTap: () => _redirect(context,'/bottomWidget'),
          ),
          ListTile(
            title: Text('Insta'),
            onTap: () => _redirect(context,'/insta'),
          ),
          ListTile(
            title: Text('TriangleShape'),
            onTap: () => _redirect(context,'/TriangleShape'),
          ),
          ListTile(
            title: Text('GetMethod'),
            onTap: () => _redirect(context,'/GetMethod'),
          ),
          ListTile(
            title: Text('PostMethod'),
            onTap: () => _redirect(context,'/PostMethod'),
          ),
          ListTile(
            title: Text('StateLessApi'),
            onTap: () => _redirect(context,'/StateLessApi'),
          ),
          ListTile(
            title: Text('Update'),
            onTap: () => _redirect(context,'/Update'),
          ),
          ListTile(
            title: Text('comments'),
            onTap: () => _redirect(context,'/comments'),
          ),
          ListTile(
            title: Text('Basic Animation'),
            onTap: () => _redirect(context,'/animation'),
          ),

        ],
      ),
    );
  }

  _redirect(context,String route) {
       // Navigator.push(context, MaterialPageRoute(builder: (context) => FutureBuilderExample()));
    Navigator.pushNamed(context, route);
  }
}
