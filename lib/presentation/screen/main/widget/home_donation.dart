import 'package:flutter/material.dart';

class DonationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String collectedAmount;
  final double progress;

  const DonationCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.collectedAmount,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Terkumpul $collectedAmount',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Stack(
                    children: [
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: progress,
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Text(
                            '${(progress * 100).toInt()}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonationList extends StatelessWidget {
  const DonationList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> donations = [
      {
        'title': 'Bantuan Banjir Jakarta',
        'description': 'Bantu saudara kita yang terdampak banjir di Jakarta Selatan.',
        'imageUrl': 'assets/post_3.png',
        'amount': 'Rp 1.000.000',
        'progress': 0.5,
      },
      {
        'title': 'Peduli Pendidikan',
        'description': 'Dukung anak-anak kurang mampu agar bisa sekolah.',
        'imageUrl': 'assets/pendidikan.jpg',
        'amount': 'Rp 850.000',
        'progress': 0.34,
      },
      {
        'title': 'Bantu UMKM Bangkit',
        'description': 'Bantu pelaku usaha kecil menengah untuk pulih pasca pandemi.',
        'imageUrl': 'assets/post_4.png',
        'amount': 'Rp 1.200.000',
        'progress': 0.66,
      },
      {
        'title': 'Makanan untuk Dhuafa',
        'description': 'Sumbangkan makanan siap saji untuk kaum dhuafa.',
        'imageUrl': 'assets/post_2.png',
        'amount': 'Rp 400.000',
        'progress': 0.2,
      },
      {
        'title': 'Bantu Korban Gempa',
        'description': 'Donasi untuk korban gempa di wilayah timur Indonesia.',
        'imageUrl': 'assets/post_6.png',
        'amount': 'Rp 2.000.000',
        'progress': 0.75,
      },
    ];

    return SingleChildScrollView(
      child: Column(
        children: donations.map((data) {
          return DonationCard(
            title: data['title'],
            description: data['description'],
            imageUrl: data['imageUrl'],
            collectedAmount: data['amount'],
            progress: data['progress'],
          );
        }).toList(),
      ),
    );
  }
}
