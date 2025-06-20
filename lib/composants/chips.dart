import 'package:flutter/material.dart';
import '../../theme/style.dart'; // Assurez-vous que le chemin est correct

class Filtres extends StatefulWidget {
  const Filtres({super.key});

  @override
  State<Filtres> createState() => _FiltresState();
}

class _FiltresState extends State<Filtres> {
  final List<String> categories = [
    "Tous",
    "À vacciner",
    "En retard",
  ];

  String selectedCategory = "Tous";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: FilterChip(
                label: Text(cat),
                labelStyle: TextStyle(
                  color: selectedCategory == cat ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                selected: selectedCategory == cat,
                onSelected: (_) {
                  setState(() {
                    selectedCategory = cat;
                    // Ajoutez ici une logique pour notifier le widget parent ou filtrer la liste
                  });
                },
                backgroundColor: Colors.grey[200],
                selectedColor: KColors.secondary.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          );
        },
      ),
    );
  }
}
