import 'package:flutter/material.dart';
import 'package:rick_and_morty_characters/src/features/catalog/presentation/widgets/catalog_list_view.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Characters',
        ),
      ),
      body: CatalogListView(),
    );
  }
}
