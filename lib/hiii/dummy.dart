import 'package:flutter/material.dart';
import 'package:wiz/screens/notes.dart';
import 'package:wiz/screens/video.dart';
import 'package:wiz/widgets/assignments.dart';

class dummy extends StatelessWidget {
  const dummy({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:notes()//Assignment(subject: 'Math', deadline: '24th Dec', img: 'https://images.unsplash.com/photo-1648585680959-9532002fb84e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',),
    // );
    );
  }
}