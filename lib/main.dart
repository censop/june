import 'package:flutter/material.dart';
import 'package:june/Screens/home_page.dart';
import 'package:june/Theme/my_theme.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "June",
      navigatorObservers: [routeObserver],
      home: HomePage(),
      theme: MyTheme.lightTheme,
    );
  }
}
