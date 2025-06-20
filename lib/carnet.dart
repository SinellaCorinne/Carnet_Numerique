import 'package:e_carnet/pages/agentScreen1.dart';
import 'package:e_carnet/pages/nouveau_carnet.dart';
import 'package:e_carnet/pages/parentScreen.dart';
import 'package:e_carnet/pages/statis_screen.dart';
import 'package:e_carnet/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'carnet_controller.dart';

class Carnet extends StatelessWidget {
  final CarnetController controller = Get.put(CarnetController.instance);

  Carnet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Assurez-vous que cette couleur est cohérente
      body: Obx(() => IndexedStack(
        index: controller.curentIndex,
        children: const [
          DashboardAgentScreen(),
          NouveauCarnetScreen(),
          StatistiquesScreen(),
        ],
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.curentIndex,
        onTap: controller.updateCurentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: KColors.secondary,
        unselectedItemColor: Colors.grey,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Nouveau Carnet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      )),
    );
  }
}
