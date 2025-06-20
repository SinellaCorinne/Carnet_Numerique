import 'package:get/get.dart';

class VaccinController extends GetxController {
  var vaccins = <Vaccin>[].obs;

  void ajouterVaccin(Vaccin nouveauVaccin) {
    if (!vaccins.any((vaccin) => vaccin.isSameAs(nouveauVaccin))) {
      vaccins.add(nouveauVaccin);
      Get.snackbar("Succès", "Dose ajoutée avec succès");
    } else {
      Get.snackbar("Erreur", "Cette dose a déjà été ajoutée");
    }
  }
}

class Vaccin {
  final String nom;
  final String dateAdministration;
  final String numeroLot;
  final String agentVaccinateur;

  Vaccin({
    required this.nom,
    required this.dateAdministration,
    required this.numeroLot,
    required this.agentVaccinateur,
  });

  bool isSameAs(Vaccin autre) {
    return nom == autre.nom &&
        dateAdministration == autre.dateAdministration &&
        numeroLot == autre.numeroLot &&
        agentVaccinateur == autre.agentVaccinateur;
  }
}
