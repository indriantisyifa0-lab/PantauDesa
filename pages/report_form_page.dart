import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/upload_service.dart';
import '../services/firestore_service.dart';

File? selectedImage;

Future<void> pickAndUpload() async {
  final picker = ImagePicker();
  final picked = await picker.pickImage(source: ImageSource.gallery);

  if (picked == null) return;

  selectedImage = File(picked.path);

  // 1. Upload ke Supabase
  final imageUrl = await uploadImage(selectedImage!);

  // 2. Simpan ke Firestore
  await saveLaporan(
    nama: 'Laporan Jalan Rusak',
    jenis: 'Infrastruktur',
    alamat: 'Desa Sukamaju',
    fotoUrl: imageUrl,
  );
}
