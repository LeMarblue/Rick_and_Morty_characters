import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';
import 'package:rick_and_morty_characters/src/core/presentation/widgets/main_loader.dart';
import 'package:rick_and_morty_characters/src/core/presentation/widgets/secondary_loader.dart';
import 'package:rick_and_morty_characters/src/features/catalog/blocs/catalog_bloc.dart';
import 'package:rick_and_morty_characters/src/features/catalog/presentation/widgets/catalog_character_tile.dart';

class CatalogListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catalogBloc = CatalogBloc();
    Timer(Duration(seconds: 5), catalogBloc.getCharacters);

    return StreamBuilder<List<Character>>(
      stream: catalogBloc.characterStream,
      builder: (context, snapshot) {
        if (snapshot.hasError == true) {
          return Center(
            child: Text('An error has ocurred'),
          );
        } else {
          if (snapshot.hasData == false) {
            return MainLoader();
          } else {
            final characters = snapshot.data;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                if (index == characters.length - 1) {
                  catalogBloc.getCharacters();
                  if (catalogBloc.isFinalPage == false) {
                    return SecondaryLoader();
                  }
                }
                return CatalogCharacterTile(
                  character: character,
                );
              },
            );
          }
        }
      },
    );
  }
}
