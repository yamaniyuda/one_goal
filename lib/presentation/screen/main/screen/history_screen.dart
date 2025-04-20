import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
    const HistoryScreen({super.key});

    @override
    State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
    @override
    Widget build(BuildContext context) {
        return Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image.asset(
                        'assets/maintenance.png',
                        width: 300, 
                        height: 300,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                        'Under Maintenance',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                ],
            ),
        );
    }
}