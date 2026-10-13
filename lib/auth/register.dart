import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../composants/Boutton.dart';
import '../composants/text_field.dart';
import '../theme/style.dart';
import 'package:e_carnet/carnet.dart';
import 'login_screen.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/Medical prescription-bro.png",
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                Text(
                  "Créer un compte",
                  style: KTypography.h2(context, color: KColors.secondary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Nom
                Textfield(
                  controller: nomController,
                  name: "Nom",
                  obscureText: false,
                  prefixIcon: Icon(Icons.person_outline, color: KColors.primary),
                  keyboardType: TextInputType.name,
                  validator: (value) => value == null || value.length < 2 ? 'Le nom doit contenir au moins 2 caractères' : null,
                ),
                const SizedBox(height: 16),
                // Prénom
                Textfield(
                  controller: prenomController,
                  name: "Prénom",
                  obscureText: false,
                  prefixIcon: Icon(Icons.person_outline, color: KColors.primary),
                  keyboardType: TextInputType.name,
                  validator: (value) => value == null || value.length < 2 ? 'Le prénom doit contenir au moins 2 caractères' : null,
                ),
                const SizedBox(height: 16),
                // Email
                Textfield(
                  controller: emailController,
                  name: "Email",
                  obscureText: false,
                  prefixIcon: Icon(Icons.email_outlined, color: KColors.primary),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                  value == null || !isValidEmail(value) ? 'Format d\'email invalide' : null,
                ),
                const SizedBox(height: 16),

                // Téléphone
                Textfield(
                  controller: phoneController,
                  name: "Téléphone",
                  obscureText: false,
                  prefixIcon: Icon(Icons.phone_outlined, color: KColors.primary),
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                  value == null || !isValidPhone(value) ? 'Format de téléphone invalide' : null,
                ),
                const SizedBox(height: 16),

                // Mot de passe
                Textfield(
                  controller: passwordController,
                  name: "Mot de passe",
                  obscureText: true,
                  prefixIcon: Icon(Icons.lock_outline, color: KColors.primary),
                  suffixIcon: Icon(Iconsax.password_check, color: KColors.secondary),
                  validator: (value) => value == null || !isValidPassword(value)
                      ? 'Le mot de passe doit contenir au moins 8 caractères, une majuscule et un chiffre'
                      : null,
                ),
                const SizedBox(height: 16),

                // Confirmation mot de passe
                Textfield(
                  controller: confirmPasswordController,
                  name: "Confirmer le mot de passe",
                  obscureText: true,
                  prefixIcon: Icon(Icons.lock_outline, color: KColors.primary),
                  suffixIcon: Icon(Iconsax.password_check, color: KColors.secondary),
                  validator: (value) => value != passwordController.text
                      ? 'Les mots de passe ne correspondent pas'
                      : null,
                ),
                const SizedBox(height: 16),

                // Conditions d’utilisation
                Row(
                  children: [
                    Checkbox(
                      value: acceptTerms,
                      onChanged: (bool? value) {
                        setState(() => acceptTerms = value ?? false);
                      },
                      activeColor: KColors.primary,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => acceptTerms = !acceptTerms),
                        child: RichText(
                          text: TextSpan(
                            style: KTypography.h6(context),
                            children: [
                              const TextSpan(text: 'J\'accepte les '),
                              TextSpan(
                                text: 'conditions d\'utilisation',
                                style: KTypography.h6(context, color: KColors.primary),
                              ),
                              const TextSpan(text: ' et la '),
                              TextSpan(
                                text: 'politique de confidentialité',
                                style: KTypography.h6(context, color: KColors.primary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Bouton inscription
                isLoading
                    ? CircularProgressIndicator(color: KColors.primary)
                    : Boutton(
                  child: const Text("S'inscrire", style: TextStyle(fontSize: 16)),
                  onPressed: _submitForm,
                  backgroundColor: KColors.tertiary,
                  borderColor: KColors.tertiary,
                  foregroundColor: Colors.white,
                ),
                const SizedBox(height: 16),

                // Lien connexion
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Vous avez déjà un compte ?', style: KTypography.h6(context)),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Get.to(LoginScreen()),
                      child: Text('Se connecter', style: KTypography.h6(context, color: KColors.primary)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;

    if (!acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez accepter les conditions d'utilisation"), backgroundColor: Colors.red),
      );
      return;
    }

    setState(() => isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Inscription réussie !"), backgroundColor: Colors.green),
      );

      Get.to( Carnet());
    });
  }

  bool isValidEmail(String email) =>
      RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email);

  bool isValidPassword(String password) =>
      RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$').hasMatch(password);

  bool isValidPhone(String phone) =>
      RegExp(r'^[\+]?[0-9]{8,15}$').hasMatch(phone.replaceAll(' ', ''));

  @override
  void dispose() {
    nomController.dispose();
    prenomController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
