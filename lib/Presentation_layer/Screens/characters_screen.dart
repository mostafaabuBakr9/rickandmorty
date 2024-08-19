import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/Data_layer/Models/characters.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/characters_grid_view_builder.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_app_bar.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_character_pagination.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_loading_indicator.dart';
import 'package:rickandmorty/bloc_layer/cubit/characters_cubit.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character> allChaeacters = [];
  TextEditingController textEditingController = TextEditingController();

  bool issearching = false;
  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters(pageNumber: 20);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: CustomAppBar(
              issearching: issearching,
              textEditingController: textEditingController,
              allChaeacters: allChaeacters,
              onPressed: () {
                if (issearching == true) {
                  setState(() {
                    issearching = false;
                    stopSearching();
                    Navigator.pop(context);
                  });
                } else {
                  setState(() {
                    issearching = true;
                    startSearch();
                  });
                }
              },
            )),
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state is CharactersLoaded) {
              allChaeacters = state.character.cast();
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

  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));

    setState(() {
      issearching = true;
    });
  }

  void stopSearching() {
    _clearSearch();
    setState(() {
      issearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      textEditingController.clear();
    });
  }
}
