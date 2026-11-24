
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color cream = Color(0xFFF5EFE6);
  static const Color brown = Color(0xFF49352A);
  static const Color caramel = Color(0xFFA66B45);
  static const Color gold = Color(0xFFC6A15B);

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: brown,
        ),
      ),
    );
  }

  Widget infoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: cream,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: caramel, size: 23),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cuisineItem(IconData icon, String name) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: caramel, size: 30),
          const SizedBox(height: 9),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: brown,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Restaurant Profile',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: brown,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Kenali lebih dekat restoran SAVORE',
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),

              const SizedBox(height: 22),

              // RESTAURANT IDENTITY
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: brown,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                        color: cream,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.restaurant_menu,
                        size: 48,
                        color: caramel,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'SAVORE',
                      style: TextStyle(
                        color: cream,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 7),
                    const Text(
                      'Good Food, Good Mood.',
                      style: TextStyle(
                        color: gold,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Nikmati berbagai pilihan hidangan lezat '
                      'dengan cita rasa yang istimewa dalam satu tempat.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: cream,
                        fontSize: 13,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ABOUT RESTAURANT
              sectionTitle('Tentang Restoran'),
              const Text(
                'SAVORE merupakan restoran dengan konsep modern '
                'yang menghadirkan beragam pilihan makanan dan '
                'minuman. Mulai dari hidangan Western, Japanese, '
                'hingga makanan favorit lainnya untuk menemani '
                'setiap momen bersantap.',
                style: TextStyle(
                  color: brown,
                  fontSize: 14,
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 28),

              // CUISINE
              sectionTitle('Pilihan Hidangan'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    cuisineItem(Icons.dinner_dining, 'Western'),
                    const SizedBox(width: 12),
                    cuisineItem(Icons.ramen_dining, 'Japanese'),
                    const SizedBox(width: 12),
                    cuisineItem(Icons.rice_bowl, 'Rice Bowl'),
                    const SizedBox(width: 12),
                    cuisineItem(Icons.cake, 'Dessert'),
                    const SizedBox(width: 12),
                    cuisineItem(Icons.local_cafe, 'Drinks'),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // RESTAURANT INFORMATION
              sectionTitle('Informasi Restoran'),
              infoCard(
                icon: Icons.location_on_outlined,
                title: 'Lokasi',
                value: 'Tambahkan alamat restoran SAVORE',
              ),
              infoCard(
                icon: Icons.access_time,
                title: 'Jam Operasional',
                value: 'Tambahkan jam operasional restoran',
              ),
              infoCard(
                icon: Icons.phone_outlined,
                title: 'Kontak',
                value: 'Tambahkan nomor telepon restoran',
              ),
              infoCard(
                icon: Icons.email_outlined,
                title: 'Email',
                value: 'Tambahkan email restoran',
              ),

              const SizedBox(height: 28),

              // FACILITIES
              sectionTitle('Fasilitas'),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  children: [
                    facilityItem(
                      icon: Icons.restaurant,
                      title: 'Dine In',
                      subtitle: 'Nikmati hidangan langsung di restoran',
                    ),
                    Divider(height: 25),
                    facilityItem(
                      icon: Icons.shopping_bag_outlined,
                      title: 'Take Away',
                      subtitle: 'Pesan makanan untuk dibawa pulang',
                    ),
                    Divider(height: 25),
                    facilityItem(
                      icon: Icons.qr_code_scanner,
                      title: 'QR Code Ordering',
                      subtitle: 'Pesan menu dengan mudah melalui aplikasi',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // FOOTER
              Center(
                child: Column(
                  children: [
                    const Text(
                      'SAVORE',
                      style: TextStyle(
                        color: brown,
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Good Food, Good Mood.',
                      style: TextStyle(
                        color: caramel,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '© ${DateTime.now().year} SAVORE Restaurant',
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class facilityItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const facilityItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 2),
        Icon(icon, color: Color(0xFFA66B45), size: 25),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF49352A),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
