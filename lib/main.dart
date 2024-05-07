import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/details_screen.dart';
import 'package:news/home_screen.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        DetailsScreen.routeName:(_)=>const DetailsScreen(),
      },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
