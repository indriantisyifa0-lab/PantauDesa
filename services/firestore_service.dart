import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveLaporan({
  required String nama,
  required String jenis,
  required String alamat,
  required String fotoUrl,
}) async {
  await FirebaseFirestore.instance.collection('laporan').add({
    'nama': nama,
    'jenis': jenis,
    'alamat': alamat,
    'foto_url': fotoUrl,
    'created_at': Timestamp.now(),
  });
}
