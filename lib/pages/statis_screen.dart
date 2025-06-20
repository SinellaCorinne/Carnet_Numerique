import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/style.dart';

class StatistiquesScreen extends StatelessWidget {
  const StatistiquesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "Statistiques",
          style: KTypography.h3(context, color: KColors.secondary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Résumé', style: KTypography.h4(context, color: KColors.secondary)),
            const SizedBox(height: 12),

            // Stat cards
            Row(
              children: const [
                _StatCard(
                  label: 'Vaccinés',
                  value: '300',
                  icon: Iconsax.profile_tick,
                  color: KColors.secondary,
                ),
                SizedBox(width: 12),
                _StatCard(
                  label: 'Couverture',
                  value: '85%',
                  icon: Iconsax.chart_2,
                  color: KColors.secondary,
                ),
                SizedBox(width: 12),
                _StatCard(
                  label: 'Agents',
                  value: '20',
                  icon: Iconsax.user_cirlce_add,
                  color: KColors.secondary,
                ),
              ],
            ),

            const SizedBox(height: 28),
            Text('Graphique', style: KTypography.h4(context, color: KColors.secondary)),
            const SizedBox(height: 12),

            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: KColors.beige,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[300]!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  '📊 Graphique à venir',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 28),
            Text('Filtres', style: KTypography.h4(context, color: KColors.secondary)),
            const SizedBox(height: 12),

            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: const [
                _FilterChip(label: 'Période : Juin'),
                _FilterChip(label: 'Type : Tous'),
              ],
            ),

            const SizedBox(height: 28),
            Text('SMS de rappel', style: KTypography.h4(context, color: KColors.secondary)),
            const SizedBox(height: 12),

            // Ajout de la section SMS de rappel
            const _SMSReminderCard(),
          ],
        ),
      ),
    );
  }
}

class _SMSReminderCard extends StatelessWidget {
  const _SMSReminderCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Modèle de notification",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: KColors.secondary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "💉 Prochain vaccin de Awa prévu pour le 15 mai. Merci de vous présenter au centre de santé.",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: const [
                Chip(
                  label: Text('📅'),
                ),
                Chip(
                  label: Text('📲'),
                ),
                Chip(
                  label: Text('🍼'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        color: Colors.white,
        shadowColor: color.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 30),
              const SizedBox(height: 12),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color.withOpacity(0.7),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;

  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      labelStyle: const TextStyle(color: KColors.secondary),
      backgroundColor: Colors.grey.shade200,
      shape: StadiumBorder(
        side: BorderSide(color: KColors.secondary.withOpacity(0.5)),
      ),
    );
  }
}
