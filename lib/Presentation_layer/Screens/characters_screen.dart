import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/Constants/colors.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/character_item.dart';
import 'package:rickandmorty/bloc/cubit/characters_cubit.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List allChaeacters;
  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
    super.initState();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allChaeacters = state.characters;
          print(allChaeacters);
          return buildLoadedListWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.yellow,
      ),
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        // color: MyColors.grey,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.698,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      shrinkWrap: true,
      itemCount: allChaeacters.length,
      physics: const ClampingScrollPhysics(),
      // padding: EdgeInsets.all(value),
      itemBuilder: (context, index) {
        return CharacterItem(
          character: allChaeacters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Rick and Morty',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Color.fromRGBO(0, 0, 0, 1)),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: buildBlocWidget(),
    );
  }
}
