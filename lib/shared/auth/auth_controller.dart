import 'package:flutter/material.dart';
import 'package:learning_project/modules/home/home_page.dart';
import 'package:learning_project/modules/login/login_page.dart';

class AuthController {
  var _isAutenticated = false;
  var _user;

  get user => _user;

  void setUser(BuildContext context, var user) {
    if (user != null) {
      _user = user;
      _isAutenticated = true;
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      _isAutenticated = false;
      Navigator.pushReplacementNamed(context, "/login");
    }
  }
}
