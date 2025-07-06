import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class StatementScreen extends StatefulWidget {
  const StatementScreen({super.key});

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  String selectedYear = 'Semua Periode';
  final List<String> years = [
    'Semua Periode',
    ...List.generate(2025 - 2017 + 1, (i) => (2025 - i).toString())
  ];

  final random = Random();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID');
  }

  Set<int> getRandomTransactionDates(int totalDays) {
    final s = <int>{};
    while (s.length < 5) s.add(random.nextInt(totalDays) + 1);
    return s;
  }

  Widget buildDayCell(int? day, bool isTxn) {
    if (day == null) {
      return const SizedBox();
    }
    return Container(
      decoration: BoxDecoration(
        color: isTxn ? Colors.green : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Text(
        '$day',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isTxn ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  List<Widget> buildCalendarDays(int month, int year) {
    final firstDay = DateTime(year, month, 1);
    final totalDays = DateUtils.getDaysInMonth(year, month);
    final offset = firstDay.weekday % 7;
    final txnDates = getRandomTransactionDates(totalDays);

    final List<Widget> cells = [];
    for (var i = 0; i < offset; i++) {
      cells.add(buildDayCell(null, false));
    }
    for (var d = 1; d <= totalDays; d++) {
      cells.add(buildDayCell(d, txnDates.contains(d)));
    }
    return cells;
  }

  Widget buildMonthCard(int month, int year) {
    const double cardWidth = 320;
    const double innerPad = 16;
    final monthName = DateFormat('MMMM', 'id_ID').format(DateTime(year, month));

    return SizedBox(
      width: cardWidth,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color(0xFFF9F4FE),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(innerPad),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$monthName $year',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min']
                    .map((d) => Text(d, style: const TextStyle(fontSize: 12)))
                    .toList(),
              ),
              const SizedBox(height: 8),
              GridView.count(
                crossAxisCount: 7,
                mainAxisSpacing: 6,
                crossAxisSpacing: 6,
                childAspectRatio: 1, 
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: buildCalendarDays(month, year),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('e - Statement'),
        centerTitle: true,
        leading: const BackButton(),
        actions: [
          Tooltip(
            message: 'Informasi e‑Statement',
            waitDuration: const Duration(milliseconds: 1500),
            child: IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Informasi'),
                  content: const Text('Tanggal berwarna hijau menandakan transaksi.'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Pilih periode e‑Statement'),
            trailing: PopupMenuButton<String>(
              onSelected: (v) => setState(() => selectedYear = v),
              itemBuilder: (c) => years.map((y) => PopupMenuItem(value: y, child: Text(y))).toList(),
              child: Text(selectedYear, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const Divider(height: 0),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: years
                  .where((y) => y != 'Semua Periode')
                  .where((y) => selectedYear == 'Semua Periode' || selectedYear == y)
                  .map((yearStr) {
                final y = int.parse(yearStr);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 0, 4),
                      child: Text(yearStr, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    SizedBox(
                      height: 420,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 12,
                        itemBuilder: (_, i) => buildMonthCard(i + 1, y),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
