import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
    const AccountScreen({super.key});

    @override
    State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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