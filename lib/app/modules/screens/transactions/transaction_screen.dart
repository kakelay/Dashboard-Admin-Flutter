import 'package:admin_dashboard/app/data/Services/transaction_service.dart';
import 'package:admin_dashboard/app/data/models/transaction_model.dart';
import 'package:admin_dashboard/app/modules/screens/dashboard/components/header.dart';
import 'package:admin_dashboard/responsive.dart';
import 'package:admin_dashboard/app/cores/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final DataService _dataService = DataService();
  List<TransactionModel> _allTransactions = [];
  List<TransactionModel> _filteredTransactions = [];

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

  Widget _buildStatusBadge(String status) {
    return Container(
      width: 80,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: getStatusColor(status).withOpacity(0.1),
        border: Border.all(color: getStatusColor(status)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: getStatusColor(status),
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildMobileView(
    List<TransactionModel> transactions,
    bool isDarkMode,
    Color textColor,
    Color iconColor,
    Color backgroundColor,
    Color shadowColor,
  ) {
    if (transactions.isEmpty) {
      return const Center(
        child: Text(
          "No data found",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final tx = transactions[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: Name + status badge
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      tx.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ),
                  _buildStatusBadge(tx.status),
                ],
              ),
              const SizedBox(height: 12),

              // Date + Time
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: iconColor),
                  const SizedBox(width: 6),
                  Text("${tx.date}  •  ${tx.time}",
                      style: TextStyle(color: iconColor)),
                ],
              ),
              const SizedBox(height: 6),

              // Invoice
              Row(
                children: [
                  Icon(Icons.receipt_long, size: 16, color: iconColor),
                  const SizedBox(width: 6),
                  Text("Invoice: ${tx.invoiceId}",
                      style: TextStyle(color: iconColor)),
                ],
              ),
              const SizedBox(height: 6),

              // Amount
              Row(
                children: [
                  Icon(Icons.attach_money, size: 18, color: iconColor),
                  const SizedBox(width: 4),
                  Text(
                    "\$${tx.amount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // View Details
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      color: isDarkMode ? Colors.blue[300] : Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopView(List<TransactionModel> transactions) {
    if (transactions.isEmpty) {
      return const Center(
        child: Text(
          "No data found",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: constraints.maxWidth, // Use full width of the screen
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                columnSpacing: 24,
                dataRowHeight: 60,
                headingRowHeight: 56,
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
                    DataCell(_buildStatusBadge(tx.status)),
                    DataCell(
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'View Details',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]);
                }),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    final backgroundColor = isDarkMode ? Colors.grey[900]! : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final iconColor = isDarkMode ? Colors.white70 : Colors.grey[700]!;
    final shadowColor = isDarkMode ? Colors.black26 : Colors.black12;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          backgroundColor: backgroundColor,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Header(
                title: "Transactions",
                showProfile: false,
                onSearch: (query) {
                  final filtered = _allTransactions.where((tx) {
                    final lowerQuery = query.toLowerCase();
                    return tx.invoiceId.toLowerCase().contains(lowerQuery) ||
                        tx.name.toLowerCase().contains(lowerQuery) ||
                        tx.date.toLowerCase().contains(lowerQuery);
                  }).toList();

                  setState(() {
                    _filteredTransactions =
                        query.isEmpty ? _allTransactions : filtered;
                  });
                },
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<TransactionModel>>(
        future: _dataService.loadTransactions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No data available"));
          }

          if (_allTransactions.isEmpty) {
            _allTransactions = snapshot.data!;
            _filteredTransactions = _allTransactions;
          }

          final transactions = _filteredTransactions;

          return Responsive(
            mobile: _buildMobileView(
              transactions,
              isDarkMode,
              textColor,
              iconColor,
              backgroundColor,
              shadowColor,
            ),
            desktop: _buildDesktopView(transactions),
          );
        },
      ),
    );
  }
}
