import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/Constants/String.dart';
import 'package:rickandmorty/Data_layer/Api/characters_web_services.dart';
import 'package:rickandmorty/Data_layer/Repository/characters_repository.dart';
import 'package:rickandmorty/Presentation_layer/Screens/character_details_screen.dart';
import 'package:rickandmorty/Presentation_layer/Screens/characters_screen.dart';
import 'package:rickandmorty/bloc_layer/cubit/characters_cubit.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository =
        CharactersRepository(charactersWebServices: CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );

      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
  }
}
