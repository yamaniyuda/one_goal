import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/post/screen/konfirmasi_pembayaran_screen.dart';

class PembayaranScreen extends StatefulWidget {
  final String title;
  final String targetAmount;
  final String? imageUrl;

  const PembayaranScreen({
    Key? key,
    required this.title,
    required this.targetAmount,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<PembayaranScreen> createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  int selectedAmount = 1000;
  final TextEditingController customAmountController = TextEditingController();
  final TextEditingController prayerController = TextEditingController();
  bool isAnonymous = false;
  String selectedPaymentMethod = '';
  late List<int> predefinedAmounts = [];

  @override
  void initState() {
    super.initState();

    // Parsing targetAmount jadi int
    final target = int.tryParse(widget.targetAmount.replaceAll(RegExp(r'[^0-9]'), '')) ?? 100000;

    // Generate nominal donasi dari persentase target
    predefinedAmounts = [
      (target * 0.01).round(),
      (target * 0.05).round(),
      (target * 0.10).round(),
      (target * 0.20).round(),
    ];

    selectedAmount = predefinedAmounts.first;
  }

  @override
  void dispose() {
    customAmountController.dispose();
    prayerController.dispose();
    super.dispose();
  }

  String formatCurrency(int amount) {
    return amount.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF00BCD4),
        foregroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Target info
            Text(
              'Target donasi: Rp${formatCurrency(int.parse(widget.targetAmount.replaceAll(RegExp(r'[^0-9]'), '')))}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 12),

            // Nominal Donasi Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nominal donasi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        'Rp',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        formatCurrency(selectedAmount),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Pilihan nominal donasi
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: predefinedAmounts.map((amount) {
                      final isSelected = selectedAmount == amount;
                      return ChoiceChip(
                        label: Text('Rp${formatCurrency(amount)}'),
                        selected: isSelected,
                        selectedColor: Colors.teal,
                        onSelected: (_) {
                          setState(() {
                            selectedAmount = amount;
                          });
                        },
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                        backgroundColor: Colors.grey[200],
                      );
                    }).toList()
                      ..add(
                        ChoiceChip(
                          label: const Text('Nominal lain'),
                          selected: false,
                          onSelected: (_) => _showCustomAmountDialog(),
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Anonim switch
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Sembunyikan nama saya (donasi Anonim)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Switch(
                  value: isAnonymous,
                  onChanged: (value) {
                    setState(() {
                      isAnonymous = value;
                    });
                  },
                  activeColor: const Color(0xFF00BCD4),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Doa
            const Text(
              'Sertakan doa dan dukungan (opsional)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: prayerController,
                maxLines: 4,
                maxLength: 240,
                decoration: const InputDecoration(
                  hintText: 'Tulis doa untuk penggalang dana...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  counterStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Metode pembayaran
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Metode pembayaran',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  GestureDetector(
                    onTap: _showPaymentMethodBottomSheet,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00BCD4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text(
                            selectedPaymentMethod.isEmpty ? 'Pilih' : selectedPaymentMethod,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Pembayaran',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text('Rp', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink)),
                      Text(
                        formatCurrency(selectedAmount),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () => _processPayment(),
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Lanjut Pembayaran', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCustomAmountDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Masukkan Nominal'),
        content: TextField(
          controller: customAmountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Nominal (Rp)',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
          TextButton(
            onPressed: () {
              if (customAmountController.text.isNotEmpty) {
                setState(() {
                  selectedAmount = int.tryParse(customAmountController.text) ?? selectedAmount;
                });
              }
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _processPayment() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => KonfirmasiPembayaranScreen(
          nominal: selectedAmount,
          metode: selectedPaymentMethod,
          doa: prayerController.text,
          anonim: isAnonymous,
          imageUrl: widget.imageUrl ?? '',
        ),
      ),
    );

  }
  void _showPaymentMethodBottomSheet() {
  final List<Map<String, dynamic>> eMoneyMethods = [
    {
      'logo': 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Logo_ovo_purple.svg/2560px-Logo_ovo_purple.svg.png',
      'name': 'OVO',
      'fee': 1000,
    },
    {
      'logo': 'data:image/png;base64,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',
      'name': 'LinkAja',
      'fee': 1000,
    },
  ];

  final List<Map<String, dynamic>> vaMethods = [
    {
      'logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4MhmcXalmLLFDYlR8Rq6W9jFTm-C8-D27w&s',
      'name': 'CIMB Niaga',
      'fee': 3100,
    },
    {
      'logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV4MhmcXalmLLFDYlR8Rq6W9jFTm-C8-D27w&s',
      'name': 'BRI',
      'fee': 3100,
    },
    {
      'logo': 'data:image/png;base64,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',
      'name': 'Mandiri',
      'fee': 3100,
    },
    {
      'logo': 'data:image/png;base64,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',
      'name': 'Permata',
      'fee': 3100,
    },
    {
      'logo': 'data:image/png;base64,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',
      'name': 'BCA',
      'fee': 4600,
    },
  ];

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Transfer E-Money',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text('Pembayaran instan, verifikasi otomatis.', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            const SizedBox(height: 8),
            ...eMoneyMethods.map((item) => _buildPaymentItem(item)),
            const SizedBox(height: 16),
            const Text(
              'Transfer Virtual Account',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text('Pembayaran instan, verifikasi otomatis.', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
            const SizedBox(height: 8),
            ...vaMethods.map((item) => _buildPaymentItem(item)),
          ],
        ),
      );
    },
  );
}

Widget _buildPaymentItem(Map<String, dynamic> item) {
  final bool isSelected = selectedPaymentMethod == item['name'];

  return GestureDetector(
    onTap: () {
      setState(() => selectedPaymentMethod = item['name']);
      Navigator.pop(context);
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected ? Colors.teal : Colors.grey[300]!,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Image.network(item['logo'], width: 32, height: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Text(item['name'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          Text(
            'Rp ${item['fee'].toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (m) => '${m[1]}.')}',
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}


}



