import 'package:e_carnet/composants/Boutton.dart';
import 'package:flutter/material.dart';

import '../composants/text_field.dart';
import '../theme/style.dart';

class NouveauCarnetScreen extends StatelessWidget {
  const NouveauCarnetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: KColors.secondary,
          title: Text(
            'Nouveau carnet',
            style: KTypography.h3(context, color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Textfield(name: 'Nom '),
            SizedBox(
              height: 10,
            ),
            Textfield(name: 'Prénom'),
            SizedBox(
              height: 10,
            ),
            Textfield(name: 'Date de naissance '),
            SizedBox(
              height: 10,
            ),
            Textfield(name: 'Sexe '),
            SizedBox(
              height: 10,
            ),
            Textfield(name: 'Nom du parent'),
            SizedBox(
              height: 10,
            ),
            Textfield(name: 'Adresse'),
            SizedBox(
              height: 10,
            ),
            Textfield(name: 'Téléphone '),
            SizedBox(
              height: 10,
            ),
            const SizedBox(height: 24),
            Boutton(
              onPressed: () {},
              child: const Text('Enregistrer'),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Générer calendrier vaccinal automatiquement',
                style: KTypography.h6(context, color: KColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
