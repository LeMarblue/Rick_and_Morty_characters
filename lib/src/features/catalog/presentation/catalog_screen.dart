import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/bloc/api_bloc.dart';
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';
import 'package:rick_and_morty_characters/src/core/routes/named_routes.dart';
import 'package:rick_and_morty_characters/src/features/details/data/details_scren_arguments.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiBloc = ApiBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Characters',
        ),
      ),
      body: FutureBuilder<List<Character>>(
        future: apiBloc.fetchCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasError == true) {
              return Center(
                child: Text('An error has ocurred'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final character = snapshot.data[index];
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
                      child: Image.network(character.image),
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
