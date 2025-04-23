// services/data_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/transaction_model.dart';

class DataService {
  Future<List<TransactionModel>> loadTransactions() async {
    try {
      final data = await rootBundle
          .loadString('assets/jsons/transaction_sample_data.json');
      final jsonResult = json.decode(data);
      print("Loaded JSON: $jsonResult");

      List transactions = jsonResult['transactions'];
      print("Parsed List: $transactions");

      return transactions
          .map((item) => TransactionModel.fromJson(item))
          .toList();
    } catch (e) {
      print("Error loading transactions: $e");
      return [];
    }
  }
}
