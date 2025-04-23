import 'package:flutter/material.dart';

class WidgetKey {
  ///page
  static const loginPage = Key('loginPage');

  ///bottom navigation
  static const homeBottomNav = Key('homeBottomNav');
  static const flowBottomNav = Key('flowBottomNav');
  static const notificationBottomNav = Key('notificationBottomNav');
  static const accountBottomNav = Key('accountBottomNav');

  ///component
  static const workflowList = Key('workflowList');
  static const skipOnboard = Key('skipOnboard');
  static const backButton = Key('backButton');
  static const email = Key('email');
  static const password = Key('password');
  static const loginButton = Key('loginButton');
  static const logoutButton = Key('logoutButton');
  static const continueLogoutButton = Key('continueLogoutButton');
  static const settingButton = Key('settingButton');
}
