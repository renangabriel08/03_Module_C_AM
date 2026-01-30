import 'package:c1/pages/artists.dart';
import 'package:c1/pages/exhibit.dart';
import 'package:c1/pages/explore.dart';
import 'package:c1/pages/home.dart';
import 'package:c1/pages/ticketing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: 'PlayfairDisplay',
      ),
      routes: {
        '/home': (context) => const Home(),
        '/explore': (context) => const Explore(),
        '/ticketing': (context) => const Ticketing(),
        '/artists': (context) => const Artists(),
        '/exhibit': (context) => const Exhibit(),
      },
      initialRoute: '/home',
    );
  }
}
