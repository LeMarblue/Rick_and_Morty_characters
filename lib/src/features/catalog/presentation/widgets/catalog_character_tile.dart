import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';
import 'package:rick_and_morty_characters/src/core/routes/named_routes.dart';
import 'package:rick_and_morty_characters/src/features/details/data/details_scren_arguments.dart';

class CatalogCharacterTile extends StatelessWidget {
  CatalogCharacterTile({this.character});
  final Character character;
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(
          NamedRoutes.details,
          arguments: DetailsScreenArguments(
            character: character,
          ),
        );
      },
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          character.image,
        ),
      ),
      title: Text('${character.name}'),
    );
  }
}
