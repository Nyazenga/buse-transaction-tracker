// lib/models/transaction.dart
class Transaction {
  final int id;
  final double amount;
  final String description;
  final DateTime date;

  Transaction({
    required this.id,
    required this.amount,
    required this.description,
    required this.date,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      amount: double.parse(json['amount'].toString()),
      description: json['description'],
      date: DateTime.parse(json['date']),
    );
  }
}