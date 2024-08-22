// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rickandmorty/Presentation_layer/Widgets/custom_character_item.dart';

class CharactersGridViewBuilder extends StatelessWidget {
  final List characters;
  ScrollController? controller;
  CharactersGridViewBuilder({
    Key? key,
    required this.characters,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.698,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      shrinkWrap: true,
      itemCount: characters.length,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return CharacterItem(
          character: characters[index],
        );
      },
    );
  }
}
