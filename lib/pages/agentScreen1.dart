import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../composants/Boutton.dart';
import '../theme/style.dart';
import 'fiche_patient.dart';
import 'nouveau_carnet.dart';

class DashboardAgentScreen extends StatelessWidget {
  const DashboardAgentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: KColors.secondary,
          title: Text("eCarnet",style: KTypography.h3(context,color:Colors.white),),
        ),
        // On supprime l'appBar pour tout mettre dans le body
        body: SafeArea(
          child: Column(
            children: [
              // Titre
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Tableau de bord agent',
                  style: KTypography.h3(context, color: Colors.black),
                ),
              ),

              // TabBar
              TabBar(
                tabs: const [
                  Tab(text: 'Tous'),
                  Tab(text: 'À vacciner'),
                  Tab(text: 'En retard'),
                ],
                indicatorColor: KColors.secondary,
                labelColor: KColors.secondary,
                unselectedLabelColor: Colors.grey,
                dividerColor: KColors.secondary,
              ),


              // Contenu des onglets
              const Expanded(
                child: TabBarView(
                  children: [
                    PatientListView(category: 'Tous'),
                    PatientListView(category: 'À vacciner'),
                    PatientListView(category: 'En retard'),
                  ],
                ),
              ),

              // Bouton Ajouter un carnet
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Boutton(
                  onPressed: () => Get.to(() => const NouveauCarnetScreen()),
                  child: const Text('Ajouter un carnet'),
                ),
              ),

            ],
          ),
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
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre et sous-titre en haut
                Text(
                  'Patient $index',
                  style: KTypography.h4(context, color: KColors.secondary),
                ),
                const SizedBox(height: 4),
                Text(
                  'Âge: 3 ans • Rappel: 15 juin',
                  style: KTypography.h5(context, color: KColors.secondary),
                ),

                const SizedBox(height: 12),

                // Bouton en bas aligné à droite
                Align(
                  alignment: Alignment.bottomRight,
                  child: Boutton(
                    onPressed: () => Get.to(() => const FichePatientScreen()),
                    child: const Text('Fiche'),
                  ),
                ),
              ],
            ),
          ),
        );

      },
    );
  }
}
