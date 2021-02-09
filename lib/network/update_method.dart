import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateMethod extends StatefulWidget {
  final String id;
  final String name;
  final String url;

  const UpdateMethod({Key key, this.name, this.url, this.id}) : super(key: key);

  @override
  _UpdateMethodState createState() => _UpdateMethodState();
}

class _UpdateMethodState extends State<UpdateMethod> {
  bool _isLoading = false;
  String _name = '';
  String _url = '';

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _name = widget.name;
    _url = widget.url;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Update method',
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

  Future _addUsersApi(name, url, id) async {
    setState(() {
      _isLoading = true;
    });
    String apiUrl = 'https://6014e68db538980017569691.mockapi.io/user/$id';

    http.Response response = await http.put(apiUrl, body: {
      'name': "$name",
      'avatar': "$url",
    });
    print(response.statusCode);
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
                initialValue: widget.name,
                decoration: InputDecoration(hintText: 'name'),
                onChanged: (val) {
                  _name = val;
                },
              ),
            ),
            Container(
              child: TextFormField(
                initialValue: widget.url,
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
                  _scaffoldKey.currentState.showSnackBar(
                      SnackBar(content: Text('Enter valid fields')));
                } else {
                  _addUsersApi(_name, _url, widget.id);
                }
              },
              child: Text('Update'),
              color: Colors.blue,
            ),
          ],
        ),
      );
}
