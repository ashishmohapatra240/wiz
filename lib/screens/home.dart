import 'package:flutter/material.dart';
import 'package:wiz/utils/colors.dart';
import 'package:wiz/widgets/subject_card.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> subjectMap = [
      {"Sub": "Biology", "img": "https://i.imgur.com/Y1MFOGC.png"},
      {"Sub": "Math", "img": "https://i.imgur.com/uotMspu.png"},
      {
        "Sub": "English",
        "img":
            "https://i.imgur.com/YrnWq3J.png"
      },
      {"Sub": "Psycology", "img": "https://i.imgur.com/o0T95YM.png"},
      {"Sub": "Physics", "img": "https://i.imgur.com/qBTevMO.png"},
      {
        "Sub": "Computer",
        "img":
            "https://i.imgur.com/Ul4Ka0z.png"
      }
    ];
    List<Color> color = [blue, red, purple, green, teal, orange];
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 64, 16, 64),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome Harshit',
                      style: TextStyle(
                          color: purple,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'B-Tech',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80'),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            const Text(
              'My Subjects',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.65,
              ),
            ),
            Container(
              height: 400,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 0.0,
                mainAxisSpacing: 0.0,
                children: List.generate(subjectMap.length, (index) {
                  return Center(
                    child: Subject_Card(
                      text: subjectMap[index]["Sub"],
                      color: color[index],
                      img: subjectMap[index]["img"],
                    ),
                  );
                }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
