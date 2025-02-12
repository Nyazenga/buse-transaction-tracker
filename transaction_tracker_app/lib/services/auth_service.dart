// lib/services/auth_service.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static const String baseUrl = 'http://10.1.0.176:3000';
  String? _token;
  String? _errorMessage;

  String? get token => _token;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        _token = responseData['token'];
        _errorMessage = null;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', _token!);
        notifyListeners();
        return true;
      } else {
        _errorMessage = responseData['error'] ?? 'Authentication failed';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'Connection error. Please try again.';
      notifyListeners();
      if (kDebugMode) {
        print('Login error: $e');
      }
      return false;
    }
  }
}