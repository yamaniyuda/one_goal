import 'package:flutter/material.dart';

class StatementScreen extends StatefulWidget {
  const StatementScreen({Key? key}) : super(key: key);

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  String selectedPeriod = 'Semua Periode';

  final Map<String, List<String>> data = {
    '2025': ['Juni', 'Mei', 'April', 'Maret', 'Februari', 'Januari'],
    '2024': [
      'Desember',
      'November',
      'Oktober',
      'September',
      'Agustus',
      'Juli',
      'Juni',
      'Mei',
      'April',
      'Maret',
      'Februari'
    ],
    '2023': ['Desember', 'November', 'Oktober'],
  };

  @override
  Widget build(BuildContext context) {
    final List<String> years = ['Semua Periode', '2025', '2024', '2023'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('e - Statement'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), 
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("Pilih periode e-Statement"),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                setState(() {
                  selectedPeriod = value;
                });
              },
              itemBuilder: (context) => years
                  .map((year) => PopupMenuItem<String>(
                        value: year,
                        child: Text(year),
                      ))
                  .toList(),
              child: Text(
                selectedPeriod,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView(
              children: data.entries
                  .where((entry) =>
                      selectedPeriod == 'Semua Periode' ||
                      entry.key == selectedPeriod)
                  .expand((entry) {
                final year = entry.key;
                final months = entry.value;

                return [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      year,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  ...months.map((month) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text('$month $year'),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                          },
                        ),
                        const Divider(indent: 16.0, endIndent: 16.0),
                      ],
                    );
                  }).toList(),
                ];
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
