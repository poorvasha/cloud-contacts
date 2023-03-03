import 'package:flutter/foundation.dart';

class UserModel {
  String email;
  String password;
  UserModel({
    required this.email,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}

class UserModelWithId extends UserModel {
  late String id;

  UserModelWithId({
    required id,
    required super.email,
    required super.password,
  });
}
