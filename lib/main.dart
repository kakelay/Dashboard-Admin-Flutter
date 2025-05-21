import 'package:admin_dashboard/app/modules/screens/no_internet_screen/root_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/controllers/MenuAppController.dart';
import 'app/cores/themes/theme_provider.dart';
import 'constants.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuAppController()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: bgColorLight,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ).apply(bodyColor: Colors.black),
            canvasColor: Colors.grey[200],
          ),
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColorDark,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ).apply(bodyColor: Colors.white),
            canvasColor: secondaryColorDark,
          ),
          home: const RootPage(),
        );
      },
    );
  }
}
