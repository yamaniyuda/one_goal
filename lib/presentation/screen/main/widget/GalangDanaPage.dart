import 'package:flutter/material.dart';
import  'package:one_goal/presentation/screen/main/widget/CeritaPenggalanganPage.dart';
import 'package:one_goal/presentation/screen/main/widget/ListDonaturDana.dart';

class GalangDanaPage extends StatelessWidget {
	final String imageUrl;
  	final String title;
	
  const GalangDanaPage({
	super.key,
	required this.imageUrl,
    required this.title,
	
	});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Gambar Header
          Stack(
            children: [
              Image.asset(
                imageUrl, // Ganti dengan path gambar kamu
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
             Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              
            ],
          ),

          // Konten
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Rp171.277.788',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(' dari Rp250.000.000'),
                      ],
                    ),
                    SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 171277788 / 250000000,
                      color: Colors.blue,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _infoTile('7.844', 'Donasi'),
                        _infoTile('10', 'Kabar Terbaru'),
                        _infoTile('4 kali', 'Pencairan Dana'),
                      ],
                    ),
                    SizedBox(height: 16),
                    _informasiPenggalanganDana(),
                    SizedBox(height: 16),
                    
                   GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CeritaPenggalanganPage(),
                          ),
                        );
                      },
                      child: _sectionWithArrow('Cerita Penggalangan Dana', true),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '18 Januari 2025',
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Enam kabupaten/kota di Provinsi Lampung terdampak banjir pada Jumat (17/1/2025). Berdasarkan data yang dihimpun dari Badan Penanggulangan Bencana Daerah (BPBD) Provinsi Lampung, enam kabupaten kota itu adalah Lampung Tengah dengan 2 titik banjir, Lampung Timur 6 titik banjir, Pesawaran 2 titik banjir, Lampung Selatan 4 titik banjir, dan Pesisir Barat 2 titik banjir, dan Kota Bandar Lampung.',
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                    
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CeritaPenggalanganPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Baca Selengkapnya',
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(height: 1, color: Colors.grey[300]),
                    SizedBox(height: 20),
                    
                    // Kabar Terbaru
                    Row(
                      children: [
                        Text(
                          'Kabar Terbaru',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            '10',
                            style: TextStyle(
                              fontSize: 14, 
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Terakhir update • 16 April 2025',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Divider(height: 1, color: Colors.grey[300]),
                    SizedBox(height: 20),
                    
                    // Pencairan Dana
                    Row(
                      children: [
                        Text(
                          'Pencairan Dana',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            '4',
                            style: TextStyle(
                              fontSize: 14, 
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Terakhir pencairan dana • 16 April 2025',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Divider(height: 1, color: Colors.grey[300]),
                    SizedBox(height: 20),
                    
                    
                    
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ListDonaturDana(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'Donasi',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              '7.844',
                              style: TextStyle(
                                fontSize: 14, 
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    // Donor list
                    _donorCard(
                      'Orang Baik', 
                      'Rp25.000', 
                      '35 menit'
                    ),
                    SizedBox(height: 8),
                    
                    _donorCard(
                      'Rizky', 
                      'Rp100.000.00', 
                      '2 jam lalu'
                    ),
                    SizedBox(height: 8),
                    
                    _donorCard(
                      'Putra', 
                      'Rp1.000', 
                      '4 jam lalu'
                    ),
                    SizedBox(height: 20),
                    
                    // Donasi Button - this was already in your code but adding padding
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        onPressed: () {
                            _showDonasiBottomSheet(context);
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
            ),
          ),
        ],
      ),
      
    );
  }

  Widget _sectionWithArrow(String title, bool showArrow) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        if (showArrow) Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    );
  }

  Widget _informasiPenggalanganDana() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informasi Penggalangan Dana',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        // Card untuk Penggalang Dana
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue.shade50,
                radius: 20,
                child: Image.asset(
                    'assets/images/logo.png',
                  
                  ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'LEMBAGA SOSIAL One GOAL',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Identitas lembaga terverifikasi',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.verified_outlined, color: Colors.blue),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Card untuk Rincian Penggunaan Dana
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: const [
              Icon(Icons.receipt_long, color: Colors.blue),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Rincian penggunaan dana',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
  Widget _donorCard(String name, String amount, String time) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile picture placeholder
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 20,
            child: Icon(Icons.person, color: Colors.grey[600]),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'Berdonasi sebesar ',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      amount,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _showDonasiBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    isScrollControlled: true,
    builder: (context) {
      final TextEditingController _nominalController = TextEditingController();

      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16,
          left: 16,
          right: 16,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            int selectedAmount = 0;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pilih Nominal Donasi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                fDON(() {
                  setState(() {
                    selectedAmount = 5000;
                    _nominalController.text = selectedAmount.toString();
                  });
                }, '😊', 'Rp5.000'),
                fDON(() {
                  setState(() {
                    selectedAmount = 15000;
                    _nominalController.text = selectedAmount.toString();
                  });
                }, '😄', 'Rp15.000'),
                fDON(() {
                  setState(() {
                    selectedAmount = 25000;
                    _nominalController.text = selectedAmount.toString();
                  });
                }, '😘', 'Rp25.000'),
                fDON(() {
                  setState(() {
                    selectedAmount = 50000;
                    _nominalController.text = selectedAmount.toString();
                  });
                }, '😍', 'Rp50.000'),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nominal Donasi Lainnya',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _nominalController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: 'Rp ',
                    hintText: '0',
                    helperText: 'Min. donasi sebesar Rp1.000',
                  ),
                  onChanged: (value) {
                    selectedAmount = int.tryParse(value) ?? 0;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (selectedAmount >= 1000) {
                      Navigator.pop(context); // close bottom sheet
                      // Proses ke halaman pembayaran selanjutnya
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Lanjut ke pembayaran Rp${selectedAmount}')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Lanjut pembayaran',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      );
    },
  );
}

Widget fDON(VoidCallback onTap, String emoji, String label) {
  return ListTile(
    onTap: onTap,
    leading: Text(emoji, style: TextStyle(fontSize: 24)),
    title: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
  );
}


  Widget _infoTile(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}