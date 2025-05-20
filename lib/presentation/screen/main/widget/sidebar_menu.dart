import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
    const SidebarMenu({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: Column(
                children: [
                    DrawerHeader(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Row(
                            children: const [
                                CircleAvatar(
                                backgroundImage: AssetImage('assets/person_1.jpg'),
                                radius: 30,
                                ),
                                SizedBox(width: 10),
                                Text(
                                'John Wayne',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                            ],
                        ),
                    ),
                    _menuItem(Icons.person, 'Personal Data', context),
                    _menuItem(Icons.settings, 'Settings', context),
                    _menuItem(Icons.receipt, 'E-Statement', context),
                    _menuItem(Icons.card_giftcard, 'Referral Code', context),
                    _menuItem(Icons.help_outline, 'FAQs', context),
                    _menuItem(Icons.menu_book, 'Our Handbook', context),
                    _menuItem(Icons.groups, 'Community', context),
                    const Spacer(),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                            children: const [
                            Icon(Icons.headset_mic, color: Colors.blue),
                            SizedBox(width: 10),
                            Expanded(
                                child: Text(
                                "Feel free to ask, we're ready to help",
                                style: TextStyle(color: Colors.blue),
                                ),
                            ),
                            ],
                        ),
                        ),
                    ),
                ],
            ),
        );
    }

    Widget _menuItem(IconData icon, String title, BuildContext context) {
        return ListTile(
            leading: Icon(icon, color: Colors.black54),
            title: Text(title),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
                // Navigation logic
            },
        );
    }
}
