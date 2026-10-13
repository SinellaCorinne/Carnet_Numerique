import 'package:e_carnet/composants/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../composants/Boutton.dart';
import '../composants/vaccin_controller.dart';
import '../theme/style.dart';

class FichePatientScreen extends StatelessWidget {
  const FichePatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Fiche du patient",
          style: KTypography.h3(context, color: KColors.secondary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoSection(Icons.person, "Nom", "Awa", context),
                _infoSection(Icons.cake, "Âge", "2 ans", context),
                const SizedBox(height: 20),
                _sectionTitle(Icons.vaccines, "Vaccins reçus", context),
                _vaccinCard(Iconsax.calendar, "BCG", "15 Janv", context),
                const SizedBox(height: 10),
                _sectionTitle(Icons.vaccines_outlined, "Vaccins à venir", context),
                _vaccinCard(Iconsax.calendar, "Pentavalent", "15 Juin", context),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 15,
                  runSpacing: 12,
                  children: [
                    Boutton(
                      onPressed: () => Get.to(() =>  AjouterDoseScreen()),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Iconsax.add_circle, size: 18),
                          SizedBox(width: 6),
                          Text('Ajouter une dose'),
                        ],
                      ),
                    ),
                    Boutton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.picture_as_pdf, size: 18),
                          SizedBox(width: 6),
                          Text('Générer PDF'),
                        ],
                      ),
                    ),
                    Boutton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.qr_code_2, size: 18),
                          SizedBox(width: 6),
                          Text('Partager QR Code'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoSection(IconData icon, String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: KColors.secondary),
          const SizedBox(width: 10),
          Text('$label : $value', style: KTypography.h5(context, color: KColors.secondary)),
        ],
      ),
    );
  }

  Widget _sectionTitle(IconData icon, String title, BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: KColors.secondary),
        const SizedBox(width: 10),
        Text(title, style: KTypography.h5(context, color: KColors.secondary)),
      ],
    );
  }

  Widget _vaccinCard(IconData icon, String vaccin, String date, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Icon(icon, color: KColors.secondary),
            const SizedBox(width: 10),
            Text(
              vaccin,
              style: KTypography.h6(context, color: Colors.grey[800]),
            ),
            const Spacer(),
            Text(
              date,
              style: KTypography.h6(context, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}



class AjouterDoseScreen extends StatelessWidget {
  final VaccinController vaccinController = Get.put(VaccinController());

  AjouterDoseScreen({super.key});

  final TextEditingController nomController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController lotController = TextEditingController();
  final TextEditingController agentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Ajouter une dose",
          style: KTypography.h3(context, color: KColors.secondary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Textfield(
                  name: 'Nom du Vaccin',
                  obscureText: false,
                  controller: nomController,
                ),
                const SizedBox(height: 12),
                Textfield(
                  name: "Date d'administration",
                  obscureText: false,
                  controller: dateController,
                ),
                const SizedBox(height: 12),
                Textfield(
                  name: 'Numéro de lot',
                  obscureText: false,
                  controller: lotController,
                ),
                const SizedBox(height: 12),
                Textfield(
                  name: 'Agent de santé',
                  obscureText: false,
                  controller: agentController,
                ),
                const SizedBox(height: 24),
                Boutton(
                  onPressed: () {
                    Vaccin nouveauVaccin = Vaccin(
                      nom: nomController.text,
                      dateAdministration: dateController.text,
                      numeroLot: lotController.text,
                      agentVaccinateur: agentController.text,
                    );
                    vaccinController.ajouterVaccin(nouveauVaccin);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Iconsax.check, size: 18),
                      SizedBox(width: 6),
                      Text('Ajouter'),
                    ],
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
