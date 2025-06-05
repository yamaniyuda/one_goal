import 'package:flutter/material.dart';

class EditProfileDialog extends StatefulWidget {
  final String name, email, phoneNumber, job, gender, userStatus;
  final Function(String, String, String, String, String, String) onSave;

  const EditProfileDialog({
    super.key,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.job,
    required this.gender,
    required this.userStatus,
    required this.onSave,
  });

  @override
  _EditProfileDialogState createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController jobController;
  late TextEditingController genderController;
  late TextEditingController statusController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phoneNumber);
    jobController = TextEditingController(text: widget.job);
    genderController = TextEditingController(text: widget.gender);
    statusController = TextEditingController(text: widget.userStatus);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Profile'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            _buildTextField('Name', nameController),
            _buildTextField('Email', emailController),
            _buildTextField('Phone Number', phoneController),
            _buildTextField('Job', jobController),
            _buildTextField('Gender', genderController),
            _buildTextField('Status', statusController),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(
              nameController.text,
              emailController.text,
              phoneController.text,
              jobController.text,
              genderController.text,
              statusController.text,
            );
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}