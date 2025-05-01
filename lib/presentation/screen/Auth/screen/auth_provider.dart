import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _registeredUsername = '';
  String _registeredEmail = '';
  String _registeredPassword = '';
  bool _rememberMe = false;

  String _currentUsername = '';
  String _currentPassword = '';

  String get username => _currentUsername;
  String get email => _registeredEmail;
  String get password => _currentPassword;
  bool get rememberMe => _rememberMe;

  void setUsername(String username) {
    _currentUsername = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _currentPassword = password;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  bool login() {
    if (_currentUsername == "admin" && _currentPassword == "password") {
      return true;
    }
    
    if (_currentUsername == _registeredUsername && _currentPassword == _registeredPassword) {
      return true;
    }

    return false;
  }

  void signUp({
    required String username,
    required String email,
    required String password,
  }) {
    _registeredUsername = username;
    _registeredEmail = email;
    _registeredPassword = password;

    notifyListeners();
  }
}
