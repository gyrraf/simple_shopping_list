import 'package:flutter/material.dart';
import 'package:simple_shopping_list/core/theme/home_dimensions.dart';
import 'package:simple_shopping_list/features/home/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        extensions: [HomeDimensions()],
      ),
      home: const HomePage(
        title: 'Flutter Demo Home Page',
      ), //TODO: find a different solution for the title.
    );
  }
}
