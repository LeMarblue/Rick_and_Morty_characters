import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';
import 'package:rick_and_morty_characters/src/core/presentation/theme/app_colors.dart';

class CharacterInfoSheet extends StatelessWidget {
  CharacterInfoSheet({@required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32.0),
        ),
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: AppColors.tertiaryColor,
            offset: Offset(0.0, -2.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: 24,
        left: 24,
        right: 24,
        bottom: 36,
      ),
      // width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            character.name,
            style: textTheme.headline4,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            character.statusAsString,
            style: textTheme.subtitle2,
          ),
          SizedBox(
            height: 36,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Species',
                      style: textTheme.bodyText1,
                    ),
                    Text(
                      character.species,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Type',
                      style: textTheme.bodyText1,
                    ),
                    Text(
                      character.type.isNotEmpty ? character.type : '?',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Gender',
                      style: textTheme.bodyText1,
                    ),
                    Text(
                      character.genderAsString,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Origin',
                      style: textTheme.bodyText1,
                    ),
                    Text(
                      character.origin,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Location',
                      style: textTheme.bodyText1,
                    ),
                    Text(
                      character.location,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
