import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiz/resources/auth_methods.dart';
import 'package:wiz/resources/storage_methods.dart';
import 'package:wiz/screens/choose.dart';
import 'package:wiz/screens/login.dart';
import 'package:wiz/utils/colors.dart';
import 'package:wiz/utils/utils.dart';
import 'package:wiz/widgets/text_field_imput.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

Map<String, String> inputs = {};
final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _regdNoController = TextEditingController();
final bool isRegdNo=false;

class _RegisterScreenState extends State<RegisterScreen> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List? im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    showSnackbar(String content, BuildContext context) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(content),
      ));
    }

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 64, 16, 64),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 48, backgroundImage: MemoryImage(_image!))
                      : const CircleAvatar(
                          radius: 48,
                          backgroundImage: NetworkImage(
                            'https://www.linkpicture.com/q/Profile-Picture_2.png',
                          ),
                        ),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () {
                selectImage();
              },
              child: const Text(
                'Add Image',
                style: TextStyle(color: purple),
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            TextFieldInput(
              label: 'Name',
              hintText: '',
              textEditingController: _nameController,
              textInputType: TextInputType.text,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldInput(
              hintText: '',
              textEditingController: _emailController,
              textInputType: TextInputType.text,
              label: 'Email ID',
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldInput(
              hintText: '',
              textEditingController: _passwordController,
              textInputType: TextInputType.text,
              label: 'Password',
              isPass: true,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFieldInput(
              hintText: '',
              textEditingController: _regdNoController,
              textInputType: TextInputType.text,
              label: 'Registration Number',
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                inputs = {
                  "name": _nameController.text,
                  "email": _emailController.text,
                  "password": _passwordController.text,
                };
                if ((inputs["name"] != null && isRegdNo) && _image != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => choose(
                        inputs: inputs,
                        image: _image!,
                      ),
                    ),
                  );
                } else {
                  showSnackbar('Warning, Enter all fields!', context);
                }
              },
              child: Container(
                height: 56,
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  color: purple,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            //transitioning to signup
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    children: [
                      Text('Already have an Account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => login()),
                          );
                        },
                        child: Text(
                          'LogIn',
                          style: TextStyle(color: purple),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
