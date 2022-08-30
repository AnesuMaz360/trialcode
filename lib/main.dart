import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trialcode/homeScreen.dart';
import 'package:trialcode/product.dart';
import 'package:trialcode/product_provider.dart';
import 'package:trialcode/shopping_cart_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => ProductProvider()),
        ),
        ChangeNotifierProvider(
          create: (context) => ShoppingCartProvider(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.white), home: const HomePage()),
    );
  }
}
