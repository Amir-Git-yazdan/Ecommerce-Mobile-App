import 'package:dribble_bicycle_shopping_cart/screens/home_screen.dart';
import 'package:dribble_bicycle_shopping_cart/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bicycle Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Bicycle Shop'),
      home: SplashScreen(),
      // home: CartScreen(),
      routes: {
        'home': (context) => MyHomePage(title: 'Bicycle Shop'),
      },
    );
  }
}
