import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/post/screen/cerita_penggalangan_screen.dart';
import 'package:one_goal/presentation/screen/post/widget/list_donatur_dana.dart';
import 'package:one_goal/presentation/screen/post/screen/rincian_penggunaan_dana_screen.dart';
import 'package:one_goal/presentation/screen/post/screen/kabar_terbaru_screen.dart';
import 'package:one_goal/presentation/screen/post/screen/pencairan_dana_screen.dart';
import 'package:one_goal/presentation/screen/post/screen/pembayaran_screen.dart';

class GalangDanaScreen extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  
  const GalangDanaScreen({
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
          // Header Image
          _buildHeaderImage(context),
          
          // Content
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
                    _buildTitleSection(),
                    const SizedBox(height: 16),
                    _buildProgressSection(),
                    const SizedBox(height: 16),
                    _buildInformationSection(context),
                    const SizedBox(height: 16),
                    _buildStorySection(context),
                    const SizedBox(height: 20),
                    _buildDivider(),
                    const SizedBox(height: 20),
                    _buildLatestNewsSection(context),
                    const SizedBox(height: 20),
                    _buildDivider(),
                    const SizedBox(height: 20),
                    _buildFundWithdrawalSection(context),
                    const SizedBox(height: 20),
                    _buildDivider(),
                    const SizedBox(height: 20),
                    _buildDonationSection(context),
                    const SizedBox(height: 20),
                    _buildDonationButton(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderImage(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imageUrl!,
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
    );
  }

  Widget _buildTitleSection() {
    return Text(
      title!,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildProgressSection() {
    const currentAmount = 171277788;
    const targetAmount = 250000000;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              'Rp${_formatCurrency(currentAmount)}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(' dari Rp${_formatCurrency(targetAmount)}'),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: currentAmount / targetAmount,
          color: Colors.blue,
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _infoTile('7.844', 'Donasi'),
            _infoTile('4', 'Kabar Terbaru'),
            _infoTile('3 kali', 'Pencairan Dana'),
          ],
        ),
      ],
    );
  }

  Widget _buildInformationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informasi Penggalangan Dana',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildOrganizationCard(),
        const SizedBox(height: 12),
        _buildFundUsageCard(context),
      ],
    );
  }

  Widget _buildOrganizationCard() {
    return Container(
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
            child: Image.asset('assets/images/logo.png'),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LEMBAGA SOSIAL ONE GOAL',
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
    );
  }

  Widget _buildFundUsageCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RincianPenggunaanDanaScreen(),
          ),
        );
      },
      child: Container(
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
        child: const Row(
          children: [
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
    );
  }

  Widget _buildStorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CeritaPenggalanganScreen(),
              ),
            );
          },
          child: _sectionWithArrow('Cerita Penggalangan Dana', true),
        ),
        const SizedBox(height: 8),
        Text(
          '18 Januari 2025',
          style: TextStyle(fontSize: 15, color: Colors.grey[600]),
        ),
        const SizedBox(height: 12),
        Text(
          'Enam kabupaten/kota di Provinsi Lampung terdampak banjir pada Jumat (17/1/2025). Berdasarkan data yang dihimpun dari Badan Penanggulangan Bencana Daerah (BPBD) Provinsi Lampung, enam kabupaten kota itu adalah Lampung Tengah dengan 2 titik banjir, Lampung Timur 6 titik banjir, Pesawaran 2 titik banjir, Lampung Selatan 4 titik banjir, dan Pesisir Barat 2 titik banjir, dan Kota Bandar Lampung.',
          style: TextStyle(fontSize: 14, color: Colors.grey[800]),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CeritaPenggalanganScreen(),
              ),
            );
          },
          child: const Text(
            'Baca Selengkapnya',
            style: TextStyle(fontSize: 14, color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildLatestNewsSection(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const KabarTerbaruScreen()),
            );
          },
          child: Row(
            children: [
              const Text(
                'Kabar Terbaru',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              _buildBadge('4'),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
       
      ],
    );
  }

  Widget _buildFundWithdrawalSection(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PencairanDanaScreen(),
              ),
            );
          },
          child: Row(
            children: [
              const Text(
                'Pencairan Dana',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              _buildBadge('3'),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      
      ],
    );
  }

  Widget _buildDonationSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              const Text(
                'Donasi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
              _buildBadge('7.844'),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _donorCard('Orang Baik', 'Rp25.000', '35 menit'),
        const SizedBox(height: 8),
        _donorCard('Rizky', 'Rp100.000', '2 jam lalu'),
        const SizedBox(height: 8),
        _donorCard('Putra', 'Rp1.000', '4 jam lalu'),
      ],
    );
  }

  Widget _buildDonationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
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
          _showDonasiBottomSheet(context);
        },
        child: const Text(
          'Donasi sekarang',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(height: 1, color: Colors.grey[300]);
  }

  Widget _sectionWithArrow(String title, bool showArrow) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        if (showArrow) 
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    );
  }

  Widget _donorCard(String name, String amount, String time) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 20,
            child: Icon(Icons.person, color: Colors.grey[600]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      'Berdonasi sebesar ',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      amount,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
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

  // Fixed bottom sheet with proper state management
  void _showDonasiBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (context) => DonationBottomSheet(
        imageUrl: imageUrl!,
        title: title!,
      ),
    );
  }

  Widget _infoTile(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          label, 
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  String _formatCurrency(int amount) {
    return amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }
}

// Separate StatefulWidget for the bottom sheet
class DonationBottomSheet extends StatefulWidget {
  final String imageUrl;
  final String title;

  const DonationBottomSheet({
    super.key,
    required this.imageUrl,
    required this.title,
  });
  

  @override
  State<DonationBottomSheet> createState() => _DonationBottomSheetState();
}

class _DonationBottomSheetState extends State<DonationBottomSheet> {
  final TextEditingController _nominalController = TextEditingController();
  int selectedAmount = 0;
  final List<int> predefinedAmounts = [5000, 15000, 25000, 50000];

  @override
  void dispose() {
    _nominalController.dispose();
    super.dispose();
  }

  void _selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
      _nominalController.text = amount.toString();
    });
  }

  void _onTextChanged(String value) {
    print('Text changed: $value');
    setState(() {
      selectedAmount = int.tryParse(value.replaceAll('.', '')) ?? 0;
    });
  }

  String _getEmojiForAmount(int amount) {
    switch (amount) {
      case 5000: return '😊';
      case 15000: return '😄';
      case 25000: return '😘';
      case 50000: return '😍';
      default: return '😊';
    }
  }

  String _formatCurrency(int amount) {
    return 'Rp${amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }

  bool get _isValidAmount => selectedAmount >= 1000;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Pilih Nominal Donasi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          
          // Predefined amounts
          ...predefinedAmounts.map((amount) => _buildDonationOption(
            onTap: () => _selectAmount(amount),
            emoji: _getEmojiForAmount(amount),
            label: _formatCurrency(amount),
            isSelected: selectedAmount == amount,
          )),
          
          const SizedBox(height: 12),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nominal Donasi Lainnya',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          
          // Custom amount input
          TextField(
            controller: _nominalController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: 'Rp ',
              hintText: '0',
              helperText: 'Min. donasi sebesar Rp1.000',
              helperStyle: TextStyle(
                color: _isValidAmount ? Colors.grey : Colors.red,
              ),
              errorText: selectedAmount > 0 && !_isValidAmount 
                ? 'Minimal donasi Rp1.000' 
                : null,
            ),
            onChanged: _onTextChanged,
          ),
          
          const SizedBox(height: 20),
          
          // Continue button
          ElevatedButton(
            onPressed: () {
              print('Selected amount when di klik: $selectedAmount');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PembayaranScreen(
                    title: widget.title!,
                    targetAmount: "$selectedAmount", // atau sesuai target yang ada
                    imageUrl: widget.imageUrl!, // Ganti dengan URL gambar yang sesuai
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text(
              'Lanjutkan Pembayaran',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildDonationOption({
    required VoidCallback onTap,
    required String emoji,
    required String label,
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.withOpacity(0.1) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Text(emoji, style: const TextStyle(fontSize: 24)),
        title: Text(
          label, 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.blue : null,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios, 
          size: 16,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}