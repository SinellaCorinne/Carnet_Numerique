import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../theme/style.dart';

class VueParentScreen extends StatelessWidget {
  const VueParentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          "Carnet de l'intéressé",
          style: KTypography.h3(context, color: KColors.secondary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 4,
          shadowColor: Colors.grey.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nom: Awa',
                  style: KTypography.h4(context, color: Colors.black87),
                ),
                const SizedBox(height: 12),
                Text(
                  'Âge: 2 ans',
                  style: KTypography.h5(context, color: Colors.black54),
                ),
                const Divider(height: 32, thickness: 1.2),

                Text(
                  '✅ Vaccins reçus',
                  style: KTypography.h5(context, color: KColors.secondary),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Iconsax.shield_tick, size: 18, color: Colors.green),
                    const SizedBox(width: 8),
                    Text(
                      'BCG (15 Janv)',
                      style: KTypography.h6(context, color: Colors.black87),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                Text(
                  '⏳ Vaccins à venir',
                  style: KTypography.h5(context, color: KColors.secondary),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Iconsax.clock, size: 18, color: Colors.orange),
                    const SizedBox(width: 8),
                    Text(
                      'Pentavalent (15 Juin)',
                      style: KTypography.h6(context, color: Colors.black87),
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
}
