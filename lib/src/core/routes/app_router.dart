import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_characters/src/core/routes/named_routes.dart';
import 'package:rick_and_morty_characters/src/features/catalog/presentation/catalog_screen.dart';
import 'package:rick_and_morty_characters/src/features/details/data/details_screen_arguments.dart';
import 'package:rick_and_morty_characters/src/features/details/presentation/details_screen.dart';
import 'package:rick_and_morty_characters/src/features/search/presentation/search_screen.dart';

class AppRouter {
  Map<String, WidgetBuilder> get routes => {
        NamedRoutes.catalog: (context) => CatalogScreen(),
        NamedRoutes.details: (context) {
          final DetailsScreenArguments arguments =
              ModalRoute.of(context).settings.arguments;

          return DetailsScreen(
            character: arguments.character,
          );
        },
        NamedRoutes.search: (context) => SearchScreen(),
      };
}
