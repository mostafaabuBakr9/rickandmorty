import 'package:flutter/material.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_character_item.dart';

class CharactersGridViewBuilder extends StatelessWidget {
  final List characters;
  const CharactersGridViewBuilder({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
