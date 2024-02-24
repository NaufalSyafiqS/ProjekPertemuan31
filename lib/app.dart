import 'package:flutter/material.dart';
import 'backdrop.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'model/product.dart';

class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  late Category _currentCategory;

  @override
  void initState() {
    super.initState();
    _currentCategory = Category.all;
  }

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NAUFAL SS 24',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => const LoginPage(),
        '/': (BuildContext context) => Backdrop(
          currentCategory: _currentCategory,
          frontLayer: HomePage(category: _currentCategory),
          backLayer: Container(color: kShrinePink100),
          frontTitle: Text('Alliance'),
          backTitle: Text('MENU'),
          onCategoryTap: _onCategoryTap, // Passing callback here
        ),
      },
      theme: _buildShrineTheme(),
    );
  }

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: kShrinePink100,
        onPrimary: kShrineBrown900,
        secondary: kShrineBrown900,
        error: kShrineErrorRed,
      ),
      textTheme: _buildShrineTextTheme(base.textTheme),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: kShrinePink100,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: kShrineBrown900,
        backgroundColor: kShrinePink100,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: kShrineBrown900,
          ),
        ),
        floatingLabelStyle: TextStyle(
          color: kShrineBrown900,
        ),
      ),
    );
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base.copyWith(
      headline6: base.headline6!.copyWith(
        fontWeight: FontWeight.w500,
      ),
      headline5: base.headline5!.copyWith(
        fontSize: 18.0,
      ),
      bodyText2: base.bodyText2!.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
      bodyText1: base.bodyText1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    ).apply(
      fontFamily: 'Rubik',
      displayColor: kShrineBrown900,
      bodyColor: kShrineBrown900,
    );
  }
}

void main() {
  runApp(const ShrineApp());
}
