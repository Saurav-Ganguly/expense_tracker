import 'package:expense_tracker/widgets/expenses.dart';
//import 'package:flutter/services.dart'; //lock screen orientation
import 'package:flutter/material.dart';

// global variables are defined with k
// seed / base color scheme
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //from services dart
  //SystemChrome.setPreferredOrientations(
  //[
  // DeviceOrientation.portraitUp,
  //],
  //).then((fn) {

  //});

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //dark mode
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          // card theme
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme, //color scheeme
        appBarTheme: const AppBarTheme().copyWith(
          // app bar theme
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          // card theme
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
                titleLarge: const TextStyle().copyWith(
              fontWeight: FontWeight.bold,
              color: kColorScheme.onSecondaryContainer,
              fontSize: 20,
            )),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
