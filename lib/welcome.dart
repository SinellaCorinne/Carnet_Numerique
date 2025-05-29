import 'package:e_carnet/composants/Boutton.dart'; // Assure-toi que ce fichier contient bien un widget custom appelé Boutton
import 'package:e_carnet/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Dégradé d'arrière-plan
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [KColors.secondary, KColors.secondary], // Exemple avec 2 couleurs différentes
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Contenu
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bienvenue dans votre carnet numérique !",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Boutton(
                  child: Text("Commencer"),
                  onPressed: () => Get.to(LoginScreen()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
