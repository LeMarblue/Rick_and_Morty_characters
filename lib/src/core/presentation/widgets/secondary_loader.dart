import 'package:flutter/material.dart';

class SecondaryLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 12),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Image.asset(
          'assets/secondary_loader.gif',
          height: 48,
          width: 48,
        ),
      ),
    );
  }
}
