import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rickandmorty/Data_layer/Repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;

  CharactersCubit(
    this.charactersRepository,
  ) : super(CharactersInitial());
  void getAllCharacters({required int pageNumber}) {
    charactersRepository.getAllCharacters(pageNumber:pageNumber ).then(
      (characters) {
        emit(CharactersLoaded(characters: characters));
      },
    );
  }
}
