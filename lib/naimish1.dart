import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Icon(
              Icons.account_circle,
              size: 100,
            ),
            Column(
              children: [Text('Contact'), Text('Varsani')],
            )
          ]),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Naimish Varsani'),
                  SizedBox(width: 20,),
                  Icon(Icons.account_circle),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Naimish Varsani'),
                  SizedBox(width: 20,),
                  Icon(Icons.account_circle),
                ],
              ),



            ],
          )
        ],
      ),
    );
  }
}
