import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentModel {
  final String id;
  final String createdAt;
   String message;
  final String userName;
  final bool isMyMessage;

  CommentModel(
      {this.id, this.createdAt, this.message, this.userName, this.isMyMessage});
}

class Comment extends StatefulWidget {
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  var message;
  List<CommentModel> commentList = [];
  bool _isLoading = false;
  TextEditingController _controller;
  String editableId;
  CommentModel editableObject;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      print(_controller.text);
    });
    fetchComments();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            child: ListView.builder(
                itemCount: commentList.length,
                itemBuilder: (context, index) {
                  return commentMessage(commentList[index]);
                }),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'write some words'),
                  controller: _controller,
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  updateComment();
                },
              )
            ],
          ),
        ),
      ],
    ));
  }

  Widget commentMessage(CommentModel data) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(
          left: data.isMyMessage ? 120 : 10,
          right: data.isMyMessage ? 10 : 120,
          bottom: 5,
          top: 10),
      decoration: BoxDecoration(
          color: data.isMyMessage
              ? Colors.pink.withOpacity(0.4)
              : Colors.blueAccent.withOpacity(0.4),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${data.userName}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              !data.isMyMessage
                  ? Container()
                  : Container(
                      child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            editableObject = data;
                            editableId = data.id;
                            _controller.text = data.message;
                          },
                          child: Icon(Icons.edit),
                        ),
                        GestureDetector(
                          onTap: () {
                            deleteMsg(data.id);
                          },
                          child: Icon(Icons.delete),
                        ),
                      ],
                    )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${data.message}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                children: [
                  Text('08:00'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Future fetchComments() async {
    setState(() {
      _isLoading = true;
    });
    commentList.clear();
    String apiUrl = 'https://6014e68db538980017569691.mockapi.io/comment';
    http.Response response = await http.get(apiUrl);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = jsonDecode(response.body);
      data.forEach((val) {
        print(val);
        commentList.add(CommentModel(
          id: val['id'],
          createdAt: val['createdAt'],
          isMyMessage: val['is_my_message'],
          message: val['message'],
          userName: val['user_name'],
        ));
      });
      setState(() {
        _isLoading = false;
      });
    } else {
      print('Error');
    }
  }

  void deleteMsg(String id) async {
    http.Response response = await http
        .delete('https://6014e68db538980017569691.mockapi.io/comment/$id');
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        commentList.removeWhere((element) => element.id == id);
      });
    }
  }

  void addMsg(String id) async {
    http.Response response = await http
        .get('https://6014e68db538980017569691.mockapi.io/comment/$id');
    if (response.statusCode == 200 || response.statusCode == 201) {
      setState(() {
        commentList.removeWhere((element) => element.id == id);
      });
    }
  }

  void addComment() {}

  void updateComment() async {
    String apiUrl = 'https://6014e68db538980017569691.mockapi.io/comment/$editableId';

    http.Response response = await http.put(apiUrl, body: {
      'message': "${_controller.text}",
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      editableObject.message = _controller.text;
      setState(() {
        _isLoading = false;
      });
    } else {
      print('Error');
    }
  }
}
