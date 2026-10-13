import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../composants/Boutton.dart';
import '../composants/text_field.dart';
import '../theme/style.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool emailSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: KColors.secondary),
          onPressed: () => Get.back(),
        ),
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
                        // Icône selon l'état
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: emailSent
                              ? Container(
                            key: ValueKey('success'),
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.mark_email_read_outlined,
                              size: 60,
                              color: Colors.green,
                            ),
                          )
                              : Container(
                            key: ValueKey('initial'),
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: KColors.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.lock_reset,
                              size: 60,
                              color: KColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Titre selon l'état
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: Text(
                            emailSent ? "Email envoyé !" : "Mot de passe oublié ?",
                            key: ValueKey(emailSent ? 'sent' : 'forgot'),
                            style: KTypography.h2(context,
                                color: KColors.secondary),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Description selon l'état
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: Text(
                            emailSent
                                ? "Un email de réinitialisation a été envoyé à votre adresse email. Vérifiez votre boîte de réception et suivez les instructions."
                                : "Entrez votre adresse email et nous vous enverrons un lien pour réinitialiser votre mot de passe.",
                            key: ValueKey(emailSent ? 'sent_desc' : 'forgot_desc'),
                            style: KTypography.h6(context,
                                color: Colors.grey[600]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Formulaire ou message de succès
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: emailSent
                              ? Column(
                            key: ValueKey('success_content'),
                            children: [
                              // Bouton retour à la connexion
                              Boutton(
                                child: Text("Retour à la connexion",
                                    style: TextStyle(fontSize: 16)),
                                onPressed: () => Get.back(),
                                backgroundColor: KColors.tertiary,
                                borderColor: KColors.tertiary,
                                foregroundColor: Colors.white,
                              ),
                              const SizedBox(height: 16),

                              // Bouton renvoyer
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    emailSent = false;
                                  });
                                },
                                child: Text(
                                  "Renvoyer l'email",
                                  style: KTypography.h6(context,
                                      color: KColors.primary),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Aide
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.blue.withOpacity(0.3),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.info_outline,
                                            color: Colors.blue, size: 20),
                                        SizedBox(width: 8),
                                        Text("Conseils",
                                            style: KTypography.h6(context,
                                                color: Colors.blue,
                                                )),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "• Vérifiez votre dossier spam\n• L'email peut prendre quelques minutes\n• Contactez le support si besoin",
                                      style: KTypography.h5(context,
                                          color: Colors.blue[700]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                              : Column(
                            key: ValueKey('form_content'),
                            children: [
                              // Champ email
                              Textfield(
                                obscureText: false,
                                controller: emailController,
                                name: "Adresse email",
                                prefixIcon: Icon(Icons.email_outlined,
                                    color: KColors.primary),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Veuillez entrer votre email';
                                  } else if (!isValidEmail(value)) {
                                    return 'Format d\'email invalide';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 24),

                              // Bouton envoyer
                              isLoading
                                  ? CircularProgressIndicator(
                                  color: KColors.primary)
                                  : Boutton(
                                child: Text("Envoyer le lien",
                                    style: TextStyle(fontSize: 16)),
                                onPressed: () {
                                  if (_formKey.currentState!
                                      .validate()) {
                                    _sendResetEmail();
                                  }
                                },
                                backgroundColor: KColors.tertiary,
                                borderColor: KColors.tertiary,
                                foregroundColor: Colors.white,
                              ),
                              const SizedBox(height: 20),

                              // Retour à la connexion
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_back,
                                      size: 16, color: KColors.primary),
                                  const SizedBox(width: 4),
                                  GestureDetector(
                                    onTap: () => Get.back(),
                                    child: Text(
                                      'Retour à la connexion',
                                      style: KTypography.h6(context,
                                          color: KColors.primary),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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

  void _sendResetEmail() {
    setState(() {
      isLoading = true;
    });

    // Simuler l'envoi d'email
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
        emailSent = true;
      });

      // Afficher un message de succès
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email de réinitialisation envoyé !'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    });
  }

  bool isValidEmail(String email) {
    String emailPattern = r'^[^@]+@[^@]+\.[^@]+$';
    return RegExp(emailPattern).hasMatch(email);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}