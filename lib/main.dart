// main.dart
import 'package:e_carnet/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const CarnetVaccinationApp());
}

class CarnetVaccinationApp extends StatelessWidget {
  const CarnetVaccinationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Carnet de Vaccination',
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}


