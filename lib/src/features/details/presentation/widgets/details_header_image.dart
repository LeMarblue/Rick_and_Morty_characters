import 'package:flutter/material.dart';

class DetailsHeaderImage extends StatelessWidget {
  DetailsHeaderImage({this.characterImage});
  final String characterImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Image.network(
        characterImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
