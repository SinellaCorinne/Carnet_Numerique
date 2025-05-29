import 'package:e_carnet/composants/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../composants/Boutton.dart';
import '../theme/style.dart';

class FichePatientScreen extends StatelessWidget {
  const FichePatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        backgroundColor: KColors.secondary,
        title: Text(
          'Fiche du patient',
          style: KTypography.h3(context, color: Colors.white),
        )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 6,
          shadowColor: Colors.grey.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nom: Awa ',
                    style: KTypography.h5(context, color: KColors.secondary)),
                const SizedBox(height: 20),
                Text('Âge: 2 ans ',
                    style: KTypography.h5(context, color: KColors.secondary)),
                const SizedBox(height: 20),
                Text('Vaccins reçus :',
                    style: KTypography.h5(context, color: KColors.secondary)),
                const SizedBox(height: 8),
                Text(
                  '• BCG (15 Janv)',
                  style: KTypography.h6(context, color: KColors.secondary),
                ),
                const SizedBox(height: 20),
                Text('Vaccins à venir :',
                    style: KTypography.h5(context, color: KColors.secondary)),
                const SizedBox(height: 8),
                Text(
                  '• Pentavalent (15 Juin)',
                  style: KTypography.h6(context, color: KColors.secondary),
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 15,
                  children: [
                    Boutton(
                      onPressed: () => Get.to(() => AjouterDoseScreen()),
                      child: const Text('Ajouter une dose'),
                    ),
                    Boutton(
                      onPressed: () {},
                      child: const Text('Générer PDF'),
                    ),
                    Boutton(
                      onPressed: () {},
                      child: const Text('Partager QR Code'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Ajout d’un vaccin (dose)
class AjouterDoseScreen extends StatelessWidget {
  const AjouterDoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: KColors.secondary,
          title: Text(
            'Ajouter une dose',
            style: KTypography.h3(context, color: Colors.white),
          )), body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Textfield(name: 'Nom du Vaccin'),
            SizedBox(
              height: 10,
            ),
            Textfield(name: "Date d'administration "),
            SizedBox(
              height: 10,
            ),
            Textfield(name: 'Numéro de lot'),
            SizedBox(
              height: 10,
            ),
            Textfield(name: 'Agent'),
            SizedBox(height: 24),
            Boutton(
              onPressed: () => Get.to(FichePatientScreen()),
              child: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
