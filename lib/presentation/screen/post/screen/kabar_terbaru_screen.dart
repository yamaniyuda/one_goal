import 'package:flutter/material.dart';

class KabarTerbaruScreen extends StatelessWidget {
  const KabarTerbaruScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> news = [
      {
        'tanggal': '22 April 2025',
        'judul': 'Hallo #Orang Baik',
        'isi': 'Terima kasih kepada para lebih dari 18 ribu donatur yang telah memberikan bantuan di program ini.'
      },
      {
        'tanggal': '26 Desember 2024',
        'judul': 'Hallo #Orang Baik',
        'isi': 'Terima kasih kepada para lebih dari 13 ribu donatur yang telah memberikan bantuan di program ini.'
      },
      {
        'tanggal': '21 November 2024',
        'judul': 'Hai #OrangBaik',
        'isi': 'Semoga #OrangBaik selalu dalam keadaan sehat dimanapun berada.'
      },
      {
        'tanggal': '05 September 2024',
        'judul': 'Hai #OrangBaik',
        'isi': '',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kabar Terbaru (4)'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ListView.builder(
        itemCount: news.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final item = news[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.account_circle, size: 24),
                    SizedBox(width: 8),
                    Text('LEMBAGA SOSIAL ONE GOAL', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(item['tanggal']!, style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 8),
                Text(item['judul']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text.rich(
                  TextSpan(children: [
                    const TextSpan(text: 'Terima kasih ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: item['isi']),
                  ]),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    showDetailKabarTerbaru(context);
                  },
                  child: Text('Selengkapnya', style: TextStyle(color: Colors.blue)) // isi kartu kabar terbaru
                )

               
              ],
            ),
          );
        },
      ),
    );
  }
}


void showDetailKabarTerbaru(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.95,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, controller) => SingleChildScrollView(
        controller: controller,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(Icons.horizontal_rule, size: 30, color: Colors.grey),
            ),
            Row(
              children: [
                const Icon(Icons.account_circle),
                const SizedBox(width: 8),
                const Text('LEMBAGA SOSIAL ONE GOAL', style: TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text('21 November 2024', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Hai #OrangBaik',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Semoga #OrangBaik selalu dalam keadaan sehat dimanapun berada. '
              'Terima kasih telah memberikan bantuan di program #BisaBangkit ini.',
              style: TextStyle(height: 1.5),
            ),
            const SizedBox(height: 12),
            const Text(
              'Bantuan darimu telah kami salurkan kepada 28 orang korban banjir dalam bentuk '
              'sembako, makanan siap saji, buah, dan pampers. Bantuan diberikan di Desa Rua, '
              'Kota Ternate, Maluku Utara. Kegiatan dilaksanakan pada 19 Oktober 2024 dengan '
              'menggunakan dana sebesar Rp 22.002.500.',
              style: TextStyle(height: 1.5),
            ),
            const SizedBox(height: 12),
            const Text(
              'Terima kasih orang baik dan mitra implementasi ini.\n\n'
              'Tak lupa kami mewakili keluarga dari para penerima manfaat ingin mengucapkan '
              'rasa terima kasih yang amat sangat kepada #OrangBaik semua. Semoga kebaikannya '
              'dibalas berlipat-lipat oleh Allah SWT dan semoga menjadi pahala jariyah, aamiin.\n\n'
              'Salam hangat dan penuh cinta untuk semua.\n\nHormat kami,\nSalam Setara',
              style: TextStyle(height: 1.5),
            ),
            const SizedBox(height: 16),
            
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                  
                ),
                child: const Text('Tutup', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

