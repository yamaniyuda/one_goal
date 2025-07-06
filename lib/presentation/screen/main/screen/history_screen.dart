import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
    DateTime? _selectedDate;

    static const List<Map<String, dynamic>> _riwayatDonasi = [
        {
            'judul': 'Bersama Bangun Masjid di Daerah Terpencil',
            'tanggal': '04 Mei 2025',
            'jumlah': 'Rp 290.000',
            'status': 'Berhasil',
            'statusColor': Color(0xFFBDBDBD),
        },
        {
            'judul': 'Donasi Pangan untuk Keluarga Kurang Mampu',
            'tanggal': '5 Januari 2025',
            'jumlah': 'Rp 170.000',
            'status': 'Dibatalkan',
            'statusColor': Colors.red,
        },
        {
            'judul': 'Selamatkan Hidup Bayi Prematur Ini',
            'tanggal': '27 November 2024',
            'jumlah': 'Rp 700.000',
            'status': 'Pending',
            'statusColor': Color(0xFF5D7DCE),
        },
        {
            'judul': 'Ulurkan Tangan untuk Korban Bencana Alam',
            'tanggal': '17 Oktober 2024',
            'jumlah': 'Rp 230.000',
            'status': 'Berhasil',
            'statusColor': Color(0xFFBDBDBD),
        },
        {
            'judul': 'Bantu Wujudkan Pendidikan untuk Anak Pedalaman',
            'tanggal': '8 September 2024',
            'jumlah': 'Rp 500.000',
            'status': 'Berhasil',
            'statusColor': Color(0xFFBDBDBD),
        },
    ];

    DateTime _parseTanggal(String tgl) => DateFormat('d MMMM yyyy', 'id_ID').parse(tgl);

    List<Map<String, dynamic>> get _filteredDonations {
        if (_selectedDate == null) return _riwayatDonasi;
        return _riwayatDonasi.where((d) {
            final dt = _parseTanggal(d['tanggal'] as String);
            return 
                dt.year == _selectedDate!.year &&
                dt.month == _selectedDate!.month &&
                dt.day == _selectedDate!.day;
        }).toList();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Container(
                            decoration: const BoxDecoration(
                                color: Color(0xFF5D7DCE),
                                borderRadius:
                                    BorderRadius.vertical(bottom: Radius.circular(30)),
                            ),
                            padding: const EdgeInsets.only(bottom: 24),
                            child: Column(
                                children: [
                                    const SizedBox(height: 40),
                                    Text(
                                        AppLocalizations.of(context)!.my_donation,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 20),
                                    _buildHeaderCard(),
                                ],
                            ),
                        ),

                        const SizedBox(height: 20),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(20),
                            ),
                            child: CalendarDatePicker(
                                initialDate: _selectedDate ?? DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2026),
                                currentDate: DateTime.now(),
                                onDateChanged: (date) {
                                    setState(() => _selectedDate = date);
                                },
                            ),
                        ),

                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                        AppLocalizations.of(context)!.donation_history,
                                        style: const TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    GestureDetector(
                                        onTap: () => setState(() => _selectedDate = null),
                                        child: Text(
                                        AppLocalizations.of(context)!.show_all,
                                        style: const TextStyle(
                                            color: Color(0xFF5D7DCE),
                                            fontWeight: FontWeight.w600),
                                        ),
                                    ),
                                ],
                            ),
                        ),

                        // ===== LIST DONASI =====
                        if (_filteredDonations.isEmpty)
                        const Center(child: Text('Tidak ada donasi pada tanggal ini'))
                        else
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            itemCount: _filteredDonations.length,
                            itemBuilder: (context, i) =>
                                _buildDonationTile(_filteredDonations[i]),
                        ),
                    ],
                ),
            ),
        );
    }

    Widget _buildHeaderCard() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFFFDF8F8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.brown.shade200),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Text('Patrick Kluivert',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                    children: [
                        const Icon(
                            Icons.account_balance_wallet_outlined,
                            color: Colors.blue, size: 32
                        ),
                        const SizedBox(width: 10),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                                Text(
                                    'Total donasi',
                                    style: TextStyle(color: Colors.black54)
                                ),
                                Text(
                                    'Rp 12.530.000',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                                ),
                            ],
                        ),
                    ],
                ),
                const SizedBox(height: 12),
                const Divider(),
                const SizedBox(height: 6),
                const Text(
                    'Sudah berdonasi hari ini? Yuk, klik dan bantu sekarang!',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
            ],
        ),
    );

    Widget _buildDonationTile(Map<String, dynamic> donasi) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
            children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                        'assets/post_6.png',
                        width: 60, height: 60, fit: BoxFit.cover
                    ),
                ),
                const SizedBox(width: 12),
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(
                                donasi['judul'] as String,
                                style: const TextStyle(fontWeight: FontWeight.w600)
                            ),
                            const SizedBox(height: 4),
                            Text(
                                '${donasi['tanggal']}  ${donasi['jumlah']}',
                                style: TextStyle(color: Colors.grey.shade600)
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
                        donasi['status'] as String,
                        style: TextStyle(
                            color: donasi['statusColor'] as Color,
                            fontWeight: FontWeight.w600),
                    ),
                ),
            ],
        ),
    );
}
