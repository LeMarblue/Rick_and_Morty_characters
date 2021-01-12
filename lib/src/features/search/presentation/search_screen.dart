import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';
import 'package:rick_and_morty_characters/src/core/presentation/widgets/secondary_loader.dart';
import 'package:rick_and_morty_characters/src/core/routes/named_routes.dart';
import 'package:rick_and_morty_characters/src/features/details/data/details_screen_arguments.dart';
import 'package:rick_and_morty_characters/src/features/search/blocs/search_bloc.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchBloc = SearchBloc();
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.black45,
              ),
              border: InputBorder.none,
            ),
            cursorColor: Colors.black,
            style: TextStyle(
              color: Colors.black,
            ),
            onSubmitted: (String value) {
              searchBloc.firstSearch(value);
            },
          ),
        ),
        body: StreamBuilder<List<Character>>(
          stream: searchBloc.filteredCharacterStream,
          builder: (context, snapshot) {
            if (snapshot.hasError == true) {
              return Center(
                child: Text('has an error'),
              );
            } else {
              if (snapshot.hasData == false) {
                if (searchBloc.searchTerm.isEmpty) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/portal.gif',
                        ),
                        Text('Who do you want to bring from the multiverse?')
                      ],
                    ),
                  );
                }
                return SecondaryLoader();
              } else {
                final filteredCharacters = snapshot.data;
                return ListView.builder(
                  itemCount: filteredCharacters.length,
                  itemBuilder: (context, index) {
                    final character = filteredCharacters[index];
                    if (index == filteredCharacters.length - 1) {
                      searchBloc.getFilteredCharacters();
                      if (searchBloc.isFinalPage == false) {
                        return SecondaryLoader();
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
        ));
  }
}
