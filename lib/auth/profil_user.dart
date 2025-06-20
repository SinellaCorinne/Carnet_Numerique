import 'package:e_carnet/auth/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../composants/Boutton.dart';
import '../theme/style.dart';

class ProfilUser extends StatefulWidget {
  const ProfilUser({super.key});

  @override
  State<ProfilUser> createState() => _ProfilUserState();
}

class _ProfilUserState extends State<ProfilUser> with TickerProviderStateMixin {
  String? selectedProfile;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: KColors.secondary),
          onPressed: () => Get.back(),
        ),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
            children: [
              _buildHeader(context),
              const SizedBox(height: 32),
              _buildProfileOption(
                value: "agent",
                title: "Agent de santé",
                description: "Professionnel de santé qui assure les soins et le suivi des patients",
                icon: Icons.medical_services_outlined,
                gradient: [Colors.blue.withOpacity(0.1), Colors.blue.withOpacity(0.05)],
                iconColor: Colors.blue,
              ),
              const SizedBox(height: 16),
              _buildProfileOption(
                value: "responsable",
                title: "Responsable de santé",
                description: "Gestionnaire qui supervise et coordonne les services de santé",
                icon: Icons.admin_panel_settings_outlined,
                gradient: [Colors.green.withOpacity(0.1), Colors.green.withOpacity(0.05)],
                iconColor: Colors.green,
              ),
              const SizedBox(height: 32),
              _buildContinueButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                KColors.primary.withOpacity(0.8),
                KColors.secondary.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.people_alt_outlined, size: 50, color: Colors.white),
        ),
        const SizedBox(height: 24),
        Text(
          "Choisissez votre profil",
          style: KTypography.h2(context, color: KColors.secondary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          "Sélectionnez le type de compte qui correspond à votre fonction",
          style: KTypography.h6(context, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildProfileOption({
    required String value,
    required String title,
    required String description,
    required IconData icon,
    required List<Color> gradient,
    required Color iconColor,
  }) {
    bool isSelected = selectedProfile == value;

    return GestureDetector(
      onTap: () => setState(() => selectedProfile = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSelected
                ? [KColors.primary.withOpacity(0.1), KColors.tertiary.withOpacity(0.05)]
                : gradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? KColors.secondary : Colors.grey, width: isSelected ? 2 : 1),
          boxShadow: isSelected
              ? [const BoxShadow(color: Colors.white, blurRadius: 8, offset: Offset(0, 4))]
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isSelected ? KColors.secondary.withOpacity(0.1) : iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 30, color: isSelected ? KColors.secondary : iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: KTypography.h5(context, color: KColors.secondary)),
                  const SizedBox(height: 4),
                  Text(description, style: KTypography.h6(context, color: Colors.grey[600])),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: isSelected ? KColors.secondary : Colors.grey, width: 2),
                color: isSelected ? KColors.secondary : Colors.transparent,
              ),
              child: isSelected ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: double.infinity,
      child: selectedProfile != null
          ? Boutton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Continuer", style: TextStyle(fontSize: 16)),
            SizedBox(width: 8),
          ],
        ),
        onPressed: _navigateToSignUp,
        backgroundColor: KColors.tertiary,
        borderColor: KColors.tertiary,
        foregroundColor: Colors.white,
      )
          : Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            "Sélectionnez un profil pour continuer",
            style: KTypography.h6(context, color: Colors.grey[600]),
          ),
        ),
      ),
    );
  }

  void _navigateToSignUp() {
    final profileName = selectedProfile == "agent" ? "Agent de santé" : "Responsable de santé";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profil sélectionné : $profileName'),
        backgroundColor: KColors.secondary,
        behavior: SnackBarBehavior.floating,
      ),
    );

    Get.to(() => const Register());
  }
}
