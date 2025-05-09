import 'package:flutter/material.dart';

class CeritaPenggalanganScreen extends StatelessWidget {
  const CeritaPenggalanganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Cerita Penggalangan',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '25 Agustus 2024',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Kepala Pusat Data, Informasi, dan Komunikasi Kebencanaan Badan Nasional Penanggulangan Bencana (BNPB) Abdul Muhari, dalam keterangan tertulisnya, menuturkan bencana banjir bandang ternate, ini bermula dari hujan dengan intensitas tinggi yang mengguyur wilayah Ternate, Minggu (25/8) pukul 03.30 WIT.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Banjir bandang di Kota Ternate, Provinsi Maluku Utara, Minggu (25/8), menewaskan 13 orang warga. Kepala Pusat Data, Informasi, dan Komunikasi Kebencanaan Badan Nasional Penanggulangan Bencana (BNPB) Abdul Muhari, dalam keterangan tertulisnya, menuturkan bencana ini bermula dari hujan dengan intensitas tinggi yang mengguyur wilayah Ternate, Minggu (25/8) pukul 03.30 WIT.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Hal ini, katanya, memicu terjadinya banjir bandang di Kelurahan Rua, Kecamatan Pulau Ternate.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 16),
            Divider(thickness: 8, color: Colors.grey[200]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sebanyak 20 relawan gesit dikerahkan untuk menyalurkan bantuan berupa sembako yang terbagi menjadi 60 paket. Rencananya penyaluran bantuan akan diberikan secara berkala untuk memenuhi kebutuhan darurat lainnya seperti perlengkapan bayi dan kebutuhan perempuan dan lansia.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
            
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Mari terus berikan bantuan dan doa untuk korban bencana agar bisa bangkit dan kembali menjalani aktifitas sehari-hari dengan baik.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                onPressed: () {
                  // Navigate back to donation page
                  Navigator.pop(context);
                },
                child: Text(
                  'Donasi sekarang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}