import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/main/screen/statement_screen.dart';
import 'package:one_goal/presentation/screen/main/widget/account_content.dart';
import 'package:one_goal/presentation/screen/main/widget/home_header.dart';
import 'package:one_goal/presentation/widget/background/circle_background.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CircleBackground(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AccountContent(),
                  menuItem(Icons.receipt_long, 'E-Statement', context),
                  // Tambahkan menu lain jika perlu
                ],
              ),
            ),
          ),
          const HomeHeader(),
        ],
      ),
    );
  }

  Widget menuItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        if (title == 'E-Statement') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const StatementScreen()),
          );
        }
      },
    );
  }
}
