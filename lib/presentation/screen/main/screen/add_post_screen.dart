import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  XFile? _imageFile;

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final targetController = TextEditingController();
  final deadlineController = TextEditingController();

  String selectedCategory = "";

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      deadlineController.text =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2196F3), Color(0xFF0D47A1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Add New Donation Post",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      image:
                          _imageFile != null
                              ? DecorationImage(
                                image: FileImage(File(_imageFile!.path)),
                                fit: BoxFit.cover,
                              )
                              : null,
                    ),
                    child:
                        _imageFile == null
                            ? const Center(
                              child: Icon(
                                Icons.add_a_photo,
                                size: 50,
                                color: Colors.grey,
                              ),
                            )
                            : null,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildInputField(
                        controller: titleController,
                        label: "Title",
                        icon: Icons.title,
                      ),
                      _buildInputField(
                        controller: descController,
                        label: "Description",
                        icon: Icons.description,
                        maxLines: 3,
                      ),
                      _buildInputField(
                        controller: targetController,
                        label: "Target Amount",
                        icon: Icons.attach_money,
                        keyboardType: TextInputType.number,
                      ),
                      _buildInputField(
                        controller: deadlineController,
                        label: "Deadline",
                        icon: Icons.calendar_today,
                        readOnly: true,
                        onTap: _pickDate,
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children:
                            ["Health", "Education", "Disaster", "Children"]
                                .map(
                                  (cat) => ChoiceChip(
                                    label: Text(cat),
                                    selectedColor: Colors.blue[200],
                                    selected: selectedCategory == cat,
                                    onSelected: (_) {
                                      setState(() {
                                        selectedCategory = cat;
                                      });
                                    },
                                  ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue[900],
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Post submitted successfully!"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        child: const Text("Submit Post"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    bool readOnly = false,
    TextInputType keyboardType = TextInputType.text,
    void Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator:
            (value) =>
                (value == null || value.isEmpty)
                    ? "This field is required"
                    : null,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.blue[900]),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
