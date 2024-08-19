import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rickandmorty/Data_layer/Models/characters.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_divider_row.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_row.dart';

class CustomCharacterDialog extends StatelessWidget {
  final Character character;
  CustomCharacterDialog({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Container(
                child: character.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        placeholder:
                            'Assets/Images/Animation - 1723938728730.gif',
                        image: character.image,
                        fit: BoxFit.fitWidth,
                      )
                    : Image.asset('Assets/Images/no-image-available.jpg'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  character.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDividerRow(textValue: 'PROPERTIES'),
                const SizedBox(
                  height: 10,
                ),
                CustomRow(property: 'Gender', value: character.gender),
                SizedBox(
                  height: 10,
                ),
                CustomRow(property: 'Species', value: character.species),
                const SizedBox(
                  height: 10,
                ),
                CustomRow(property: 'Status', value: character.status),
                const SizedBox(
                  height: 10,
                ),
                CustomDividerRow(textValue: 'WHEREABOUTS'),
                const SizedBox(
                  height: 10,
                ),
                CustomRow(property: 'Origin', value: character.origin.name),
                const SizedBox(
                  height: 10,
                ),
                CustomRow(property: 'Location', value: character.location.name)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
