import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';
import 'package:rick_and_morty_characters/src/core/routes/named_routes.dart';
import 'package:rick_and_morty_characters/src/features/catalog/blocs/catalog_bloc.dart';
import 'package:rick_and_morty_characters/src/features/details/data/details_scren_arguments.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catalogBloc = CatalogBloc();
    catalogBloc.getCharacters();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Characters',
        ),
      ),
      body: StreamBuilder<List<Character>>(
        stream: catalogBloc.characterStream,
        builder: (context, snapshot) {
          if (snapshot.hasError == true) {
            return Center(
              child: Text('An error has ocurred'),
            );
          } else {
            if (snapshot.hasData == false) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final characters = snapshot.data;
              return ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  if (index == characters.length - 1) {
                    catalogBloc.getCharacters();
                    if (catalogBloc.isfinalPage == false) {
                      return Container(
                        padding: EdgeInsets.only(bottom: 12),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  }
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
                },
              );
            }
          }
        },
      ),
    );
  }
}
