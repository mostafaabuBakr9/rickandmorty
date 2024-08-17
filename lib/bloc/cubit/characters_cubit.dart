import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rickandmorty/Data_layer/Models/characters.dart';
import 'package:rickandmorty/Data_layer/Repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Characters>? allCharacters;

  CharactersCubit(
    this.charactersRepository,
  ) : super(CharactersInitial());
  List<Characters> getAllCharacters() {
    charactersRepository.getAllCharacters().then(
      (characters) {
        emit(CharactersLoaded(characters: characters));
        allCharacters = characters.cast();
      },
    );
    return allCharacters ?? [];
  }
}
