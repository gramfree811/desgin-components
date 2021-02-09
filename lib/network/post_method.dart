import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostMethod extends StatefulWidget {
  @override
  _PostMethodState createState() => _PostMethodState();
}

class _PostMethodState extends State<PostMethod> {
  bool _isLoading = false;
  String _name = '';
  String _url = '';

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Post method',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _addUser(),
    );
  }

  Future _addUsersApi(name, url) async {
    setState(() {
      _isLoading = true;
    });
    String apiUrl = 'https://6014e68db538980017569691.mockapi.io/user';
    http.Response response = await http.post(apiUrl, body: {
      'name': "$name",
      'avatar': "$url",
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.pop(context, true);
      setState(() {
        _isLoading = false;
      });
    } else {
      print('Error');
    }
  }

  _addUser() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              child: TextFormField(
                decoration: InputDecoration(hintText: 'name'),
                onChanged: (val) {
                  _name = val;
                },
              ),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(hintText: 'image url'),
                onChanged: (val) {
                  _url = val;
                },
              ),
            ),
            SizedBox(
              height: 20,
              child: Column(),
            ),
            RaisedButton(
              onPressed: () {
                if (_name.isEmpty && _url.isEmpty) {
                  _scaffoldKey.currentState.hideCurrentSnackBar();
                  _scaffoldKey.currentState
                    ..showSnackBar(
                        SnackBar(content: Text('Enter valid fields')));
                } else {
                  _addUsersApi(_name, _url);
                }
              },
              child: Text('Submit'),
              color: Colors.blue,
            ),
          ],
        ),
      );
}
