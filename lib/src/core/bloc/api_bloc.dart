import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';

class ApiBloc {
  final urlBase = 'https://rickandmortyapi.com/api';

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get('$urlBase/character');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final results = body['results'];
      final characters = Character.fromList(results);
      print(characters);
      return characters;
    } else {
      return null;
    }
  }
}
