// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';
//
// class Comment {
//   final String id;
//   final String comment;
//   final String productName;
//   final String avatar;
//   final String createdAt;
//
//   Comment({
//     @required this.id,
//     @required this.comment,
//     @required this.avatar,
//     @required this.productName,
//     @required this.createdAt,
//   });
// }
//
// class StateLessApi extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Network calls',
//             style: TextStyle(color: Colors.black),
//           ),
//           backgroundColor: Colors.white,
//           actions: [
//           ],
//         ),
//         body: Center(
//           child: Container(
//             child: FutureBuilder(
//               future: getComments(),
//               builder:
//                   (BuildContext context,
//                   AsyncSnapshot<List<Comment>> snapshot) {
//                 print(snapshot);
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   if (snapshot.hasData != null) {
//                     return _listView(snapshot.data);
//                   } else
//                     return Text('No data');
//                 }
//                 return CircularProgressIndicator();
//               },
//             ),
//           ),
//         ));
//   }
//
//   Future<List<Comment>> getComments() async {
//     List<Comment> _commentsList = [];
//     String url = 'https://6014e68db538980017569691.mockapi.io/comments';
//     Response response = await get(url);
//
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       data.forEach((val) {
//         _commentsList.add(
//           Comment(
//             id: val['id'],
//             comment: val['comment'],
//             avatar: val['avatar'],
//             createdAt: val['createdAt'],
//             productName: val['product_name'],
//           ),
//         );
//       });
//     } else {
//       print('Error');
//     }
//     return _commentsList;
//   }
//
//   Widget _listView(List<Comment> comments) {
//     return ListView.builder(itemBuilder: (context, index) {
//       return ListTile(
//         leading: CircleAvatar(
//           child: Image.network(
//               'https://bramdejager.files.wordpress.com/2019/05/bramdejager-600x600.png?w=300'),
//         ),
//         title: Text('${comments[index].comment}'),
//         subtitle: Text('${comments[index].productName}',
//           style: TextStyle(color: Colors.grey),),
//         trailing: Text('${DateFormat('dd-MM-yyyy').format(
//             DateTime.parse('${comments[index].createdAt}'))}'),
//       );
//     }, itemCount: comments.length,);
//   }
// }