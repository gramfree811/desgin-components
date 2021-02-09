
import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String name;
  final String avatar;
  final String createdAt;

  User({
    @required this.id,
    @required this.name,
    @required this.avatar,
    @required this.createdAt,
  });
}