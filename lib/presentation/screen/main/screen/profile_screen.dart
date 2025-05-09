// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/main/widget/edit_profile_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'John Wayne';
  String email = 'johnwayne@gmail.com';

  // Controllers
  final phoneController = TextEditingController();
  final jobController = TextEditingController();
  String selectedGender = 'Male';
  String selectedStatus = 'Donatur';

  // Toggle flags for edit mode
  bool editPhone = false;
  bool editJob = false;
  bool editGender = false;
  bool editStatus = false;

  @override
  void initState() {
    super.initState();
    phoneController.text = '082294067828';
    jobController.text = 'Manager';
  }

  @override
  void dispose() {
    phoneController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarMenu(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(205, 55, 106, 167),
        elevation: 0,
        title: Row(
          children: [
            const Icon(Icons.person, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              'Personal Data',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blueAccent, width: 2),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/person_1.jpg'),
              ),
            ),
            const SizedBox(height: 16),
            Text(name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(email, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
            const SizedBox(height: 24),

            // Editable Info Cards
            _buildEditableCard(
              label: 'Phone Number',
              icon: Icons.phone,
              iconColor: Colors.green,
              isEditing: editPhone,
              onTapEdit: () => setState(() => editPhone = !editPhone),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(border: InputBorder.none, isDense: true),
              ),
              displayText: phoneController.text,
            ),
            _buildEditableCard(
              label: 'Your Job',
              icon: Icons.work,
              iconColor: Colors.orange,
              isEditing: editJob,
              onTapEdit: () => setState(() => editJob = !editJob),
              child: TextField(
                controller: jobController,
                decoration: const InputDecoration(border: InputBorder.none, isDense: true),
              ),
              displayText: jobController.text,
            ),
            _buildEditableCard(
              label: 'Gender',
              icon: Icons.person,
              iconColor: Colors.purple,
              isEditing: editGender,
              onTapEdit: () => setState(() => editGender = !editGender),
              child: DropdownButton<String>(
                value: selectedGender,
                isExpanded: true,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                onChanged: (value) => setState(() => selectedGender = value!),
              ),
              displayText: selectedGender,
            ),
            _buildEditableCard(
              label: 'User Status',
              icon: Icons.verified_user,
              iconColor: Colors.blue,
              isEditing: editStatus,
              onTapEdit: () => setState(() => editStatus = !editStatus),
              child: DropdownButton<String>(
                value: selectedStatus,
                isExpanded: true,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: 'Donatur', child: Text('Donatur')),
                  DropdownMenuItem(value: 'Donatur Baru', child: Text('Donatur Baru')),
                  DropdownMenuItem(value: 'Relawan', child: Text('Relawan')),
                ],
                onChanged: (value) => setState(() => selectedStatus = value!),
              ),
              displayText: selectedStatus,
            ),
            const SizedBox(height: 32),

            // Update Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  editPhone = false;
                  editJob = false;
                  editGender = false;
                  editStatus = false;
                  // Data already updated through controller and state
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(200, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableCard({
    required String label,
    required IconData icon,
    required Color iconColor,
    required bool isEditing,
    required VoidCallback onTapEdit,
    required Widget child,
    required String displayText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  isEditing ? child : Text(displayText, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(isEditing ? Icons.check_circle : Icons.edit, color: Colors.grey),
              onPressed: onTapEdit,
            ),
          ],
        ),
      ),
    );
  }
}

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



class _ProfileScreen extends State<ProfileScreen> {
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
    showDialog(
      context: context,
      builder: (context) => EditProfileDialog(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        job: job,
        gender: gender,
        userStatus: userStatus,
        onSave: (newName, newEmail, newPhoneNumber, newJob, newGender, newStatus) {
          setState(() {
            name = newName;
            email = newEmail;
            phoneNumber = newPhoneNumber;
            job = newJob;
            gender = newGender;
            userStatus = newStatus;
          });
        },
      ),
    );
  },
),
        ],
      ),
      body: SingleChildScrollView(
  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 80.0), // Tambahkan padding bawah
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
bottomNavigationBar: BottomAppBar(
  shape: const CircularNotchedRectangle(),
  notchMargin: 8.0,
  child: SizedBox(
    height: 60.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(icon: const Icon(Icons.home), onPressed: () {}),
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.add), onPressed: () {}),
        IconButton(icon: const Icon(Icons.list), onPressed: () {}),
        IconButton(icon: const Icon(Icons.account_circle), onPressed: () {}),
      ],
    ),
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
          // ignore: deprecated_member_use
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

class Sidebar  extends StatelessWidget {
  const Sidebar({super.key});

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
