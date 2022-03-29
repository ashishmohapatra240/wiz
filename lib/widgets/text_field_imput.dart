import 'package:flutter/material.dart';
import 'package:wiz/utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String label;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(label,style: TextStyle(color: Colors.grey[600]),),
        hintText: hintText,
        border: InputBorder.none,
        filled: false,
        contentPadding: const EdgeInsets.all(8.0),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
