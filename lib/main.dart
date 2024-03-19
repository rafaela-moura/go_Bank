import 'package:flutter/material.dart';
import 'package:go_bank/utils/app_palette.dart';
import 'package:go_bank/utils/routes.dart';
import 'package:go_bank/view/current_view.dart';
import 'package:go_bank/view/home_view.dart';
import 'package:go_bank/view/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Bank',
      theme: ThemeData(
        fontFamily: 'Open Sans',
        colorScheme: ColorScheme.fromSeed(seedColor: AppPalette.primary),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      routes: {
        RoutesApp.HOME: (context) => const HomeView(),
        RoutesApp.PROFILE: (context) => const ProfileView(),
        RoutesApp.CURRENT: (context) => const CurrentView(),
      },
      initialRoute: RoutesApp.HOME,
    );
  }
}
