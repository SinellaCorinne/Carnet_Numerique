import 'package:flutter/material.dart';
import '../theme/style.dart';

class StatistiquesScreen extends StatelessWidget {
  const StatistiquesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.secondary,
        title: Text(
          'Statistiques',
          style: KTypography.h3(context, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Résumé',
              style: KTypography.h4(context, color: KColors.secondary),
            ),
            const SizedBox(height: 12),

            // Cartes statistiques
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatCard(
                  label: 'Enfants vaccinés',
                  value: '300',
                  icon: Icons.child_care,
                  color: KColors.secondary,
                ),
                _StatCard(
                  label: 'Couverture',
                  value: '85%',
                  icon: Icons.show_chart,
                  color: KColors.secondary,
                ),
                _StatCard(
                  label: 'Agents actifs',
                  value: '20',
                  icon: Icons.people,
                  color: KColors.secondary,
                ),
              ],
            ),

            const SizedBox(height: 24),

            Text(
              'Graphique',
              style: KTypography.h4(context, color: KColors.secondary),
            ),
            const SizedBox(height: 12),

            Container(
              height: 200,
              decoration: BoxDecoration(
                color: KColors.beige,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: KColors.secondary.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Graphique ici',
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Filtres',
              style: KTypography.h4(context, color: KColors.secondary),
            ),
            const SizedBox(height: 12),

            _FilterRow(label: 'Période', value: 'Juin'),
            _FilterRow(label: 'Type de vaccin', value: 'Tous'),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        shadowColor: color.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              Icon(icon, color: color, size: 36),
              const SizedBox(height: 12),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(color: color.withOpacity(0.7), fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  final String label;
  final String value;

  const _FilterRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            '$label :',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: KColors.secondary,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
