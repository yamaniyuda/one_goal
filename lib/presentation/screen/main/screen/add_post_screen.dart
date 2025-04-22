import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
    const AddPostScreen({super.key});

    @override
    State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
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