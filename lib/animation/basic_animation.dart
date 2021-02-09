import 'dart:math';

import 'package:flutter/material.dart';

class BasicAnim extends StatefulWidget {
  @override
  _BasicAnimState createState() => _BasicAnimState();
}

class _BasicAnimState extends State<BasicAnim> {
  double conHeight = 200;
  double conWidth = 200;
  Color conColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedContainer(
                      color: conColor,
                      duration: Duration(milliseconds: 500),
                      height: conHeight,
                      width: conWidth,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(0),
                child: Row(
                  children: [
                    Center(
                      child: IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                          setState(() {
                            conHeight = Random().nextDouble() * 150;
                            conWidth = Random().nextDouble() * 150;
                            conColor = Color(
                              (Random().nextDouble() * 0xFFFFFF).toInt(),
                            ).withOpacity(1.0);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
