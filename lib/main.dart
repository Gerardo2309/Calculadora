import 'package:calculadora/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( const MyCalculadora());
}

class MyCalculadora extends StatelessWidget{
  const MyCalculadora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: HomeScreen(),
    );

  }

}