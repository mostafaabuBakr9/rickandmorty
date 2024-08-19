import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/characters_grid_view_builder.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_character_pagination.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_loading_indicator.dart';
import 'package:rickandmorty/bloc_layer/cubit/characters_cubit.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List allChaeacters;
  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters(pageNumber: 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: const Text(
            'Rick and Morty',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state is CharactersLoaded) {
              allChaeacters = state.characters;
              // The Comment Line below i used to Check The List of Characters is not Empty
              // print(allChaeacters);
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: CharactersGridViewBuilder(
                        characters: allChaeacters,
                      ),
                    ),
                  ),
                  const CustomCharacterPagination(
                    numOfPages: 42,
                  ),
                ],
              );
            } else {
              return const CustomLoadingIndicator();
            }
          },
        ));
  }
}


