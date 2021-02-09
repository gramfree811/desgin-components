import 'package:flutter/material.dart';
import 'package:milan/comments.dart';
import 'package:milan/slider.dart';
import 'animation/basic_animation.dart';
import 'package:milan/triangle_shape.dart';

import 'bootom_sheet.dart';
import 'future_builder.dart';
import 'insta/insta_home.dart';
import 'main_list.dart';
import 'network/get_method.dart';
import 'network/post_method.dart';
import 'task1.dart';
import 'comments.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          buttonColor: Colors.black,
          primaryIconTheme: IconThemeData(color: Colors.black),
          primaryTextTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.black, fontFamily: "Aveny")),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black))),
      initialRoute: '/',
      routes: {
        '/': (context) => MainList(),
        '/futureBuilderExample': (context) => FutureBuilderExample(),
        '/sliderWidget': (context) => SliderWidget(),
        '/MyHomePage': (context) => MyHomePage(),
        '/bottomWidget': (context) => BottomWidget(),
        '/insta': (context) => InstaHome(),
        '/TriangleShape': (context) => TriangleShape(),
        '/GetMethod': (context) => GetMethod(),
        '/PostMethod': (context) => PostMethod(),
        // '/StateLessApi': (context) => StateLessApi(),
        '/comments': (context) => Comment(),
        '/animation': (context) => BasicAnim(),
      },
    );
  }
}


//
