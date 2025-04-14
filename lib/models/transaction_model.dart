// models/transaction_model.dart

class TransactionModel {
  final String name;
  final String date;
  final String time;
  final String invoiceId;
  final double amount;
  final String status;

  TransactionModel({
    required this.name,
    required this.date,
    required this.time,
    required this.invoiceId,
    required this.amount,
    required this.status,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      name: json['name'],
      date: json['date'],
      time: json['time'],
      invoiceId: json['invoiceId'],
      amount: json['amount'].toDouble(),
      status: json['status'],
    );
  }
}
