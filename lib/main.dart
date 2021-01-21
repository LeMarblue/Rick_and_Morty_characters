import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty_characters/src/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(App()));
}
