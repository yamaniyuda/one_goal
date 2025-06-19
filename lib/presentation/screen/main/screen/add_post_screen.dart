import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  final TextEditingController _targetDanaController = TextEditingController();
  final TextEditingController _namaPenerimaController = TextEditingController();
  final TextEditingController _rekeningController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();

  String? _selectedKategori;
  DateTime? _tanggalMulai;
  DateTime? _tanggalSelesai;

  final List<String> _kategoriList = [
    'Kesehatan',
    'Pendidikan',
    'Bencana Alam',
    'Pembangunan Masjid',
    'Lainnya',
  ];

  final Color primaryColor = const Color(0xFF5D7DCE);
  final Color accentColor = Colors.blue;

  Future<void> _pickDate({required bool isStart}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _tanggalMulai = picked;
        } else {
          _tanggalSelesai = picked;
        }
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Penggalangan dana berhasil ditambahkan!'),
        ),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
      ),
      validator:
          (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Donasi'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Form Tambah Penggalangan Dana',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildTextField(
                    label: 'Judul Donasi',
                    controller: _judulController,
                  ),
                  const SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    value: _selectedKategori,
                    decoration: InputDecoration(
                      labelText: 'Kategori',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primaryColor, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 16,
                      ),
                    ),
                    items:
                        _kategoriList.map((kategori) {
                          return DropdownMenuItem(
                            value: kategori,
                            child: Text(kategori),
                          );
                        }).toList(),
                    onChanged:
                        (value) => setState(() => _selectedKategori = value),
                    validator:
                        (value) => value == null ? 'Pilih kategori' : null,
                  ),
                  const SizedBox(height: 16),

                  _buildTextField(
                    label: 'Deskripsi Donasi',
                    controller: _deskripsiController,
                    maxLines: 4,
                  ),
                  const SizedBox(height: 16),

                  _buildTextField(
                    label: 'Target Dana (Rp)',
                    controller: _targetDanaController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _pickDate(isStart: true),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: primaryColor.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              _tanggalMulai != null
                                  ? 'Mulai: ${DateFormat('dd-MM-yyyy').format(_tanggalMulai!)}'
                                  : 'Pilih Tanggal Mulai',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _pickDate(isStart: false),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: primaryColor.withOpacity(0.5),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              _tanggalSelesai != null
                                  ? 'Selesai: ${DateFormat('dd-MM-yyyy').format(_tanggalSelesai!)}'
                                  : 'Pilih Tanggal Selesai',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        // Fungsi upload gambar
                      },
                      icon: const Icon(Icons.image),
                      label: const Text('Upload Gambar'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),

                  _buildTextField(
                    label: 'Nama Penerima Dana',
                    controller: _namaPenerimaController,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: 'No. Rekening / E-Wallet',
                    controller: _rekeningController,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    label: 'Bank / E-Wallet',
                    controller: _bankController,
                  ),
                  const SizedBox(height: 24),

                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 32,
                        ),
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: _submitForm,
                      child: const Text(
                        'Tambah Donasi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
