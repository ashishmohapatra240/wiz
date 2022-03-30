import 'package:flutter/material.dart';
import 'package:wiz/screens/dummy.dart';
import 'package:wiz/screens/login.dart';
import 'package:wiz/screens/register.dart';
import 'package:wiz/widgets/assignments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      home: dummy(),
    );
  }
}

