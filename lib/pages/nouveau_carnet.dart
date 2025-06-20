import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../composants/Boutton.dart';
import '../composants/text_field.dart';
import '../theme/style.dart';


class NouveauCarnetScreen extends StatelessWidget {
  const NouveauCarnetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: KColors.secondary,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Nouveau Carnet",
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Textfield(
                  name: 'Nom',
                  obscureText: false,
                  prefixIcon:Icon(Iconsax.user) ,
                ),
                const SizedBox(height: 12),
                Textfield(
                  name: 'Prénom',
                  obscureText: false,
                  prefixIcon:Icon(Iconsax.user) ,
                ),
                const SizedBox(height: 12),
                Textfield(
                  name: 'Date de naissance',
                  obscureText: false,
                  prefixIcon:Icon(Iconsax.calendar) ,
                ),
                const SizedBox(height: 12),
                Textfield(
                  name: 'Sexe',
                  obscureText: false,
                  prefixIcon:Icon(Iconsax.favorite_chart),
                ),
                const SizedBox(height: 12),
                Textfield(
                  name: 'Nom du parent',
                  obscureText: false,
                  prefixIcon:Icon(Iconsax.user) ,
                ),
                const SizedBox(height: 12),
                Textfield(
                  name: 'Adresse',
                  obscureText: false,
                  prefixIcon:Icon(Iconsax.home) ,
                ),
                const SizedBox(height: 12),
                Textfield(
                  name: 'Téléphone',
                  obscureText: false,
                  prefixIcon:Icon(Iconsax.call) ,
                ),
                const SizedBox(height: 24),
                Boutton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Iconsax.save_2, size: 18),
                      SizedBox(width: 8),
                      Text('Enregistrer'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Iconsax.calendar_1, size: 18),
                  label: Text(
                    'Générer calendrier vaccinal automatiquement',
                    style: KTypography.h6(context, color: KColors.primary),
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
