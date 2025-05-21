import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:another_flushbar/flushbar.dart';

import 'package:admin_dashboard/app/modules/screens/internet_screens/no_internet_page.dart';
import 'package:admin_dashboard/app/modules/screens/main_screen/main_screen.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  bool isConnected = true;
  bool isConnectionChecked = false;

  late final StreamSubscription<List<ConnectivityResult>> _subscription;

  @override
  void initState() {
    super.initState();

    // Listen for connectivity changes
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

    // Do initial check
    checkInitialConnection();
  }

  Future<void> checkInitialConnection() async {
    bool online = html.window.navigator.onLine ?? false;
    final result = await Connectivity().checkConnectivity();
    final bool newStatus = (result != ConnectivityResult.none) && online;

    if (mounted) {
      setState(() {
        isConnected = newStatus;
        isConnectionChecked = true;
      });
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
    if (!isConnectionChecked) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return isConnected ? const MainScreen() : const NoInternetPage();
  }
}
