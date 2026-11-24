import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const Color cream = Color(0xFFF5EFE6);
  static const Color espresso = Color(0xFF49352A);
  static const Color caramel = Color(0xFFA66B45);
  static const Color gold = Color(0xFFC6A15B);
  static const Color white = Color(0xFFFFFFFF);

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

  final List<Map<String, String>> foods = [
    {
      'name': 'Creamy Spaghetti',
      'category': 'Western',
      'price': 'Rp35.000',
      'description': 'Creamy pasta with special sauce',
      'image':
          'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=700',
    },
    {
      'name': 'Salmon Sushi',
      'category': 'Japanese',
      'price': 'Rp42.000',
      'description': 'Fresh and delicious sushi',
      'image':
          'https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=700',
    },
    {
      'name': 'Beef Burger',
      'category': 'Western',
      'price': 'Rp38.000',
      'description': 'Juicy beef with special sauce',
      'image':
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=700',
    },
    {
      'name': 'Chicken Ramen',
      'category': 'Japanese',
      'price': 'Rp32.000',
      'description': 'Warm ramen with chicken',
      'image':
          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?w=700',
    },
    {
      'name': 'Chicken Rice Bowl',
      'category': 'Rice Bowl',
      'price': 'Rp28.000',
      'description': 'Savory chicken rice bowl',
      'image':
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=700',
    },
    {
      'name': 'Chocolate Cake',
      'category': 'Dessert',
      'price': 'Rp25.000',
      'description': 'Rich and soft chocolate cake',
      'image':
          'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=700',
    },
    {
      'name': 'Iced Coffee',
      'category': 'Drinks',
      'price': 'Rp18.000',
      'description': 'Refreshing creamy coffee',
      'image':
          'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=700',
    },
    {
      'name': 'Fresh Orange Juice',
      'category': 'Drinks',
      'price': 'Rp15.000',
      'description': 'Fresh orange drink',
      'image':
          'https://images.unsplash.com/photo-1600271886742-f049cd451bba?w=700',
    },
  ];

  void showFoodMessage(String foodName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$foodName dipilih'),
        backgroundColor: espresso,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Widget buildFoodImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: const Color(0xFFE9DED2),
          child: const Center(
            child: Icon(Icons.restaurant, color: caramel, size: 45),
          ),
        );
      },
    );
  }

  Widget buildSectionTitle(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: espresso,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(color: caramel, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCategoryList() {
    return SizedBox(
      height: 43,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
              decoration: BoxDecoration(
                color: isSelected ? espresso : white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: isSelected ? espresso : const Color(0xFFE4D8CC),
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? white : espresso,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildFoodCard(Map<String, String> food) {
    return GestureDetector(
      onTap: () => showFoodMessage(food['name']!),
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: espresso.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 5),
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
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    buildFoodImage(food['image']!),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: white.withValues(alpha: 0.95),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: caramel,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 10, 11, 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food['name']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: espresso,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      food['description']!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: espresso.withValues(alpha: 0.55),
                        fontSize: 10,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            food['price']!,
                            style: const TextStyle(
                              color: caramel,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Icon(Icons.add_circle, color: gold, size: 22),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredFoods = foods.where((food) {
      final matchesCategory =
          selectedCategory == 'All' || food['category'] == selectedCategory;

      final matchesSearch = food['name']!.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );

      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SAVORE',
                        style: TextStyle(
                          color: espresso,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),
                      Text(
                        'GOOD FOOD, GOOD MOOD.',
                        style: TextStyle(
                          color: caramel,
                          fontSize: 9,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_outlined,
                      color: espresso,
                      size: 23,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // GREETING
              const Text(
                'A little taste of happiness.',
                style: TextStyle(
                  color: espresso,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                'Discover delicious moments with SAVORE.',
                style: TextStyle(
                  color: espresso.withValues(alpha: 0.65),
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 19),

              // SEARCH
              Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search your favorite food...',
                    hintStyle: TextStyle(
                      color: espresso.withValues(alpha: 0.4),
                      fontSize: 12,
                    ),
                    prefixIcon: const Icon(Icons.search, color: caramel),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // HERO SECTION
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      buildFoodImage(
                        'https://images.unsplash.com/photo-1547592180-85f173990554?w=1200',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              espresso.withValues(alpha: 0.88),
                              espresso.withValues(alpha: 0.12),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(21),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WELCOME TO SAVORE',
                              style: TextStyle(
                                color: Color(0xFFE9C98B),
                                fontSize: 10,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Taste the joy\nin every bite.',
                              style: TextStyle(
                                color: white,
                                fontSize: 27,
                                height: 1.2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Good food brings people together.',
                              style: TextStyle(color: white, fontSize: 10),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedCategory = 'All';
                                  searchQuery = '';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: gold,
                                foregroundColor: espresso,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 17,
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                ),
                              ),
                              child: const Text(
                                'Explore Menu',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
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

              const SizedBox(height: 30),

              // CATEGORIES
              buildSectionTitle(
                'Explore Categories',
                'Find something delicious for you',
              ),

              const SizedBox(height: 15),

              buildCategoryList(),

              const SizedBox(height: 30),

              // POPULAR MENU
              buildSectionTitle('Popular Menu', 'Our customers’ favorites'),

              const SizedBox(height: 17),

              if (filteredFoods.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const Icon(Icons.search_off, size: 45, color: caramel),
                        const SizedBox(height: 10),
                        Text(
                          'Food not found',
                          style: TextStyle(
                            color: espresso,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Try another food name.',
                          style: TextStyle(
                            color: espresso.withValues(alpha: 0.6),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredFoods.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    return buildFoodCard(filteredFoods[index]);
                  },
                ),

              const SizedBox(height: 30),

              // FOOTER
              Center(
                child: Column(
                  children: [
                    const Text(
                      'SAVORE',
                      style: TextStyle(
                        color: espresso,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Good Food, Good Mood.',
                      style: TextStyle(color: caramel, fontSize: 11),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Made with love for food lovers.',
                      style: TextStyle(
                        color: espresso.withValues(alpha: 0.5),
                        fontSize: 10,
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
}
