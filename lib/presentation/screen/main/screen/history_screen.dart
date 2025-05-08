import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key}); // ← Tambahan penting

  final List<Map<String, dynamic>> riwayatDonasi = const [
    {
      'judul': 'Bantu Wujudkan Pendidikan untuk Anak Pedalaman',
      'tanggal': '8 September 2024',
      'jumlah': 'Rp 500.000',
      'status': 'Berhasil',
      'statusColor': Color(0xFFBDBDBD),
    },
    {
      'judul': 'Ulurkan Tangan untuk Korban Bencana Alam',
      'tanggal': '17 Oktober 2024',
      'jumlah': 'Rp 230.000',
      'status': 'Berhasil',
      'statusColor': Color(0xFFBDBDBD),
    },
    {
      'judul': 'Selamatkan Hidup Bayi Prematur Ini',
      'tanggal': '27 November 2024',
      'jumlah': 'Rp 700.000',
      'status': 'Pending',
      'statusColor': Color(0xFF5D7DCE),
    },
    {
      'judul': 'Donasi Pangan untuk Keluarga Kurang Mampu',
      'tanggal': '5 Januari 2025',
      'jumlah': 'Rp 170.000',
      'status': 'Dibatalkan',
      'statusColor': Colors.red,
    },
    {
      'judul': 'Bersama Bangun Masjid di Daerah Terpencil',
      'tanggal': '26 Maret 2025',
      'jumlah': 'Rp 290.000',
      'status': 'Berhasil',
      'statusColor': Color(0xFFBDBDBD),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF5D7DCE),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: const Center(
              child: Text(
                'Donasi Saya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Riwayat Donasi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Lihat Semua',
                  style: TextStyle(
                    color: Color(0xFF5D7DCE),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: riwayatDonasi.length,
              itemBuilder: (context, index) {
                final donasi = riwayatDonasi[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/post_6.png',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              donasi['judul'],
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${donasi['tanggal']}  ${donasi['jumlah']}',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: (donasi['statusColor'] as Color).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          donasi['status'],
                          style: TextStyle(
                            color: donasi['statusColor'],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.home_outlined, size: 28),
                Icon(Icons.search, size: 28),
                Icon(Icons.add_circle_outline, size: 32),
                Icon(Icons.article_outlined, size: 28, color: Color(0xFF5D7DCE)),
                Icon(Icons.settings_outlined, size: 28),
              ],
            ),
          )
        ],
      ),
    );
  }
}
