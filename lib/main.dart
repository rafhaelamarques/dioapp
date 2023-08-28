import 'package:dioapp/ui/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DioApp());
}

class DioApp extends StatelessWidget {
  const DioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
