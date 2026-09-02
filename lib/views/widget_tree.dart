import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/service_page.dart';
import 'package:flutter_app/views/pages/settings_page.dart';
import 'package:flutter_app/views/pages/home_page.dart';

import 'package:flutter_app/widgets/navbra_widget.dart' show NavbraWidget;
import 'package:flutter_app/widgets/propertymap_widget.dart';

import 'pages/profile_page.dart';

List<Widget> pages = [
  HomePage(),
  PropertyMapWidget(),
  ProfilePage(),
  ServicePage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aqari+'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),

      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      bottomNavigationBar: NavbraWidget(),
    );
  }
}
