import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChaked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: 'e1', child: Text('elem1')),
                  DropdownMenuItem(value: 'e2', child: Text('elem2')),
                  DropdownMenuItem(value: 'e3', child: Text('elem3')),
                ],
                onChanged: (value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text('snack bar'),
                    ),
                  );
                },
                child: Text('Open Snack bar'),
              ),
              Divider(color: Colors.teal, thickness: 5.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alert title'),
                        content: Text('Alert content'),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // closes the dialog
                            },
                            child: Text('close'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('snack bar'),
              ),

              TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              Text(controller.text),
              Checkbox.adaptive(
                tristate: true,
                value: isChaked,
                onChanged: (bool? value) {
                  setState(() {
                    isChaked = value;
                  });
                },
              ),
              CheckboxListTile.adaptive(
                tristate: true,
                title: Text('Click me'),
                value: isChaked,
                onChanged: (bool? value) {
                  setState(() {
                    isChaked = value;
                  });
                },
              ),
              Switch.adaptive(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: Text('Switch me'),
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              ValueListenableBuilder(
                valueListenable: isDarkModeNotifier,
                builder: (context, isDarkMode, child) {
                  return SwitchListTile.adaptive(
                    title: Text('Dark mode'),
                    value: isDarkMode,
                    onChanged: (bool value) {
                      isDarkModeNotifier.value = value;
                    },
                  );
                },
              ),
              Slider.adaptive(
                value: sliderValue,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {
                  print('image selected');
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {},
                child: Text('click me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
