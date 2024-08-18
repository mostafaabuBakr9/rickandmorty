import 'package:flutter/material.dart';
import 'package:rickandmorty/Constants/colors.dart';
import 'package:rickandmorty/Data_layer/Models/characters.dart';
import 'package:rickandmorty/Presentation_layer/Widgets/character_status.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          //  color: MyColors.grey
        ),
        child: GridTile(
            child: Container(
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder:
                          'Assets/Images/Animation - 1723938728730.gif',
                      image: character.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('Assets/Images/no-image-available.jpg'),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black38,
              title: Text(
                '${character.name}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            header: Container(
              child: GridTileBar(
                  trailing: Text(
                    '${character.gender}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.black26,
                  leading: CharacterStatus(character: character),
                  title: Text(
                    '${character.status}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            )));
  }
}


// Container(
//             // height: double.minPositive,
//             padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             color: MyColors.grey,
//             alignment: Alignment.center,
//             child: Row(
//               children: [
//                 Text(
//                   '${character.status}-${character.gender}',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: MyColors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           )