import 'package:flutter/material.dart';

class RincianPenggunaanDanaScreen extends StatelessWidget {
  const RincianPenggunaanDanaScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Rincian Penggunaan Dana',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoBox(
              icon: Icons.access_time,
              title: 'Status Dana Terkumpul',
              description:
                  'Penggalang dana sudah mengumpulkan dana selama 9 bulan 26 hari',
              color: Colors.blue[50],
              textColor: Colors.blue[700],
              titleColor: Colors.blue[800],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildDanaSummaryCard(
                    title: 'Dana terkumpul',
                    amount: 'Rp375.015.379',
                    showPercentage: false,
                    isBoldAmount: true,
                  ),
                  const SizedBox(height: 8),
                  _buildDanaSummaryCard(
                    title: 'Dana untuk penggalangan dana',
                    amount: 'Rp356.268.810',
                    percentage: 0.95,
                  ),
                  const SizedBox(height: 8),
                  _buildDanaSummaryCard(
                    title: 'Biaya transaksi dan teknologi*',
                    amount: 'Rp11.874.047',
                    showPercentage: false,
                  ),
                  const SizedBox(height: 8),
                  _buildDanaSummaryCard(
                    title: 'Sudah dicairkan',
                    amount: 'Rp271.779.548',
                    showPercentage: false,
                  ),
                  const SizedBox(height: 8),
                  _buildDanaSummaryCard(
                    title: 'Belum dicairkan**',
                    amount: 'Rp72.615.215',
                    showPercentage: false,
                    isBoldAmount: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildKeteranganTambahan(),
            const SizedBox(height: 20),
            Text(
              'Data diperbarui setiap 15 menit. Terakhir diperbarui pada',
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            Text(
              '21 Jun 2025 - 11:19 WIB',
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            const SizedBox(height: 30),
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
  }

  Widget _buildInfoBox({
    required IconData icon,
    String? title,
    required String description,
    Color? color,
    Color? textColor,
    Color? titleColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color ?? Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: textColor ?? Colors.grey[800]),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: titleColor ?? Colors.black,
                    ),
                  ),
                if (title != null) const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: textColor ?? Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDanaSummaryCard({
    required String title,
    required String amount,
    double? percentage,
    bool showPercentage = true,
    bool isBoldAmount = false,
  }) {
    return Row(
      children: [
        if (showPercentage && percentage != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${(percentage * 100).toInt()}%',
              style: TextStyle(
                  color: Colors.blue[800], fontWeight: FontWeight.bold),
            ),
          ),
        SizedBox(width: showPercentage && percentage != null ? 16 : 0),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isBoldAmount ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildKeteranganTambahan() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '5%',
                  style: TextStyle(
                      color: Colors.blue[800], fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Text(
                  'Donasi operasional',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Biaya ini 100% dibayarkan kepada pihak ketiga penyedia layanan transaksi digital dan Virtual Account, dompet digital dan QRIS serta layanan notifikasi (SMS, WA & email) dan server.',
            style: TextStyle(fontSize: 13, color: Colors.grey[700]),
          ),
          const SizedBox(height: 8),
          Text(
            '** Dana dapat dicairkan dan dikelola oleh penggalang dana. Jika terdapat donasi yang belum disalurkan/dicairkan baca selengkapnya di sini.',
            style: TextStyle(fontSize: 13, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

