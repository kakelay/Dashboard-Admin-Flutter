import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final List<Map<String, dynamic>> dummyItems = const [
    {
      'id': 1,
      'name': 'ខោអាវ A', // Khmer name for T-shirt A
      'price': 19.99,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch A',
      'category': 'Category 1',
      'condition': 'New',
      'itemsInStock': 50,
      'alertStock': 5,
    },
    {
      'id': 2,
      'name': 'ខោអាវ B', // Khmer name for T-shirt B
      'price': 29.99,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch B',
      'category': 'Category 2',
      'condition': 'Seconds Hand',
      'itemsInStock': 10,
      'alertStock': 3,
    },
    {
      'id': 3,
      'name': 'ខោអាវ C', // Khmer name for T-shirt C
      'price': 9.99,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch C',
      'category': 'Category 3',
      'condition': 'New',
      'itemsInStock': 0,
      'alertStock': 1,
    },
    {
      'id': 4,
      'name': 'ខោអាវ D',
      'price': 15.99,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch A',
      'category': 'Category 1',
      'condition': 'New',
      'itemsInStock': 100,
      'alertStock': 10,
    },
    {
      'id': 5,
      'name': 'ខោអាវ E',
      'price': 25.50,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch B',
      'category': 'Category 2',
      'condition': 'Seconds Hand',
      'itemsInStock': 25,
      'alertStock': 5,
    },
    {
      'id': 6,
      'name': 'ខោអាវ F',
      'price': 35.00,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch C',
      'category': 'Category 3',
      'condition': 'New',
      'itemsInStock': 70,
      'alertStock': 8,
    },
    {
      'id': 7,
      'name': 'ខោអាវ G',
      'price': 22.75,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch A',
      'category': 'Category 4',
      'condition': 'New',
      'itemsInStock': 120,
      'alertStock': 12,
    },
    {
      'id': 8,
      'name': 'ខោអាវ H',
      'price': 19.49,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch B',
      'category': 'Category 1',
      'condition': 'Seconds Hand',
      'itemsInStock': 15,
      'alertStock': 3,
    },
    {
      'id': 9,
      'name': 'ខោអាវ I',
      'price': 18.99,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch C',
      'category': 'Category 2',
      'condition': 'New',
      'itemsInStock': 30,
      'alertStock': 6,
    },
    {
      'id': 10,
      'name': 'ខោអាវ J',
      'price': 29.99,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch A',
      'category': 'Category 3',
      'condition': 'New',
      'itemsInStock': 40,
      'alertStock': 8,
    },
    {
      'id': 11,
      'name': 'ខោអាវ K',
      'price': 39.99,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch B',
      'category': 'Category 4',
      'condition': 'Seconds Hand',
      'itemsInStock': 55,
      'alertStock': 9,
    },
    {
      'id': 12,
      'name': 'ខោអាវ L',
      'price': 16.99,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch C',
      'category': 'Category 1',
      'condition': 'New',
      'itemsInStock': 60,
      'alertStock': 7,
    },
    {
      'id': 13,
      'name': 'ខោអាវ M',
      'price': 26.75,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch A',
      'category': 'Category 2',
      'condition': 'Seconds Hand',
      'itemsInStock': 45,
      'alertStock': 10,
    },
    {
      'id': 14,
      'name': 'ខោអាវ N',
      'price': 14.50,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch B',
      'category': 'Category 3',
      'condition': 'New',
      'itemsInStock': 35,
      'alertStock': 5,
    },
    {
      'id': 15,
      'name': 'ខោអាវ O',
      'price': 22.99,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch C',
      'category': 'Category 4',
      'condition': 'New',
      'itemsInStock': 80,
      'alertStock': 15,
    },
    {
      'id': 16,
      'name': 'ខោអាវ P',
      'price': 28.50,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch A',
      'category': 'Category 1',
      'condition': 'Seconds Hand',
      'itemsInStock': 60,
      'alertStock': 12,
    },
    {
      'id': 17,
      'name': 'ខោអាវ Q',
      'price': 33.99,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch B',
      'category': 'Category 2',
      'condition': 'New',
      'itemsInStock': 100,
      'alertStock': 8,
    },
    {
      'id': 18,
      'name': 'ខោអាវ R',
      'price': 18.25,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch C',
      'category': 'Category 3',
      'condition': 'New',
      'itemsInStock': 55,
      'alertStock': 7,
    },
    {
      'id': 19,
      'name': 'ខោអាវ S',
      'price': 21.00,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch A',
      'category': 'Category 4',
      'condition': 'Seconds Hand',
      'itemsInStock': 65,
      'alertStock': 9,
    },
    {
      'id': 20,
      'name': 'ខោអាវ T',
      'price': 24.75,
      'imageUrl':
          'https://i.ebayimg.com/images/g/5GsAAOSwv-5kC6ru/s-l1600.webp',
      'branch': 'Branch B',
      'category': 'Category 1',
      'condition': 'New',
      'itemsInStock': 30,
      'alertStock': 5,
    },
  ];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _conditionController = TextEditingController();
  final TextEditingController _itemsInStockController = TextEditingController();
  final TextEditingController _alertStockController = TextEditingController();

  void _editProduct(BuildContext context, Map<String, dynamic> product) {
    _nameController.text = product['name'];
    _priceController.text = product['price'].toString();
    _imageUrlController.text = product['imageUrl'];
    _branchController.text = product['branch'];
    _categoryController.text = product['category'];
    _conditionController.text = product['condition'];
    _itemsInStockController.text = product['itemsInStock'].toString();
    _alertStockController.text = product['alertStock'].toString();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit ${product['name']}'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _branchController,
                decoration: const InputDecoration(labelText: 'Branch'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a branch name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _conditionController,
                decoration: const InputDecoration(
                    labelText: 'Condition (New/Seconds Hand)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a condition';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _itemsInStockController,
                decoration: const InputDecoration(labelText: 'Items In Stock'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of items in stock';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alertStockController,
                decoration:
                    const InputDecoration(labelText: 'Alert Stock Level'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the alert stock level';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // TODO: Handle edit logic
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${_nameController.text} updated!')),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _deleteProduct(BuildContext context, Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Delete Product'),
        content: Text('Are you sure you want to delete ${product['name']}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // TODO: Handle delete logic
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product['name']} deleted!')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _addNewProduct(BuildContext context) {
    _nameController.clear();
    _priceController.clear();
    _imageUrlController.clear();
    _branchController.clear();
    _categoryController.clear();
    _conditionController.clear();
    _itemsInStockController.clear();
    _alertStockController.clear();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add New Product'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _branchController,
                decoration: const InputDecoration(labelText: 'Branch'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a branch name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _conditionController,
                decoration: const InputDecoration(
                    labelText: 'Condition (New/Seconds Hand)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a condition';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _itemsInStockController,
                decoration: const InputDecoration(labelText: 'Items In Stock'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of items in stock';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alertStockController,
                decoration:
                    const InputDecoration(labelText: 'Alert Stock Level'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the alert stock level';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // TODO: Handle add new product logic
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('New product added!')),
                );
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Store Management'),
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
              contentPadding: const EdgeInsets.all(8),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item['imageUrl'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(item['name']),
              subtitle: Text('\$${item['price'].toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => _editProduct(context, item),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteProduct(context, item),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Add Products"),
        onPressed: () => _addNewProduct(context),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
