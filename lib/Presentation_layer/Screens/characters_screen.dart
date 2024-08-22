import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/Data_layer/Models/characters.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/characters_grid_view_builder.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_app_bar.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_character_pagination.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_loading_indicator.dart';
import 'package:rickandmorty/bloc_layer/cubit/characters_cubit.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character> allChaeacters = [];
  List<Character> searchList = [];
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool issearching = false;
  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters(pageNumber: 1);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // Iam Created this widget when i faced problem {PreferredSizeWidget? appBar}
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
                    searchList.clear();
                    Navigator.pop(context);
                  });
                } else {
                  setState(() {
                    issearching = true;
                    startSearch();
                  });
                }
              },
              searchList: (p0) {
                searchList = p0;
                setState(() {});
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
                    child: CharactersGridViewBuilder(
                      controller: scrollController,
                      characters: issearching ? searchList : allChaeacters,
                    ),
                  ),
                  ScrollToHide(
                    hideDirection: Axis.vertical,
                    
                    height: 50,
                    scrollController: scrollController,
                    child: CustomCharacterPagination(
                      //Call Back Function To upadate page number in Block (rcive data from cild class CustomCharacterPagination)
                      pagenum: (number) {
                        setState(() {
                          BlocProvider.of<CharactersCubit>(context)
                              .getAllCharacters(pageNumber: number);
                        });
                      },
                      numOfPages: 42,
                    ),
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
