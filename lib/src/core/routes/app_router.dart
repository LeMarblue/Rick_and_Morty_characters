import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_characters/src/core/routes/named_routes.dart';
import 'package:rick_and_morty_characters/src/features/catalog/presentation/catalog_screen.dart';

class AppRouter {
  Map<String, WidgetBuilder> get routes => {
        NamedRoutes.catalog: (context) => CatalogScreen(),
      };
}
