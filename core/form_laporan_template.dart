import 'package:flutter/material.dart';
import '../widgets/header_back.dart';
import '../widgets/form_card.dart';

class FormLaporanTemplate extends StatelessWidget {
  final String title;
  const FormLaporanTemplate({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderBack(),
              FormCard(title: title),
            ],
          ),
        ),
      ),
    );
  }
}
