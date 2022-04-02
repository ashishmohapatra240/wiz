import 'package:flutter/material.dart';
import 'package:wiz/utils/colors.dart';

class notes extends StatelessWidget {
  const notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.file_present_rounded,
                            color: Colors.red,
                          ),
                          iconSize: 40,
                        ),
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            color: Color.fromRGBO(248, 172, 165, 0.9)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Mathematics',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('Chapter 1'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.close_rounded,
                          color: red,
                        ),
                        iconSize: 40,
                      ),
                    ),
                    // height: 70,
                    // width: 70,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(70),
                    //     color: Color.fromRGBO(248, 172, 165, 0.2)),
                  )
                ]),
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Color.fromRGBO(105, 84, 216, 0.2)),
          ),
        ],
      ),
    );
  }
}
