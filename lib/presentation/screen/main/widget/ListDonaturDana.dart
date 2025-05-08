import 'package:flutter/material.dart';

class ListDonaturDana extends StatefulWidget {
  const ListDonaturDana({super.key});

  @override
  State<ListDonaturDana> createState() => _ListDonaturDanaState();
}

class _ListDonaturDanaState extends State<ListDonaturDana> {
  String filterSelected = 'Terbaru';

  @override
  Widget build(BuildContext context) {
    return Scaffold(	
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Donasi (71)',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Filter buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Row(
              children: [
                FilterChip(
                  label: 'Terbaru', 
                  isSelected: filterSelected == 'Terbaru',
                  onSelected: () => setState(() => filterSelected = 'Terbaru'),
                ),
                const SizedBox(width: 10),
                FilterChip(
                  label: 'Terbesar', 
                  isSelected: filterSelected == 'Terbesar',
                  onSelected: () => setState(() => filterSelected = 'Terbesar'),
                ),
              ],
            ),
          ),
          
          // List of donors
          Expanded(
            child: ListView.builder(
              itemCount: 50, // 50 donors as requested
              itemBuilder: (context, index) {
                // Creating different donor profiles with varied amounts
                final donorData = _getDonorData(index);
                return DonorCard(
                  name: donorData['name'] as String,
                  amount: donorData['amount'] as String,
                  time: donorData['time'] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Generate donor data based on index to create some variety
  Map<String, String> _getDonorData(int index) {
    final List<Map<String, String>> commonDonors = [
      {'name': 'Orang Baik', 'amount': 'Rp1.000', 'time': '9 jam lalu'},
      {'name': 'Orang Baik', 'amount': 'Rp100.000', 'time': '17 jam lalu'},
      {'name': 'Orang Baik', 'amount': 'Rp25.000', 'time': 'Kemarin'},
      {'name': 'Renzo Alvaroshan', 'amount': 'Rp10.000', 'time': 'Kemarin'},
      {'name': 'Orang Baik', 'amount': 'Rp10.000', 'time': 'Kemarin'},
      {'name': 'Orang Baik', 'amount': 'Rp5.000', 'time': 'Kemarin'},
      {'name': 'REA', 'amount': 'Rp1.000', 'time': 'Kemarin'},
      {'name': 'Orang Baik', 'amount': 'Rp10.000', 'time': 'Kemarin'},
    ];

    // Cycle through the common donors for variety
    return commonDonors[index % commonDonors.length];
  }
}

class FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const FilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class DonorCard extends StatelessWidget {
  final String name;
  final String amount;
  final String time;

  const DonorCard({
    super.key,
    required this.name,
    required this.amount,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile picture placeholder
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 25,
            child: Icon(Icons.person, color: Colors.grey[600], size: 30),
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
}