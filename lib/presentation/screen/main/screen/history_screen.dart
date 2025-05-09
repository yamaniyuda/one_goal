import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.my_donation,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
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
                      const Text(
                        'Patrick Kluivert',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.account_balance_wallet_outlined,
                              color: Colors.blue, size: 32),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Total donasi',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                'Rp 12.530.000',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
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
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),


          // Kalender static
            const SizedBox(height: 20),
            Expanded(
            child: SingleChildScrollView(
              child: Column(
              children: [
                Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                  // Header bulan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                    Icon(Icons.arrow_back_ios, size: 18),
                    Row(
                      children: [
                      Text(
                        'May',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '2025',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Hari
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                    Text('Mo'), Text('Tu'), Text('We'), Text('Th'), Text('Fr'), Text('Sa'), Text('Su'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Minggu 1
                  _calendarRow(['29', '30', '', '1', '2', '3', '4'], selectedDates: ['4']),
                  _calendarRow(['5', '6', '7', '8', '9', '10', '11'], selectedDates: ['9']),
                  _calendarRow(['12', '13', '14', '15', '16', '17', '18']),
                  _calendarRow(['19', '20', '21', '22', '23', '24', '25']),
                  _calendarRow(['26', '27', '28', '29', '30', '', '']),
                  ],
                ),
                ),

                // Riwayat Donasi
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                  Text(
                    AppLocalizations.of(context)!.donation_history,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppLocalizations.of(context)!.show_all,
                    style: TextStyle(
                    color: Color(0xFF5D7DCE),
                    fontWeight: FontWeight.w600,
                    ),
                  ),
                  ],
                ),
                ),
                ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                      'assets/post_6.png',
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
                      color: (donasi['statusColor'] as Color).withAlpha((0.2 * 255).toInt()),
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
                SizedBox(height: 100),
              ],
              ),
            ),
            ),
        ],
      ),
    );
  }           

  
  Widget _calendarRow(List<String> days, {List<String> selectedDates = const []}) {
	return Padding(
		padding: const EdgeInsets.symmetric(vertical: 4),
		child: Row(
		mainAxisAlignment: MainAxisAlignment.spaceAround,
		children: days.map((day) {
			final isSelected = selectedDates.contains(day);
			final isBlueLight = day == '9';

			return Container(
			width: 36,
			height: 36,
			alignment: Alignment.center,
			decoration: BoxDecoration(
				color: isSelected
					? (isBlueLight ? Color(0xFF9DB4EA) : Color(0xFF5D7DCE))
					: Colors.transparent,
				borderRadius: BorderRadius.circular(8),
			),
			child: Text(
				day,
				style: TextStyle(
				color: isSelected ? Colors.white : Colors.black87,
				fontWeight: FontWeight.w600,
				),
			),
			);
		}).toList(),
		),
	);
	}       
}