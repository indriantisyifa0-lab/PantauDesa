import 'package:flutter/material.dart';
import 'form_label.dart';
import 'form_textfield.dart';
import 'upload_foto_box.dart';
import 'submit_button.dart';

class FormCard extends StatefulWidget {
  final String title;
  const FormCard({super.key, required this.title});

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final lokasiController = TextEditingController();
  final deskripsiController = TextEditingController();

  @override
  void dispose() {
    namaController.dispose();
    lokasiController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Laporan berhasil dikirim ✅"),
          backgroundColor: Colors.green,
        ),
      );

      // RESET FORM
      namaController.clear();
      lokasiController.clear();
      deskripsiController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFE6F0D8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // JUDUL
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCEBC8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B4D3C),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const FormLabel(text: "Nama Pelapor *"),
              FormTextField(
                hint: "Masukkan nama lengkap anda",
                controller: namaController,
                validator: (value) =>
                    value!.isEmpty ? "Nama wajib diisi" : null,
              ),

              const SizedBox(height: 12),

              const FormLabel(text: "Lokasi *"),
              FormTextField(
                hint: "Contoh: Jalan Utama Desa RT/RW",
                controller: lokasiController,
                validator: (value) =>
                    value!.isEmpty ? "Lokasi wajib diisi" : null,
              ),

              const SizedBox(height: 12),

              const FormLabel(text: "Jenis Laporan *"),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF0B4D3C),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: "Pilih jenis laporan",
                    dropdownColor: const Color(0xFF0B4D3C),
                    iconEnabledColor: Colors.white,
                    items: const [
                      DropdownMenuItem(
                        value: "Pilih jenis laporan",
                        child: Text(
                          "Pilih jenis laporan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const FormLabel(text: "Deskripsi Laporan *"),
              FormTextField(
                hint:
                    "Jelaskan secara detail permasalahan yang ingin dilaporkan",
                controller: deskripsiController,
                maxLines: 4,
                validator: (value) =>
                    value!.isEmpty ? "Deskripsi wajib diisi" : null,
              ),

              const SizedBox(height: 12),

              const FormLabel(text: "Upload Foto *"),
              const UploadFotoBox(),

              const SizedBox(height: 20),

              SubmitButton(onPressed: submitForm),
            ],
          ),
        ),
      ),
    );
  }
}
