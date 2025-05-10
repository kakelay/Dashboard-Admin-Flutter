import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  final List<Map<String, dynamic>> dummyItems = const [
    {'name': 'Product A', 'price': 19.99},
    {'name': 'Product B', 'price': 29.99},
    {'name': 'Product C', 'price': 9.99},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dummyItems.length,
        itemBuilder: (context, index) {
          final item = dummyItems[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.storefront),
              title: Text(item['name']),
              subtitle: Text("\$${item['price'].toStringAsFixed(2)}"),
              trailing: IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  // TODO: Add to cart functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item['name']} added to cart!')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
