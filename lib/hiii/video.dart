import 'package:flutter/material.dart';

class video extends StatefulWidget {
  const video({Key? key}) : super(key: key);

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(children: [
      Card(
        
          child: Container(
        child: Image.network(
          'https://images.unsplash.com/photo-1644982647970-e72b0397e57b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
          fit: BoxFit.cover,
        ),
        height: 160,
        width: 382,
        // child: Padding(
        //   padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      )
      ),
      Positioned(
        top: 50,
        left: 160,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.play_circle_fill_rounded,
            color: Colors.white,
          ),
          iconSize: 64,

        ),
      ),
    ]
    )
    );
  }
}
