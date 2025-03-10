import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wiz/hiii/dummy.dart';
import 'package:wiz/hiii/video.dart';
import 'package:wiz/screens/choose.dart';
import 'package:wiz/screens/home_student.dart';
import 'package:wiz/screens/home_educator.dart';
import 'package:wiz/screens/login.dart';
import 'package:wiz/screens/register.dart';
import 'package:wiz/screens/upload_files.dart';
import 'package:wiz/screens/video.dart';
import 'package:wiz/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      home: Video(),
    );
  }
}



