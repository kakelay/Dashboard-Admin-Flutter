// main.dart

import 'package:admin_dashboard/Services/data_service.dart';
import 'package:admin_dashboard/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  final DataService _dataService = DataService();

  TransactionScreen({super.key});

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'success':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: FutureBuilder<List<TransactionModel>>(
        future: _dataService.loadTransactions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No data available"));
          }

          final transactions = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('SL')),
                DataColumn(label: Text('Name/Business')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Time')),
                DataColumn(label: Text('Invoice ID')),
                DataColumn(label: Text('Amount')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Actions')),
              ],
              rows: List.generate(transactions.length, (index) {
                final tx = transactions[index];
                return DataRow(cells: [
                  DataCell(Text((index + 1).toString().padLeft(2, '0'))),
                  DataCell(Text(tx.name)),
                  DataCell(Text(tx.date)),
                  DataCell(Text(tx.time)),
                  DataCell(Text(tx.invoiceId)),
                  DataCell(Text("\$${tx.amount.toStringAsFixed(2)}")),
                  DataCell(Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: getStatusColor(tx.status).withOpacity(0.1),
                      border: Border.all(color: getStatusColor(tx.status)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      tx.status,
                      style: TextStyle(color: getStatusColor(tx.status)),
                    ),
                  )),
                  const DataCell(
                    Text(
                      'View Details',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ]);
              }),
            ),
          );
        },
      ),
    );
  }
}
