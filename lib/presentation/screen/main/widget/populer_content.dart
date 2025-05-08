import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_goal/presentation/widget/card/card_bg_image.dart';
import 'package:one_goal/presentation/screen/main/widget/GalangDanaPage.dart';

class PopulerContent extends StatefulWidget {
  const PopulerContent({super.key});

  @override
  State<PopulerContent> createState() => _PopulerContentState();
}

class _PopulerContentState extends State<PopulerContent> {
  final List<Map<String, dynamic>> popularItems = [
    {
      'imagePath': 'assets/1.jpg',
      'percentage': 0.5,
      'time': '2 Hari yang lalu',
      'title': 'Bantu Pembangunan Sekolah',
    },
    {
      'imagePath': 'assets/2.jpg',
      'percentage': 0.7,
      'time': '1 Jam yang lalu',
      'title': 'Donasi untuk Korban Bencana',
    },
    {
      'imagePath': 'assets/3.jpg',
      'percentage': 0.25,
      'time': '5 Jam yang lalu',
      'title': 'Sahur dan Buka untuk Dhuafa',
    },
    {
      'imagePath': 'assets/4.jpg',
      'percentage': 0.9,
      'time': '1 Hari yang lalu',
      'title': 'Dukung UMKM Lokal Bangkit',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Populer 🔥',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 20),
                ...popularItems.map((item) {
                  return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GalangDanaPage(
                        imageUrl: item['imagePath'],
                        title: item['title'],
                    
                  ),
                      ),
                    );
                  },
                  child : Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            CardBgImage(
                              image: AssetImage(item['imagePath']),
                              width: 250,
                              height: 280,
                            ),
                            // Progress bar di bawah gambar
                            Positioned(
                              left: 12,
                              right: 12,
                              bottom: 16,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: item['percentage'],
                                  minHeight: 6,
                                  backgroundColor: Colors.white30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['time'],
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          item['title'],
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
