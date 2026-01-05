import 'package:flutter/material.dart';

class UploadFotoBox extends StatelessWidget {
  const UploadFotoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0B4D3C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.image, color: Colors.white, size: 40),
          SizedBox(height: 8),
          Text(
            "Klik untuk upload foto\nFormat JPG, PNG (Max 2MB)",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
