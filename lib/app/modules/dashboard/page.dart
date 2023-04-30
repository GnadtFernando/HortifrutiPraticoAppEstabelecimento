import 'package:app_painel_hortifruti_pratico/app/modules/dashboard/controller.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/home/page.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/order_list/page.dart';
import 'package:app_painel_hortifruti_pratico/app/modules/user_profile/page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetResponsiveView<DashboardController> {
  DashboardPage({super.key});

  @override
  Widget desktop() {
    return Scaffold(
      body: Obx(
        () => Row(
          children: [
            NavigationRail(
              selectedIndex: controller.currentPageIndex.value,
              onDestinationSelected: controller.changePageIndex,
              labelType: NavigationRailLabelType.all,
              leading: const FlutterLogo(
                size: 48,
                style: FlutterLogoStyle.stacked,
              ),
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.explore_outlined),
                  label: Text('Início'),
                  selectedIcon: Icon(Icons.explore),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.view_list_outlined),
                  label: Text('Produtos'),
                  selectedIcon: Icon(Icons.view_list),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outlined),
                  label: Text('Configurar'),
                  selectedIcon: Icon(Icons.person),
                ),
              ],
            ),
            Expanded(child: _body())
          ],
        ),
      ),
    );
  }

  @override
  Widget phone() {
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            onDestinationSelected: controller.changePageIndex,
            selectedIndex: controller.currentPageIndex.value,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                label: 'Início',
                selectedIcon: Icon(Icons.explore),
              ),
              NavigationDestination(
                icon: Icon(Icons.view_list_outlined),
                label: 'Produtos',
                selectedIcon: Icon(Icons.view_list),
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outlined),
                label: 'Configurar',
                selectedIcon: Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: Obx(
          () => _body(),
        ));
  }

  IndexedStack _body() {
    return IndexedStack(
      index: controller.currentPageIndex.value,
      children: [
        OrderListPage(),
        const HomePage(),
        const UserProfilePage(),
      ],
    );
  }
}
