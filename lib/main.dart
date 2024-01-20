import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'SHOPPING APP',
        home: const HomePage(),
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            textTheme: const TextTheme(
                titleMedium:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                titleLarge:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(254, 206, 1, 1),
                primary: const Color.fromRGBO(254, 206, 1, 1)),
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
