import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/main/widget/account_content.dart';
import 'package:one_goal/presentation/widget/background/circle_background.dart';
import '../widget/account_header.dart';

class ProfileScreen extends StatefulWidget {
    const ProfileScreen({super.key});

    @override
    State<ProfileScreen> createState() => _ProfileScreenState();
}



class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'John Wayne';
  String email = 'johnwayne@gmail.com';
  String phoneNumber = '082294067828';
  String job = 'Manager';
  String gender = 'Male';
  String userStatus = 'Donatur';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarMenu(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(205, 55, 106, 167),
        elevation: 0,
        title: const Text('Personal Data'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Tambahkan aksi edit jika diperlukan
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/person_1.jpg'),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              email,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            _buildInfoCard('Phone Number', phoneNumber),
            _buildInfoCard('Your Job', job),
            _buildInfoCard('Gender', gender),
            _buildInfoCard('User Status', userStatus),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  name = 'Patrick Kluivert';
                  email = 'patrick.klivert@gmail.com';
                  phoneNumber = '083456789123';
                  job = 'Developer';
                  gender = 'Male';
                  userStatus = 'Donatur Baru';
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Update Data'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Logout logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 49, 49, 242),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[100],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/person_1.jpg'),
                  radius: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  'John Wayne',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          menuItem(Icons.person, 'Personal Data', context),
          menuItem(Icons.settings, 'Settings', context),
          menuItem(Icons.receipt, 'E-Statement', context),
          menuItem(Icons.card_giftcard, 'Referral Code', context),
          menuItem(Icons.help_outline, 'FAQs', context),
          menuItem(Icons.menu_book, 'Our Handbook', context),
          menuItem(Icons.groups, 'Community', context),
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

  Widget menuItem(IconData icon, String title, BuildContext context) {
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
