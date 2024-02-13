import 'package:flutter/material.dart';
import 'package:smart_parking_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Smart Parking',
    theme: ThemeData(
      colorScheme:const ColorScheme.light(
        background: Color.fromARGB(255, 0, 0, 0),
        primary: Colors.white,
        secondary: Color.fromARGB(255, 217, 217, 217),
        tertiary: Color.fromARGB(255, 255, 0, 0),
        inversePrimary: Color.fromARGB(255, 0, 255, 0)
      )
    ),
    home: HomePage(),
  );
}
}
