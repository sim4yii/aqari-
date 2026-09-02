import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/welcome_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart' as mapbox;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  mapbox.MapboxOptions.setAccessToken(token);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: GoogleFonts.montserratTextTheme(),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 4, 53, 58),
                  brightness: isDarkMode ? Brightness.dark : Brightness.light,
                ),
              ),
              home: const WelcomePage(),
            );
          },
        );
      },
    );
  }
}
