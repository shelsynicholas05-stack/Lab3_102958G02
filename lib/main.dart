import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6F4E37)),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

class DrinkItem {
  final String name;
  final String description;
  final double price;
  final String image;

  const DrinkItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

const List<DrinkItem> drinks = [
  DrinkItem(
    name: 'Cappuccino',
    description: 'Espresso with steamed milk and a thick layer of foam.',
    price: 9.50,
    image: 'assets/images/cappuccino.jpg',
  ),
  DrinkItem(
    name: 'Espresso',
    description: 'A strong, rich shot of freshly ground coffee.',
    price: 7.00,
    image: 'assets/images/espresso.jpg',
  ),
  DrinkItem(
    name: 'Caramel Latte',
    description: 'Iced espresso with creamy milk and sweet caramel.',
    price: 11.00,
    image: 'assets/images/caramel_latte.jpg',
  ),
  DrinkItem(
    name: 'Matcha',
    description: 'Premium Japanese green tea whisked with fresh milk.',
    price: 11.50,
    image: 'assets/images/matcha.jpg',
  ),
  DrinkItem(
    name: 'Mocha Latte',
    description: 'Espresso, chocolate and steamed milk in one cup.',
    price: 12.00,
    image: 'assets/images/mocha_latte.jpg',
  ),
];

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.coffee),
            SizedBox(width: 8),
            Text('My Cafe Menu'),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.brown.shade100,
            child: const Column(
              children: [
                Text(
                  'Our Drinks',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Freshly made, just for you',
                  style: TextStyle(color: Colors.brown),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: drinks.length,
              itemBuilder: (context, index) {
                return DrinkCard(item: drinks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DrinkCard extends StatelessWidget {
  final DrinkItem item;

  const DrinkCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.local_cafe, size: 40),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'RM ${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_shopping_cart, color: Colors.brown),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${item.name} added to your order')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
