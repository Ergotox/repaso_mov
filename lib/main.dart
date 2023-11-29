import 'package:flutter/material.dart';
import 'package:repaso_mov/navigation/widgets/app_navigation.dart';
import 'package:repaso_mov/public/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 120, 249, 97)),
        useMaterial3: true,
        
      ),
      home: const AppNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}
