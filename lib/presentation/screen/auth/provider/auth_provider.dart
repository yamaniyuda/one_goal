import 'package:flutter/material.dart';
import 'package:one_goal/app/config/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _rememberMe = false;
  String _currentUsername = '';
  String _currentPassword = '';
  
  final Map<String, Map<String, String>> _registeredUsers = {
    'admin': {'email': 'admin@example.com', 'password': 'password'},
  };

  String get username => _currentUsername;
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
    if (_registeredUsers.containsKey(_currentUsername)) {
      final user = _registeredUsers[_currentUsername]!;
      if (user['password'] == _currentPassword) {
        return true;
      }
    }
    if (_rememberMe) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setBool(LOGIN_PERSISTENCE_KEY, true);
      });
    }
    return false;
  }


  void logout() {
    _currentUsername = '';
    _currentPassword = '';
    _rememberMe = false;
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(LOGIN_PERSISTENCE_KEY);
    });
    notifyListeners();
  }


  void signUp({
    required String username,
    required String email,
    required String password,
  }) {
    _registeredUsers[username] = {
      'email': email,
      'password': password,
    };
    if (_rememberMe) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setBool(LOGIN_PERSISTENCE_KEY, true);
      });
    }
    notifyListeners();
  }

  bool isUsernameTaken(String username) {
    return _registeredUsers.containsKey(username);
  }

  String? getEmailForUser(String username) {
    return _registeredUsers[username]?['email'];
  }
}
