import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:one_goal/presentation/screen/main/screen/home_screen.dart';

class KonfirmasiPembayaranScreen extends StatelessWidget {
  final int nominal;
  final String metode;
  final String? doa;
  final bool anonim;
  final String imageUrl;

  const KonfirmasiPembayaranScreen({
    Key? key,
    required this.nominal,
    required this.metode,
    this.doa,
    this.anonim = false,
    this.imageUrl = '',
  }) : super(key: key);

  String get formattedDate {
    final now = DateTime.now();
    return DateFormat("dd MMMM yyyy - HH:mm", "id_ID").format(now);
  }

  @override
  Widget build(BuildContext context) {
    final transactionId = '#${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Donasi"),
        backgroundColor: Colors.lightBlue,
        leading: const BackButton(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Terima kasih!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text('Donasimu telah diterima dan akan segera disalurkan'),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow('Tanggal', formattedDate),
                const SizedBox(height: 8),
                _buildRow('Metode pembayaran', metode),
                const SizedBox(height: 8),
                _buildRow('ID donasi', transactionId),
                const SizedBox(height: 8),
                _buildRow('Status', 'Berhasil', valueColor: Colors.blue),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Solidaritas Bantu Korban Banjir Bandang Ternate!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('LEMBAGA SOSIAL ONE GOAL'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Arahkan ke halaman donasi lagi jika ingin
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Donasi lagi'),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          _buildRow('Total donasi', 'Rp${_formatCurrency(nominal)}', isBold: true),
          const SizedBox(height: 8),
          _buildRow('Nominal donasi', 'Rp${_formatCurrency(nominal)}'),
          const SizedBox(height: 8),
          _buildRow('Donasi SalingJaga Dhuafa (opsional)', 'Rp0'),
          const Divider(height: 32),

          // 🔻 Tombol Tutup
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text('Tutup', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                  minimumSize: const Size(double.infinity, 48),
              ),
            
              onPressed: () {
                // Tampilkan SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pembayaran Berhasil!')),
                );

                //  Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HomeScreen()),
                // );
              },
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false, Color? valueColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  static String _formatCurrency(int amount) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: '', decimalDigits: 0);
    return formatter.format(amount);
  }
}
