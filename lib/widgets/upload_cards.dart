import 'package:flutter/material.dart';
import 'package:wiz/utils/colors.dart';

class UploadCard extends StatelessWidget {
  final String? text;
  final Color color;
  final String? img;  
  
  const UploadCard(
      {Key? key, required this.text, required this.color, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // color: color,
      onPressed: () {  },
      child: SizedBox(
        width: 180,
        height: 96,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(child: img != null ? Image.network(img!) : SizedBox(),height: 32,),
              SizedBox(height: 8,),
              Text(
                '$text',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
