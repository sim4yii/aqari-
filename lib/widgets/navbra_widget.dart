import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';

class NavbraWidget extends StatelessWidget {
  const NavbraWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),

            NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
            NavigationDestination(
              icon: Icon(Icons.design_services),
              label: 'Service',
            ),
            NavigationDestination(icon: Icon(Icons.smart_toy), label: 'Ai'),
          ],
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
