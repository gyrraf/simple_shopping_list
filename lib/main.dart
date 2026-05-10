import 'package:flutter/material.dart';
import 'package:simple_shopping_list/core/theme/edit_dimensions.dart';
import 'package:simple_shopping_list/core/theme/home_dimensions.dart';
import 'package:simple_shopping_list/features/home/presentation/home_page.dart';
import 'package:simple_shopping_list/l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String _generateTitle(BuildContext context) {
    return AppLocalizations.of(context)!.appName;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: _generateTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        extensions: [HomeDimensions(), EditDimensions()],
      ),
      home: const HomePage(),
    );
  }
}
