import 'package:e_carnet/pages/agentScreen1.dart';
import 'package:e_carnet/pages/parentScreen.dart';
import 'package:e_carnet/pages/statis_screen.dart';
import 'package:e_carnet/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'carnet_controller.dart';

class Carnet extends StatelessWidget {
  final CarnetController controller = Get.put(CarnetController.instance);

  Carnet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.secondary,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() => IndexedStack(
              index: controller.curentIndex,
              children: [
                DashboardAgentScreen(),
                VueParentScreen(),
                StatistiquesScreen(),
              ],
            )),
      ),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          index: controller.curentIndex,
          height: 60,
          backgroundColor: Colors.white, // couleur de fond du contenu
          color: KColors.secondary, // couleur de la barre elle-même
          buttonBackgroundColor: KColors.secondary,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            controller.updateCurentIndex(index);
          },
          items: const <Widget>[
            Icon(Icons.home_outlined, size: 30, color: Colors.white),
            Icon(Icons.people, size: 30, color: Colors.white),
            Icon(Icons.auto_graph, size: 30, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
