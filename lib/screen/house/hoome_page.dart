import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/screen/add/comment_screen.dart';
import 'package:tiktok/screen/api/video_controller.dart';
import 'package:tiktok/screen/widgets/circle_animation.dart';
//import 'package:tiktok/screen/widgets/video_player_item.dart';

class HoomePage extends StatefulWidget {
  const HoomePage({Key? key}) : super(key: key);
  

  @override
  State<HoomePage> createState() => _HoomePageState();
}

class _HoomePageState extends State<HoomePage> {

  int _likes = 0;
  List<String> _comments = [];
  var data;

  void _incrementLikeCount() {
    setState(() {
      _likes++;
    });
  }

  final VideoController videoController = Get.put(VideoController());

  //Profile
  buildProfile(String profilePhoto){
    return SizedBox(
      width: 50,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(11),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      /* appBar: AppBar(
        title: Text("Welcome on TikTok !"),
      ), */
      body: PageView.builder(
        //itemCount: ,
        controller: PageController(initialPage: 0, viewportFraction: 1),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          //final data = videoController.videoList[index];
          return Stack(
            children: [
              //VideoPlayerItem(videoUrl: data.videoUrl,),
              Column(
                children: [
                  const SizedBox(height: 100,),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(child: Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Username',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Description',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.music_note,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Username',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ),
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(
                            top: size.height/5,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildProfile('string url'),
                              Column(
                                children: [
                                  Text('$_likes likes'),
                                  InkWell(
                                    onTap: () => _incrementLikeCount(),
                                    child: Icon(
                                      Icons.favorite,
                                      size: 40,
                                      //color: data.likes.contains(authController.user.uid) ? Colors.redAccent : Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text('Comment'),
                                  InkWell(
                                     onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => CommentScreen(
                                            id: 'fr',
                                          ), 
                                        ),
                                        ),
                                    child: Icon(
                                      Icons.comment,
                                      size: 40,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text("2,2300"),
                                ],
                              ),
                              CircleAnimation(child: buildMusicAlbum('profile photo'),),
                            ],
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ],
          );
        }
      ),
       //content(),
    );
  }
}