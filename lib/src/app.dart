import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/presentation/theme/app_theme.dart';
import 'package:rick_and_morty_characters/src/core/routes/app_router.dart';
import 'package:rick_and_morty_characters/src/core/routes/named_routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty Catalog',
      routes: router.routes,
      initialRoute: NamedRoutes.catalog,
      theme: AppTheme.dark,
    );
  }
}
