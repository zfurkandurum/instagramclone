import 'package:flutter/material.dart';
import 'package:instagramclone/models/users.dart';
import 'package:instagramclone/resources/auth_method.dart';

class UserProvider with ChangeNotifier {
  late User _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
