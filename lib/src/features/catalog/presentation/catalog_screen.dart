import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/bloc/api_bloc.dart';
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  List<Character> characters;

  @override
  void initState() {
    final apiBloc = ApiBloc();
    apiBloc.fetchCharacters().then((value) => setState(() {
          characters = value;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Characters'),
      ),
      body: characters == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${characters[index].name}'),
                );
              },
            ),
    );
  }
}
