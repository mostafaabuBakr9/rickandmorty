import 'package:flutter/material.dart';
import 'package:rickandmorty/Data_layer/Models/characters.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/character_status.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/custom_character_dialog.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomCharacterDialog(
              character: character,
            );
          },
        );
      },
      child: Container(
          margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          //The Line below use to cut any thing from child widget over from container
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            //  color: MyColors.grey
          ),
          child: GridTile(
              footer: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Colors.black54,
                alignment: Alignment.bottomCenter,
                child: Text(
                  character.name,
                  style: const TextStyle(
                    height: 1.3,
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              header: GridTileBar(
                  trailing: Text(
                    character.gender,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  backgroundColor: Colors.black26,
                  leading: CharacterStatus(character: character),
                  title: Text(
                    character.status,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              child: Container(
                child: character.image.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        placeholder:
                            'Assets/Images/Animation - 1723938728730.gif',
                        image: character.image,
                        fit: BoxFit.cover,
                      )
                    : Image.asset('Assets/Images/no-image-available.jpg'),
              ))),
    );
  }
}
