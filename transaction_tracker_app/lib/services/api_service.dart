// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction.dart';

class ApiService {
  static const String baseUrl = 'http://10.1.0.176:3000';
  
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<List<Transaction>> getTransactions() async {
    final token = await getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/transactions'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Transaction.fromJson(json)).toList();
    }
    throw Exception('Failed to load transactions');
  }

  Future<bool> addTransaction(
    double amount,
    String description,
    DateTime date,
  ) async {
    final token = await getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/transactions'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'amount': amount,
        'description': description,
        'date': date.toIso8601String(),
      }),
    );

    return response.statusCode == 200;
  }
}