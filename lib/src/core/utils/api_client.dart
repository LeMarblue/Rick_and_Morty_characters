import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';

class ApiClient {
  final urlBase = 'https://rickandmortyapi.com/api';

  Future<List<Character>> fetchCharacters({int pageIndex = 1}) async {
    final response = await http.get('$urlBase/character/?page=$pageIndex');
    // https://rickandmortyapi.com/api/character/?page=
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final results = body['results'];
      final characters = Character.fromList(results);
      return characters;
    } else {
      return null;
    }
  }
}
