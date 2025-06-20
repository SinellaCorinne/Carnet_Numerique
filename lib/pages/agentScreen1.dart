import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../composants/Boutton.dart';
import '../composants/chips.dart';
import '../theme/style.dart';
import 'fiche_patient.dart';

class DashboardAgentScreen extends StatelessWidget {
  const DashboardAgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: KColors.secondary,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            "eCarnet",
            style: KTypography.h2(context, color: KColors.secondary),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu, color: KColors.secondary),
            onPressed: () {
              // Ajoutez ici la logique pour gérer l'appui sur l'icône du menu
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Iconsax.notification, color: KColors.secondary),
              onPressed: () {
                // Ajoutez ici la logique pour gérer l'appui sur l'icône de notification
              },
            ),
          ],
        ),

        body:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Tableau de bord agent",
                style: KTypography.h3(context, color: Colors.grey[700]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher un patient...',
                  prefixIcon: const Icon(Iconsax.search_normal),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
           Filtres(),
            Expanded(
              child: TabBarView(
                children: [
                  PatientListView(category: 'Tous'),
                  PatientListView(category: 'À vacciner'),
                  PatientListView(category: 'En retard'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientListView extends StatelessWidget {
  final String category;

  const PatientListView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: KColors.secondary.withOpacity(0.1),
                child: const Icon(Iconsax.user, color: KColors.secondary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Patient $index',
                        style: KTypography.h4(context, color: KColors.secondary)),
                    const SizedBox(height: 4),
                    Text('Âge: 3 ans • Rappel: 15 juin',
                        style: KTypography.h5(context, color: Colors.grey[600])),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Iconsax.arrow_right_3, color: KColors.secondary),
                onPressed: () => Get.to(() => const FichePatientScreen()),
              ),
            ],
          ),
        );
      },
    );
  }
}