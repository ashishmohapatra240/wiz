import 'package:flutter/material.dart';
import 'package:wiz/utils/colors.dart';

class Assignment extends StatelessWidget {
  final String subject;
  final String deadline;
  final String img;
  const Assignment({Key? key, required this.subject,required this.deadline,required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 100,
        ),
        // color: purple,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.blue,
              )),
          height: 128,
          width: 400,
          child: Padding(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      '$subject Assignment',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Submitted:',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '24/44',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Deadline $deadline',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Image.network('$img'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
