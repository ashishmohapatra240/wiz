import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:wiz/resources/firebase_api.dart';
import 'package:wiz/utils/colors.dart';
import 'package:wiz/widgets/upload_cards.dart';
import 'package:path/path.dart' as Path;

class UploadFiles extends StatefulWidget {
  const UploadFiles({Key? key, String? text, String? img, required Color color})
      : super(key: key);

  @override
  State<UploadFiles> createState() => _UploadFilesState();
}

class _UploadFilesState extends State<UploadFiles> {
  @override
  Widget build(BuildContext context) {
    UploadTask? task;
    File? file;
    Future selectFile() async {
      final result = await FilePicker.platform.pickFiles(allowMultiple: false);

      if (result == null) return;
      final path = result.files.single.path!;

      setState(() => file = File(path));
    }

    Future uploadFile() async {
      if (file == null) return;

      final fileName = Path.basename(file!.path);
      final destination = 'files/$fileName';
      FirebaseApi.uploadFile(destination, file!);
      // setState(() {});
      // if (task == null) return;
      // final snapshot = await task!.whenComplete(() {});
      // final urlDownload = await snapshot.ref.getDownloadURL();
      // print('Download-Link: $urlDownload');
    }

    List<Map<String, String>> subjectMap = [
      {"Sub": "Notes", "img": "https://i.imgur.com/QMeygoQ.png"},
      {"Sub": "CSV", "img": "https://i.imgur.com/7VX40Sl.png"},
      {"Sub": "Assignment", "img": "https://i.imgur.com/LLRqmYT.png"},
      {"Sub": "Video", "img": "https://i.imgur.com/ngIdtIt.png"},
    ];
    List<Color> color = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white
    ];

    return Scaffold(
      body: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 64, 16, 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 36,
              ),
              const Text(
                'Upload Files',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.65,
                ),
              ),
              SizedBox(height: 24,),
              Column(
                children: [
                  TextButton(
                    
                    onPressed: () {
                      selectFile();
                    },
                    child: Row(
                      children: [Image.network('https://i.imgur.com/k17HKdp.png'), SizedBox(width:16),Text('Notes',style: TextStyle(color: Colors.grey,fontSize: 24),)],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
