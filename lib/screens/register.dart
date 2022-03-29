import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wiz/utils/utils.dart';
import 'package:wiz/widgets/text_field_imput.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _regdNoController = TextEditingController();

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
                child: const Text('Add Image'),
              ),
              SizedBox(height: 36,),
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
                textInputType: TextInputType.text, label: 'Email ID',
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldInput(
                hintText: '',
                textEditingController: _passwordController,
                textInputType: TextInputType.text, label: 'Password', isPass: true,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldInput(
                hintText: '',
                textEditingController: _regdNoController,
                textInputType: TextInputType.text, label: 'Registration Number',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
