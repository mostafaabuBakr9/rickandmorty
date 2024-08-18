import 'package:rickandmorty/Data_layer/Api/characters_web_services.dart';
import 'package:rickandmorty/Data_layer/Models/characters.dart';

class CharactersRepository {
  CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});

  Future<List<dynamic>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();

    return characters
        .map((characters) => Character.fromJson(characters))
        .toList();
  }
}
