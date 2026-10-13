import 'package:e_carnet/auth/profil_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../composants/Boutton.dart';
import '../composants/text_field.dart';
import '../theme/style.dart';
import 'package:e_carnet/carnet.dart';
import 'forget_password.dart';

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
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFfdfbfb), Color(0xFFebedee)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Card(
                  elevation: 10,
                  shadowColor: KColors.secondary.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 36),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/Medical prescription-bro.png",
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Connexion",
                          style: KTypography.h2(context,
                              color: KColors.secondary),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Textfield(
                          obscureText: false,
                          controller: emailController,
                          name: "Email",
                          prefixIcon:
                          Icon(Icons.email_outlined, color: KColors.primary),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer un email';
                            } else if (!isValidEmail(value)) {
                              return 'Format d\'email invalide';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Textfield(
                          controller: passwordController,
                          name: "Mot de passe",
                          obscureText: true,
                          prefixIcon:
                          Icon(Icons.lock_outline, color: KColors.primary),
                          suffixIcon: Icon(Iconsax.password_check,
                              color: KColors.secondary),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer un mot de passe';
                            } else if (!isValidPassword(value)) {
                              return 'Le mot de passe doit contenir au moins 8 caractères, une majuscule et un chiffre';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() =>  ForgetPassword());
                            },
                            child: Text("Mot de passe oublié ?",
                                style: KTypography.h6(context,
                                    color: KColors.primary)),
                          ),
                        ),
                        const SizedBox(height: 12),
                        isLoading
                            ? CircularProgressIndicator(color: KColors.primary)
                            : Boutton(
                          child: Text("Se connecter",
                              style: TextStyle(fontSize: 16)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });

                              // Simuler une connexion
                              Future.delayed(Duration(seconds: 2), () {
                                setState(() {
                                  isLoading = false;
                                });
                                Get.to(Carnet());
                              });
                            }
                          },
                          backgroundColor: KColors.tertiary,
                          borderColor: KColors.tertiary,
                          foregroundColor: Colors.white,
                        ),
                        const SizedBox(height: 16),
                        const Text('Ou'),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            // TODO: Implémenter l'accès QR Code
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.qr_code, color: KColors.secondary),
                              const SizedBox(width: 8),
                              Text(
                                'Accès parent via QR Code',
                                style: KTypography.h6(context,
                                    color: KColors.secondary),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Lien vers la page d'inscription
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pas encore de compte ? ',
                              style: KTypography.h6(context),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ProfilUser());
                              },
                              child: Text(
                                'S\'inscrire',
                                style: KTypography.h6(context,
                                    color: KColors.primary,
                                   ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isValidEmail(String email) {
    String emailPattern = r'^[^@]+@[^@]+\.[^@]+$';
    return RegExp(emailPattern).hasMatch(email);
  }

  bool isValidPassword(String password) {
    return RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$').hasMatch(password);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}