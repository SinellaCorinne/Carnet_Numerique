import 'package:e_carnet/composants/Boutton.dart';
import 'package:e_carnet/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [KColors.secondary, KColors.primary],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Illustration
                Image.asset(
                  "assets/images/Medical prescription-bro.png",
                  width: 220,
                  height: 220,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),

                // Titre
                Text(
                  "Bienvenue\n dans votre carnet numérique !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 30),

                // Bouton Commencer
                Boutton(
                  child: const Text(
                    "Commencer",
                    style: TextStyle(fontSize: 16),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: KColors.secondary,
                  borderColor: Colors.white,
                  onPressed: () => Get.to(() => const LoginScreen()),
                ),

                const SizedBox(height: 16),

                // Optionnel : petite description
                Text(
                  "Accédez facilement à vos informations de santé.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
