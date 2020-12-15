import 'dart:async';

import 'package:rick_and_morty_characters/src/core/data/character_model.dart';
import 'package:rick_and_morty_characters/src/core/utils/api_client.dart';

class CatalogBloc {
  final _apiClient = ApiClient();
  final _charactersStreamController = StreamController<List<Character>>();

  Stream<List<Character>> get characterStream =>
      _charactersStreamController.stream;

  void getCharacters() async {
    var charactersList = await _apiClient.fetchCharacters();
    _charactersStreamController.sink.add(charactersList);
  }

  void throwError() {
    _charactersStreamController.sink.addError('Algo falló');
  }

  void dispose() {
    _charactersStreamController.close();
  }
}
