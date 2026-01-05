import 'dart:typed_data';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

// ANDROID / IOS
Future<String> uploadImageFile(String path) async {
  final fileName = DateTime.now().millisecondsSinceEpoch.toString();

  await supabase.storage
      .from('laporan-images')
      .upload('laporan/$fileName.jpg', File(path));

  return supabase.storage
      .from('laporan-images')
      .getPublicUrl('laporan/$fileName.jpg');
}

// WEB
Future<String> uploadImageBytes(Uint8List bytes, String name) async {
  await supabase.storage
      .from('laporan-images')
      .uploadBinary('laporan/$name', bytes);

  return supabase.storage
      .from('laporan-images')
      .getPublicUrl('laporan/$name');
}
