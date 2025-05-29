// Vue Parent
import 'package:flutter/material.dart';

import '../theme/style.dart';

class VueParentScreen extends StatelessWidget {
  const VueParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: KColors.secondary,
          title: Text(
            "Carnet de l'interessé",
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

                  ],
                )
          ),
            ),
          ),
        );

  }
}