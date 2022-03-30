import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:wiz/utils/colors.dart';

import '../resources/auth_methods.dart';

class choose extends StatelessWidget {
  final Map<String, String> inputs;
  final Uint8List image;
  choose({Key? key,required this.inputs,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 64, 16, 64),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image(
              image: NetworkImage(
                'https://i.imgur.com/yquLHlI.png',
              ),
              height: 256,
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              'Pick your Lead',
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 0),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Select your role as an Educator or a Learner',
              style:
                  TextStyle(fontSize: 16, letterSpacing: 0, color: Colors.grey),
            ),
            SizedBox(
              height: 72,
            ),
            //learners Button
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all(purple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              onPressed: () async {
                String res = await AuthMethods().signupUser(
                  name: inputs["name"]!,
                  email: inputs["email"]!,
                  password: inputs["password"]!,
                  regdNo: inputs["regdNo"]!,
                  file: image,
                );
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Learner',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24,),
            //Educators Button
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all(purple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Educator',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
