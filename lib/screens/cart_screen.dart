
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  static const Color cream = Color(0xFFF5EFE6);
  static const Color espresso = Color(0xFF49352A);
  static const Color caramel = Color(0xFFA66B45);

  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Creamy Spaghetti',
      'price': 45000,
      'image':
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=500',
      'quantity': 1,
    },
    {
      'name': 'Salmon Sushi',
      'price': 55000,
      'image':
          'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=500',
      'quantity': 2,
    },
  ];

  int get total {
    int result = 0;
    for (var item in cartItems) {
      result += (item['price'] as int) * (item['quantity'] as int);
    }
    return result;
  }

  String formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }

  void changeQuantity(int index, int amount) {
    setState(() {
      cartItems[index]['quantity'] += amount;

      if (cartItems[index]['quantity'] <= 0) {
        cartItems.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Cart',
                style: TextStyle(
                  color: espresso,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Your delicious choices are here.',
                style: TextStyle(color: Colors.brown),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: cartItems.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              size: 75,
                              color: caramel,
                            ),
                            SizedBox(height: 15),
                            Text(
                              'Your cart is empty',
                              style: TextStyle(
                                color: espresso,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Let’s find something delicious!',
                              style: TextStyle(color: Colors.brown),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];

                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    item['image'],
                                    width: 85,
                                    height: 85,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stack) {
                                      return Container(
                                        width: 85,
                                        height: 85,
                                        color: cream,
                                        child: const Icon(
                                          Icons.restaurant,
                                          color: caramel,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 13),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name'],
                                        style: const TextStyle(
                                          color: espresso,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 7),
                                      Text(
                                        formatPrice(item['price']),
                                        style: const TextStyle(
                                          color: caramel,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          quantityButton(
                                            Icons.remove,
                                            () => changeQuantity(index, -1),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            child: Text(
                                              '${item['quantity']}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          quantityButton(
                                            Icons.add,
                                            () => changeQuantity(index, 1),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Subtotal',
                          style: TextStyle(color: espresso),
                        ),
                        Text(
                          formatPrice(total),
                          style: const TextStyle(
                            color: espresso,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            color: espresso,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          formatPrice(total),
                          style: const TextStyle(
                            color: caramel,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: cartItems.isEmpty
                            ? null
                            : () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Checkout berhasil disimulasikan!',
                                    ),
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: espresso,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quantityButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: cream,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: espresso),
      ),
    );
  }
}
