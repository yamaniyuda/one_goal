import 'package:flutter/material.dart';

class PencairanDanaScreen extends StatelessWidget {
  const PencairanDanaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencairan Dana (3)'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _summaryDana(context),
            const SizedBox(height: 16),
            _itemDana(
              tanggal: '03 Juni 2025',
              jumlah: 'Rp32.239.900',
              deskripsi:
                  'Dana ini akan dipergunakan untuk sedekah pangan senilai Rp 21.286.283 serta biaya operasional lembaga senilai Rp 10.953.617 Sehingga pengajuan sejumlah Rp 32.239.900',
            ),
            _itemDana(
              tanggal: '16 April 2025',
              jumlah: 'Rp29.581.538',
              deskripsi:
                  'Dana ini akan digunakan untuk sedekah pangan senilai Rp. 29.580.738, serta biaya adm bank (mandiri) senilai Rp. 800',
            ),
            _itemDana(
              tanggal: '12 Maret 2025',
              jumlah: 'Rp25.000.800',
              deskripsi:
                  'Dana ini akan digunakan untuk pembelian hadiah lebaran untuk warga terdampak banjir senilai Rp. 25.000.000 serta biaya adm bank Rp. 800',
            ),
          ],
        ),
      ),
    );
  }

 Widget _summaryDana(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rp161.447.582',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Dana sudah dicairkan'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('3 kali',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('Pencairan dana'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Divider(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              builder: (context) => const InformasiPenggunaanDanaSheet(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'lihat informasi penggunaan dana',
              style: TextStyle(
                fontSize: 14,
                color: Colors.lightBlue[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget _itemDana({
    required String tanggal,
    required String jumlah,
    required String deskripsi,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text(
          'LEMBAGA SOSIAL ONE GOAL',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          tanggal,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Text(
          'Pencairan Dana $jumlah',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          'Ke rekening Mandiri *** **** **** **** 1113 a/n LEMBAGA SOSIAL ONE GOAL',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(height: 4),
        Text(deskripsi, style: const TextStyle(fontSize: 13)),
        const SizedBox(height: 12),
      ],
    );
  }
}

class InformasiPenggunaanDanaSheet extends StatelessWidget {
  const InformasiPenggunaanDanaSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.95,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const Text(
                  'Informasi Penggunaan Dana',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Column(
                    children: const [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sudah dicairkan'),
                          Text('Rp161.468.752'),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Belum dicairkan'),
                          Text('Rp55.734.154'),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text('Data diperbarui setiap 15 menit. Terakhir diperbarui pada 30 Jun 2025 – 18:17 WIB',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Total transaksi sampai saat ini', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Jumlah donasi'), Text('10.085 transaksi'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Jumlah donatur'), Text('6.598 donatur'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Dana terkumpul'), Text('Rp235.597.819'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Rincian dana terkumpul', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Biaya Transaksi dan Teknologi'), Text('Rp6.618.773'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Donasi Operasional Kitabisa'), Text('Rp11.776.140'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Dana dapat dicairkan'), Text('Rp217.121.368'),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  color: Colors.orange[50],
                  child: const Text(
                    '* Dana dapat dicairkan dan dikelola oleh penggalang dana.\n'
                    '** Biaya ini 100% dibayarkan ke penyedia layanan.\n'
                    '*** Maksimal 5% untuk operasional Yayasan.',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 20),
               Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text(
                  'Tutup',
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
      },
    );
  }
}

