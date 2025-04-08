import 'package:admin_dashboard/screens/main/main_screen.dart';
import 'package:admin_dashboard/screens/theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'controllers/MenuAppController.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuAppController()),
        ChangeNotifierProvider(
            create: (context) => ThemeProvider()), // Add ThemeProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Admin Panel',
          themeMode: themeProvider.themeMode, // Apply ThemeMode
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: bgColorLight,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.black),
            canvasColor: Colors.grey[200],
          ),
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColorDark,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: secondaryColorDark,
          ),
          home: const MainScreen(),
        );
      },
    );
  }
}
