import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';
import 'package:rick_and_morty_characters/src/features/details/presentation/widgets/character_info_sheet.dart';
import 'package:rick_and_morty_characters/src/features/details/presentation/widgets/details_header_image.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            DetailsHeaderImage(
              characterImage: character.image,
            ),
            Positioned(
              bottom: 0,
              child: CharacterInfoSheet(
                character: character,
              ),
            )
          ],
        ),
      ),
    );
  }
}
