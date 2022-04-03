import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wiz/resources/firebase_api.dart';
import 'package:wiz/resources/storage_methods.dart';
import 'package:wiz/screens/upload_files.dart';
import 'package:wiz/utils/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_core/firebase_core.dart';


class home_educator extends StatefulWidget {
  const home_educator({Key? key}) : super(key: key);

  @override
  State<home_educator> createState() => _home_educatorState();
}

class _home_educatorState extends State<home_educator> {
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



  @override
  Widget build(BuildContext context) {
    final fileName =
        file != null ? Path.basename(file!.path) : 'No File Selected';

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 64, 16, 64),
        child: Column(children: [
          Container(
            height: 172,
            width: 382,
            decoration: BoxDecoration(
              color: purple,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  // color: purple,
                  ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(32),
                    child: Text(
                      'Upload your lectures, assignments and the required notes here',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonTheme(
                          minWidth: 400,
                          height: 300,
                          child: SizedBox(
                            height: 48,
                            width: 312,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UploadFiles(color: purple,),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    // Icon(
                                    //   Icons.upload,
                                    //   color: purple,
                                    // ),
                                    // SizedBox(
                                    //   width: 16,
                                    // ),
                                    Text(
                                      'Upload',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: purple,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            children: const [
              Text(
                'Generate Link',
                style: TextStyle(
                  color: Color.fromRGBO(16, 24, 40, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Create your own meet',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(80),
          //       color: Colors.grey[300]),
          // ),
          Container(
            height: 84,
            width: 382,
            decoration: BoxDecoration(
              // color: purple,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color.fromARGB(255, 212, 212, 212),
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 16, 8, 2),
                    child: Row(
                      children: [
                        Image.asset(
                          './assets/logo.png',
                          height: 48,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Z-Connect',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 84,),
                        ButtonTheme(
                          minWidth: 400,
                          height: 300,
                          child: SizedBox(
                            height: 36,
                            width: 108,
                            child: TextButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(purple),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // StorageMethods().getData();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text(
                                    'Select',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          
        ]),
      ),
    );
  }
}
