import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'secret.dart';
import 'home_widget.dart';

Future<void> main() async {
  Secret credentials = await SecretLoader(secretPath: "credentials.json").load();
  final FirebaseApp app = await FirebaseApp.configure(name: 'db', options: FirebaseOptions(googleAppID: credentials.googleAppID, apiKey: credentials.apiKey, databaseURL: credentials.databaseURL));
  runApp(App(firebaseApp: app,));
}

class App extends StatelessWidget {
  final FirebaseApp firebaseApp;

  App({this.firebaseApp});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Chiron', home: Home(), theme: ThemeData(
      iconTheme: IconThemeData(
        opacity: 0.5
      )
    ));
  }
}
