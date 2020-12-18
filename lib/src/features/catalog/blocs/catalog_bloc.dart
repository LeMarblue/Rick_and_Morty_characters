import 'dart:async';

import 'package:rick_and_morty_characters/src/core/data/character_model.dart';
import 'package:rick_and_morty_characters/src/core/utils/api_client.dart';

class CatalogBloc {
  final _apiClient = ApiClient();
  final _charactersStreamController = StreamController<List<Character>>();
  final _allCharactersList = <Character>[];
  var _pageIndex = 1;
  var _isFinalPage = false;

  bool get isFinalPage => _isFinalPage;

  Stream<List<Character>> get characterStream =>
      _charactersStreamController.stream;

  void getCharacters() async {
    if (_isFinalPage == false) {
      var charactersList =
          await _apiClient.fetchCharacters(pageIndex: _pageIndex);
      if (charactersList == null) {
        _isFinalPage = true;
      } else {
        _pageIndex = _pageIndex + 1;
        _allCharactersList.addAll(charactersList);
      }
    }
    _charactersStreamController.sink.add(_allCharactersList);
  }

  void throwError() {
    _charactersStreamController.sink.addError('Algo falló');
  }

  void dispose() {
    _charactersStreamController.close();
  }
}
