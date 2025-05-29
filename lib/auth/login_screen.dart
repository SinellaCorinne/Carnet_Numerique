// connexion_page.dart
import 'package:e_carnet/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../composants/Boutton.dart';
import '../composants/text_field.dart';
import '../pages/agentScreen1.dart';
import '../theme/style.dart';
import 'package:e_carnet/carnet.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Medical prescription-bro.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 40),
                      Text("Connexion!",
                          style: KTypography.h3(context, color: KColors.secondary),
                          textAlign: TextAlign.center),
                      SizedBox(height: 20),
                      Textfield(
                        controller: emailController,
                        name: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer un email';
                          } else if (!isValidEmail(value)) {
                            return 'Format d\'email invalide';
                          }
                          return null; // Pas d'erreur
                        },
                      ),
                      SizedBox(height: 15),
                      Textfield(
                        controller: passwordController,
                        name: "Password",
                        suffixIcon: Icon(Iconsax.password_check,
                            color: KColors.secondary),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer un mot de passe';
                          } else if (!isValidPassword(value)) {
                            return 'Le mot de passe doit contenir au moins 8 caractères, une lettre majuscule et un chiffre';
                          }
                          return null; // Pas d'erreur
                        },
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        child: Text("Mot de passe oublié?",
                            style: KTypography.h6(context,
                                color: KColors.primary)),
                        onPressed: () => Get.to(LoginScreen()),
                      ),
                      SizedBox(height: 20),
                      isLoading
                          ? CircularProgressIndicator(color: KColors.primary)
                          : Boutton(
                          child: Text("Se connecter"),
                          onPressed: () => Get.to(Carnet()),
                          backgroundColor: KColors.tertiary,
                          borderColor: KColors.tertiary,
                          foregroundColor: Colors.white),
                      SizedBox(height: 10),
                      const Text('Ou'),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.qr_code),
                            SizedBox(width: 8),
                            Text('Accès parent via QR Code'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Validation de l'email correspondant au format exemple@gmail.com
  bool isValidEmail(String email) {
    String emailPattern = r'^[^@]+@[^@]+\.[^@]+$';
    return RegExp(emailPattern).hasMatch(email);
  }

  // Validation du mot de passe qui doit avoir minimum 8 caractères, une lettre majuscule et un chiffre
  bool isValidPassword(String password) {
    return RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$').hasMatch(password);
  }
}
