import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String _name;
  String _phone;

  User(this._name, this._phone);

  String get name => _name;
  String get phone => _phone;

  void updateUser(String name, String phone) {
    _name = name;
    _phone = phone;
    notifyListeners();
  }
}
