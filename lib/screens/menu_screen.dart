
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  static const Color cream = Color(0xFFF5EFE6);
  static const Color espresso = Color(0xFF49352A);
  static const Color caramel = Color(0xFFA66B45);
  static const Color gold = Color(0xFFC6A15B);

  String selectedCategory = 'All';
  String searchQuery = '';

  final List<String> categories = [
    'All',
    'Western',
    'Japanese',
    'Rice Bowl',
    'Dessert',
    'Drinks',
  ];

  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Creamy Spaghetti',
      'category': 'Western',
      'price': 35000,
      'description': 'Creamy pasta with special sauce',
      'image': 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=700',
    },
    {
      'name': 'Beef Burger',
      'category': 'Western',
      'price': 38000,
      'description': 'Juicy beef with fresh vegetables',
      'image': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=700',
    },
    {
      'name': 'Pepperoni Pizza',
      'category': 'Western',
      'price': 45000,
      'description': 'Classic pizza with cheese',
      'image': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=700',
    },
    {
      'name': 'Salmon Sushi',
      'category': 'Japanese',
      'price': 42000,
      'description': 'Fresh and delicious sushi',
      'image': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=700',
    },
    {
      'name': 'Chicken Ramen',
      'category': 'Japanese',
      'price': 32000,
      'description': 'Warm ramen with chicken',
      'image': 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=700',
    },
    {
      'name': 'Chicken Rice Bowl',
      'category': 'Rice Bowl',
      'price': 28000,
      'description': 'Rice bowl with savory chicken',
      'image': 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=700',
    },
    {
      'name': 'Beef Teriyaki Bowl',
      'category': 'Rice Bowl',
      'price': 35000,
      'description': 'Beef with sweet teriyaki sauce',
      'image': 'https://images.unsplash.com/photo-1512058564366-18510be2db19?w=700',
    },
    {
      'name': 'Chocolate Cake',
      'category': 'Dessert',
      'price': 25000,
      'description': 'Rich and soft chocolate cake',
      'image': 'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=700',
    },
    {
      'name': 'Strawberry Pancake',
      'category': 'Dessert',
      'price': 27000,
      'description': 'Sweet pancake with strawberries',
      'image': 'https://images.unsplash.com/photo-1528207776546-365bb710ee93?w=700',
    },
    {
      'name': 'Iced Coffee',
      'category': 'Drinks',
      'price': 18000,
      'description': 'Refreshing creamy coffee',
      'image': 'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=700',
    },
    {
      'name': 'Orange Juice',
      'category': 'Drinks',
      'price': 15000,
      'description': 'Fresh orange drink',
      'image': 'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=700',
    },
  ];

  String formatPrice(int price) {
    return 'Rp${price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }

  void showMessage(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name dipilih'),
        backgroundColor: espresso,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = menuItems.where((item) {
      final matchesCategory = selectedCategory == 'All' ||
          item['category'] == selectedCategory;

      final matchesSearch = item['name']
          .toString()
          .toLowerCase()
          .contains(searchQuery.toLowerCase());

      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              const Text(
                'Our Menu',
                style: TextStyle(
                  color: espresso,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Explore delicious food made with love.',
                style: TextStyle(
                  color: espresso.withValues(alpha: 0.65),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 23),

              // SEARCH
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Search menu...',
                    prefixIcon: Icon(
                      Icons.search,
                      color: caramel,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // CATEGORY
              const Text(
                'Categories',
                style: TextStyle(
                  color: espresso,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                height: 43,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 9),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = selectedCategory == category;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 17,
                          vertical: 11,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? espresso
                              : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : espresso,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 25),

              // MENU COUNT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Delicious Food',
                    style: TextStyle(
                      color: espresso,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${filteredItems.length} items',
                    style: const TextStyle(
                      color: caramel,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 17),

              // MENU GRID
              if (filteredItems.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      'Menu not found.',
                      style: TextStyle(color: espresso),
                    ),
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredItems.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: espresso.withValues(alpha: 0.06),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(18),
                              ),
                              child: Image.network(
                                item['image'],
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: const Color(0xFFE9DED2),
                                    child: const Center(
                                      child: Icon(
                                        Icons.restaurant,
                                        color: caramel,
                                        size: 40,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(11),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: espresso,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    item['description'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: espresso.withValues(alpha: 0.55),
                                      fontSize: 10,
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          formatPrice(item['price']),
                                          style: const TextStyle(
                                            color: caramel,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showMessage(item['name']);
                                        },
                                        child: const Icon(
                                          Icons.add_circle,
                                          color: gold,
                                          size: 23,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
