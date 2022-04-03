import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wiz/resources/auth_methods.dart';
import 'package:wiz/utils/colors.dart';

class Video extends StatefulWidget {
  Video() : super();

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Video> {
  //
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  Future<String> getPosition() async {
    Duration duration;
    final value = await _controller.position;
    print(value.toString());
    return value.toString();
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        "https://firebasestorage.googleapis.com/v0/b/wizdom-4fd4d.appspot.com/o/files%2FArray.mp4?alt=media&token=a7598591-9fb6-4e3e-bb50-15d48f409e18");
    // _controller = VideoPlayerController.asset("assets/Array.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  final TextEditingController _DoubtController = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<QuerySnapshot>(
          stream: db.collection('Doubts').snapshots(),
          builder: (context, snapshot) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 64, 16, 64),
                child: Column(
                  children: [
                    const Text(
                      'Video',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Center(
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: _DoubtController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Ask your Doubt!',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        filled: false,
                        contentPadding: const EdgeInsets.all(8.0),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(purple),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        var timeStamp = await getPosition();
                        print(timeStamp);
                        await FirebaseFirestore.instance
                            .collection('Doubts')
                            .doc()
                            .set({
                          'doubt': _DoubtController.text,
                          'time-stamp': timeStamp,
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Ask',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // ElevatedButton(onPressed: (){
                    //   List<QueryDocumentSnapshot<Object?>> mp=snapshot.data!.docs;
                    //   print(mp);
                    // }, child: Text('Kuch Bhi'),),
                    // ListView(
                    //   shrinkWrap: true,
                    //   children: 
                      
                    //   snapshot.data!.docs.map((doc) {
                    //     final dynamic data = doc.data();
                        
                    //     return Card(
                    //       child: ListTile(
                    //         title: Text(data?["doubt"]??""),
                    //       ),
                    //     );
                    //   }).toList(),
                    // )
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getPosition();
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
