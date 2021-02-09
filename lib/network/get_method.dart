import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:milan/network/post_method.dart';
import 'package:milan/network/update_method.dart';
import 'package:milan/network/user_model.dart';
import 'package:intl/intl.dart';

class GetMethod extends StatefulWidget {
  @override
  _GetMethodState createState() => _GetMethodState();
}

class _GetMethodState extends State<GetMethod> {
  List<User> _usersList = [];
  bool _isLoading = false;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Network calls',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              icon: Icon(Icons.rotate_right_sharp),
              onPressed: () {
                _getUsers();
              })
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _usersListWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () async {
          var result = await Navigator.pushNamed(context, '/PostMethod');
          if (result != null) {
            screenResponse('Data Added');
            _getUsers();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future _getUsers() async {
    setState(() {
      _isLoading = true;
    });
    _usersList.clear();
    String apiUrl = 'https://6014e68db538980017569691.mockapi.io/user';
    http.Response response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      data.forEach((val) {
        _usersList.add(User(
            id: val['id'],
            name: val['name'],
            avatar: val['avatar'],
            createdAt: val['createdAt']));
      });
      setState(() {
        _isLoading = false;
      });
    } else {
      print('Error');
    }
  }

  Future _deleteUser(String id) async {
    setState(() {
      _isLoading = true;
    });

    String apiUrl = 'https://6014e68db538980017569691.mockapi.io/user/$id';
    http.Response response = await http.delete(apiUrl);

    if (response.statusCode == 200) {
      screenResponse('Data Deleted');
      _getUsers();
    } else {
      print('Error');
    }
  }

  Widget _usersListWidget() {
    return Container(
      child: ListView.builder(
          itemCount: _usersList.length,
          itemBuilder: (context, index) {
            var user = _usersList[index];
            return Padding(
              padding: EdgeInsets.all(5),
              child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('${user.avatar}')),
                      shape: BoxShape.circle,
                    ),
                    width: 70,
                  ),
                  title: Text('${user.name}'),
                  subtitle: Text(
                    '${DateFormat('dd/MM/yyyy').format(
                      DateTime.parse(_usersList[index].createdAt),
                    )}',
                  ),
                  trailing: Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.edit_outlined),
                            ),
                            onTap: () async {
                              var result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateMethod(
                                            id: _usersList[index].id,
                                            name: _usersList[index].name,
                                            url: _usersList[index].avatar,
                                          )));
                              if (result != null) {
                                screenResponse('Data updated');
                                _getUsers();
                              }
                            },
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.clear,color: Colors.red,),
                            ),
                            onTap: () async {
                              _deleteUser(_usersList[index].id);
                            },
                          ),
                        ],
                      ))),
            );
          }),
    );
  }

  void screenResponse(String msg) {
    _scaffoldKey.currentState
      ..showSnackBar(SnackBar(content: Text('$msg'))).closed.then((value) {});
  }
}
