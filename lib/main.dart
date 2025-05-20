import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:another_flushbar/flushbar.dart';

import 'app/controllers/MenuAppController.dart';
import 'app/cores/themes/theme_provider.dart';
import 'app/modules/screens/main_screen/main_screen.dart';
import 'app/modules/screens/no_internet_screen/no_internet_page.dart';
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
  bool isConnected = true;
  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> resultList) {
      final result =
          resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
      final bool newStatus = result != ConnectivityResult.none;

      if (isConnected != newStatus) {
        setState(() => isConnected = newStatus);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          showStatusToast(newStatus);
        });
      }
    });

    checkInitialConnection();
  }

  Future<void> checkInitialConnection() async {
    final result = await Connectivity().checkConnectivity();
    final bool newStatus = result != ConnectivityResult.none;
    if (mounted) {
      setState(() => isConnected = newStatus);
    }
  }

  void showStatusToast(bool isConnected) {
    Flushbar(
      title: isConnected ? 'Connected' : 'No Internet',
      message: isConnected
          ? 'Internet connection restored'
          : 'Internet connection lost',
      backgroundColor: isConnected ? Colors.green : Colors.red,
      icon: Icon(
        isConnected ? Icons.wifi : Icons.wifi_off,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 3),
    ).show(context);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

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
          home: isConnected ? const MainScreen() : const NoInternetPage(),
        );
      },
    );
  }
}
