
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const Color cream = Color(0xFFF5EFE6);
  static const Color espresso = Color(0xFF49352A);
  static const Color caramel = Color(0xFFA66B45);
  static const Color gold = Color(0xFFC6A15B);
  static const Color white = Color(0xFFFFFFFF);

  static const List<Map<String, String>> members = [
    {
      'name': 'Amanda Keysa',
      'npm': '5520124003',
      'photo': 'assets/images/amandafotop.jpeg',
    },
    {
      'name': 'Syarifah Nadia',
      'npm': '552014030',
      'photo': 'assets/images/nadiafoto.jpeg',
    },
    {
      'name': 'Muhammad Lintang',
      'npm': '5520124015',
      'photo': 'assets/images/lintangfoto.jpeg',
    },
    {
      'name': 'Tolut',
      'npm': '5520124031',
      'photo': 'assets/images/tolutfoto.jpeg',
    },
  ];

  Widget sectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: espresso,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            color: caramel,
            fontSize: 13,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget featureItem(
    IconData icon,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: gold.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: caramel, size: 25),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: espresso,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: espresso,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget teamCard(Map<String, String> member) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: gold.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: espresso.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: gold, width: 3),
            ),
            child: ClipOval(
              child: Image.asset(
                member['photo']!,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    color: caramel,
                    size: 60,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            member['name']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: espresso,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            member['npm']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: caramel,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget contactItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Icon(icon, color: gold, size: 23),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: gold,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  color: white,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget visionMissionCard(
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: caramel, size: 28),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: espresso,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  description,
                  style: const TextStyle(
                    color: espresso,
                    fontSize: 13,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appFeature(
    IconData icon,
    String title,
    String description,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: caramel, size: 29),
            const SizedBox(height: 9),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: espresso,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 11,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Stack(
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1414235077428-338989a2e8c0',
                    height: 230,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 230,
                        color: espresso,
                      );
                    },
                  ),
                  Container(
                    height: 230,
                    width: double.infinity,
                    color: espresso.withValues(alpha: 0.55),
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ABOUT SAVORE',
                          style: TextStyle(
                            color: white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Good Food, Good Mood.',
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ABOUT SAVORE
                    sectionTitle(
                      'About SAVORE',
                      'Discover our application',
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'SAVORE adalah aplikasi pemesanan makanan '
                      'dan minuman yang dirancang untuk memberikan '
                      'pengalaman memesan makanan secara mudah, '
                      'praktis, dan nyaman melalui perangkat mobile.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: espresso,
                        fontSize: 14,
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // OUR STORY
                    sectionTitle(
                      'Our Story',
                      'The story behind SAVORE',
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'SAVORE dikembangkan sebagai sebuah proyek '
                      'aplikasi restoran yang menghadirkan berbagai '
                      'pilihan makanan dan minuman dalam satu tempat. '
                      'Mulai dari hidangan Western, Japanese, hingga '
                      'berbagai menu favorit lainnya. SAVORE hadir '
                      'untuk memberikan pengalaman memesan makanan '
                      'yang lebih mudah, praktis, dan menyenangkan.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: espresso,
                        fontSize: 14,
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // WHY CHOOSE SAVORE
                    sectionTitle(
                      'Why Choose SAVORE?',
                      'What makes us special',
                    ),
                    const SizedBox(height: 18),
                    featureItem(
                      Icons.restaurant_menu,
                      'Various Menu',
                      'Beragam pilihan makanan dan minuman.',
                    ),
                    featureItem(
                      Icons.shopping_cart_outlined,
                      'Easy Ordering',
                      'Pemesanan makanan lebih mudah dan praktis.',
                    ),
                    featureItem(
                      Icons.favorite_border,
                      'Quality Food',
                      'Mengutamakan kualitas dan kepuasan pelanggan.',
                    ),

                    const SizedBox(height: 20),

                    // MEET OUR TEAM
                    Center(
                      child: sectionTitle(
                        'Meet Our Team',
                        'The people behind SAVORE',
                      ),
                    ),
                    const SizedBox(height: 22),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: members.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 14,
                        mainAxisSpacing: 14,
                        childAspectRatio: 0.78,
                      ),
                      itemBuilder: (context, index) {
                        return teamCard(members[index]);
                      },
                    ),

                    const SizedBox(height: 30),

                    // VISION AND MISSION
                    sectionTitle(
                      'Vision & Mission',
                      'Our goals and commitments',
                    ),
                    const SizedBox(height: 16),

                    visionMissionCard(
                      Icons.visibility_outlined,
                      'Our Vision',
                      'Menjadi aplikasi pemesanan restoran yang '
                      'praktis, modern, dan mudah digunakan oleh '
                      'pelanggan.',
                    ),
                    visionMissionCard(
                      Icons.flag_outlined,
                      'Our Mission',
                      'Menyediakan informasi menu yang jelas, '
                      'mempermudah proses pemesanan, serta '
                      'menghadirkan pengalaman penggunaan aplikasi '
                      'yang nyaman dan efisien.',
                    ),

                    const SizedBox(height: 20),

                    // APP FEATURES
                    sectionTitle(
                      'App Features',
                      'Explore the features of SAVORE',
                    ),
                    const SizedBox(height: 16),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appFeature(
                          Icons.home_outlined,
                          'Home',
                          'Halaman utama aplikasi.',
                        ),
                        const SizedBox(width: 12),
                        appFeature(
                          Icons.restaurant_menu,
                          'Menu',
                          'Pilihan makanan dan minuman.',
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appFeature(
                          Icons.shopping_cart_outlined,
                          'Cart',
                          'Keranjang pesanan.',
                        ),
                        const SizedBox(width: 12),
                        appFeature(
                          Icons.storefront_outlined,
                          'Profile',
                          'Informasi restoran SAVORE.',
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // CONTACT US
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: espresso,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contact Us',
                            style: TextStyle(
                              color: white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 18),
                          contactItem(
                            Icons.email_outlined,
                            'Email',
                            'savore.restaurant@gmail.com',
                          ),
                          const SizedBox(height: 14),
                          contactItem(
                            Icons.location_on_outlined,
                            'Location',
                            'Indonesia',
                          ),
                          const SizedBox(height: 14),
                          contactItem(
                            Icons.restaurant_outlined,
                            'Restaurant',
                            'SAVORE - Good Food, Good Mood',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // FOOTER
                    const Center(
                      child: Column(
                        children: [
                          Text(
                            'SAVORE',
                            style: TextStyle(
                              color: espresso,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Good Food, Good Mood.',
                            style: TextStyle(
                              color: caramel,
                              fontSize: 13,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            '© 2026 SAVORE. All Rights Reserved.',
                            style: TextStyle(
                              color: espresso,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),
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
