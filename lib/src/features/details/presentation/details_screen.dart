import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/core/data/character_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        backgroundColor: Color(0xff477385),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.network(character.image),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              // width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    character.statusAsString,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('Species'),
                            Text(character.species),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Type'),
                            Text(character.type.isNotEmpty
                                ? character.type
                                : '?'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Gender'),
                            Text(character.genderAsString),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('Origin'),
                            Text(character.origin),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('Location'),
                            Text(character.location),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
