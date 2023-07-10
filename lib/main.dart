import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/providers/itemStore.dart';
import 'package:provider_practice/screen/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Itemstore(),
      child: MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Provider Practice'),
              centerTitle: true,
            ),
            body: MainScreen()),
      ),
    );
  }
}
