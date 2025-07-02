import 'package:flutter/material.dart';

class ProfileUpdateScreen extends StatefulWidget {
    const ProfileUpdateScreen({super.key});

    @override
    State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
    
    String name = 'John Wayne';
    String email = 'johnwayne@gmail.com';

    // Controllers
    final phoneController = TextEditingController();
    final jobController = TextEditingController();
    String selectedGender = 'Male';
    String selectedStatus = 'Donatur';
    DateTime birthDate = DateTime.now();

    // Toggle flags for edit mode
    bool editPhone = false;
    bool editJob = false;
    bool editGender = false;
    bool editStatus = false;
    bool editBirthDate = false;

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



    Widget _buildEditableCard({ required String label, required IconData icon, required Color iconColor, required bool isEditing, required VoidCallback onTapEdit, required Widget child, required String displayText }) {
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
                                Text(
                                    label,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                isEditing
                                    ? child
                                    : Text(
                                        displayText,
                                        style: const TextStyle(color: Colors.grey),
                                    ),
                                ],
                            ),
                        ),
                        IconButton(
                            icon: Icon(
                                isEditing ? Icons.check_circle : Icons.edit,
                                color: Colors.grey,
                            ),
                            onPressed: onTapEdit,
                        ),
                    ],
                ),
            ),
        );
    }

    
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Profile Update'),
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
                        Text(
                            name,
                            style: Theme.of(
                                context,
                            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                            email,
                            style: Theme.of(
                                context,
                            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                        ),
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
                                decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                ),
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
                                decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                ),
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
                                DropdownMenuItem(
                                    value: 'Donatur Baru',
                                    child: Text('Donatur Baru'),
                                ),
                                DropdownMenuItem(value: 'Relawan', child: Text('Relawan')),
                                ],
                                onChanged: (value) => setState(() => selectedStatus = value!),
                            ),
                            displayText: selectedStatus,
                        ),
                        _buildEditableCard(
                            label: 'Birth Date',
                            icon: Icons.calendar_today,
                            iconColor: Colors.orange,
                            isEditing: editBirthDate,
                            onTapEdit: () => setState(() => editBirthDate = !editBirthDate),
                            displayText: birthDate.toLocal().toString().split(' ')[0],
                            child: TextField(
                                controller: TextEditingController(
                                    text: birthDate.toLocal().toString().split(' ')[0],
                                ),
                                readOnly: true,
                                onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime.now(),
                                    );
                                    if (pickedDate != null) {
                                        setState(() {
                                            birthDate = pickedDate;
                                        });
                                    }
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                ),
                            ),
                        ),
                        const SizedBox(height: 32),

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
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                ),
                            ),
                            child: const Text('Update Data'),
                        ),
                    ],
                ),
            )
        );
    }
}