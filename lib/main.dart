import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/screens/add_recipe_screen/add_recipe_screen.dart';
import 'package:recipe_app/shared/constants.dart';
import 'package:recipe_app/widgets/home_screen_widgets/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            foregroundColor: colorFloralWhite,
            backgroundColor: colorBrownTeddy),
      ),
      home: const RecipePage(title: 'Recipes'),
    );
  }
}

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  List<Widget> tabWidgets = [];
  int initialTabIndex = recipesPage;

  Future<void> selectTab(int index) async {
    if (index == initialTabIndex) {
      navigationKeys[initialTabIndex]?.currentState?.popUntil(
            (route) => route.isFirst,
          );
    } else {
      setState(
        () {
          initialTabIndex = index;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBrownTeddy,
      appBar: AppBar(
        elevation: 3,
        title: Text(
          widget.title,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton:
          // Material(
          //   elevation: 100,
          //   type: MaterialType.transparency,
          //   child: Ink(
          //     decoration: const BoxDecoration(
          //       color: colorBrown,
          //       shape: BoxShape.circle,
          //     ),
          //     child: InkWell(
          //       borderRadius: BorderRadius.circular(1000),
          //       child: const Padding(
          //         padding: EdgeInsets.all(20),
          //         child: Icon(
          //           Icons.add,
          //           size: 30,
          //           color: colorFloralWhite,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          FloatingActionButton(
        elevation: 8,
        backgroundColor: colorBrown,
        onPressed: () {
          //use this for reference of how to use firebase
          DatabaseReference _testRef =
              FirebaseDatabase.instance.ref().child('test');
          _testRef.set('Hello world ${Random().nextInt(100)}');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const AddRecipeScreen()),
            ),
          );
        },
        tooltip: 'Create Recipe',
        child: const Icon(Icons.add, color: colorFloralWhite),
      ),
      bottomNavigationBar: BottomNavBar(
        const Key('BottomNavBar'),
        initialTabIndex,
        (int index) {
          selectTab(index);
        },
      ),
    );
  }
}
