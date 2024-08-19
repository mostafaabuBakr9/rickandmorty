import 'package:rickandmorty/Data_layer/Api/characters_web_services.dart';
import 'package:rickandmorty/Data_layer/Models/characters.dart';

class CharactersRepository {
  CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});

  Future<List<dynamic>> getAllCharacters({required int pageNumber}) async {
    final characters = await charactersWebServices.getAllCharacters(
        path: 'character?page=$pageNumber');

    return characters
        .map((characters) => Character.fromJson(characters))
        .toList();
  }

  Future getCountofPages() async {
    final count = await charactersWebServices.getCountofPages();

    return count;
  }
}
