// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rickandmorty/Data_layer/Models/characters.dart';

class CharacterStatus extends StatelessWidget {
  final Character character;
  CharacterStatus({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (character.status == 'Alive') {
      return Image.asset(
        alignment: Alignment.center,
        'Assets/Icons/status-Alive.png',
        height: 12,
        width: 12,
      );
    } else if (character.status == 'Dead') {
      return Image.asset(
        alignment: Alignment.center,
        'Assets/Icons/status-dead.png',
        height: 12,
        width: 12,
      );
    } else {
      return Image.asset(
        alignment: Alignment.center,
        'Assets/Icons/status-unknown.png',
        height: 12,
        width: 12,
      );
    }
  }
}
