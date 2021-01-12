import 'dart:async';
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';
import 'package:rick_and_morty_characters/src/core/utils/api_client.dart';

class SearchBloc {
  final _apiClient = ApiClient();
  final _allFilteredCharactersList = <Character>[];
  var _pageIndex = 1;
  var _isFinalPage = false;
  var _searchTerm = '';

  bool get isFinalPage => _isFinalPage;
  String get searchTerm => _searchTerm;

  final _filteredCharactersStreamController =
      StreamController<List<Character>>();

  Stream<List<Character>> get filteredCharacterStream =>
      _filteredCharactersStreamController.stream;

  void firstSearch(String searchTerm) {
    _searchTerm = searchTerm;
    _allFilteredCharactersList.clear();
    _pageIndex = 1;
    _isFinalPage = false;
    _filteredCharactersStreamController.add(null);
    getFilteredCharacters();
  }

  void getFilteredCharacters() async {
    if (_isFinalPage == false) {
      var filteredCharactersList = await _apiClient.fetchFilteredCharacter(
        name: _searchTerm,
        pageIndex: _pageIndex,
      );
      if (filteredCharactersList == null) {
        if (_allFilteredCharactersList.isEmpty) {
          _filteredCharactersStreamController.add(null);
        } else {
          _filteredCharactersStreamController.add(_allFilteredCharactersList);
        }

        _isFinalPage = true;
      } else {
        _pageIndex = _pageIndex + 1;
        _allFilteredCharactersList.addAll(filteredCharactersList);
        _filteredCharactersStreamController.add(_allFilteredCharactersList);
      }
    }
  }

  void dispose() {
    _filteredCharactersStreamController.close();
  }
}
