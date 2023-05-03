import 'package:flutter/material.dart';
import 'package:tiktok/screen/widgets/circle_animation.dart';
//import 'package:tiktok/screen/widgets/video_player_item.dart';

class HoomePage extends StatefulWidget {
  const HoomePage({Key? key}) : super(key: key);
  

  @override
  State<HoomePage> createState() => _HoomePageState();
}

class _HoomePageState extends State<HoomePage> {
  TextEditingController typeController = new TextEditingController();
  TextEditingController orderController = new TextEditingController();

  List<String> typeVideo = [
    "Drôle",
    "Drame",
    "News",
    "Song",
  ];

  List<String> orderVideo = [
    "Recent",
    "3 days ago",
    "5 days ago",
    "One week ago",
    "Two weeks ago",
    "One month ago",
  ];

  bool displayTypeVideo = false;
  bool displayOrderVideo = false;

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
                                  InkWell(
                                    onTap: () {
                                      
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      size: 40,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text("2,2300"),
                                  InkWell(
                                    onTap: () {
                                      
                                    },
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

  Widget content() {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            //end: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 26, 194, 194),
              Colors.redAccent,
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white
                        )
                      ),
                      inputField("Category", typeController),
                      displayTypeVideo 
                        ? selectionField("Category", typeController)
                        : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      Text(
                        "Order by",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white
                        )
                      ),
                      inputField("Order by", orderController),
                      displayOrderVideo
                      ? selectionField("Order by", orderController)
                      : SizedBox(),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputField(String type, TextEditingController controller) {
    return Container(
      width: 130,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: TextEditingController(),
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                switch (type) {
                  case "Category":
                    displayTypeVideo = !displayTypeVideo;
                    break;
                  case "Order by":
                    displayOrderVideo = !displayOrderVideo;
                    break;
                }
              });
            },
            child: Icon(
              Icons.arrow_downward_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget selectionField(String type, TextEditingController controller) {
    return Container(
      height: 200,
      width: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            )
          ]),
      child: ListView.builder(
          itemCount: type == "Category"
            ? typeVideo.length
            : orderVideo.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  switch (type) {
                    case "Category":
                      controller.text = typeVideo[index];
                      break;
                    case "Order by":
                      controller.text = orderVideo[index];
                      break;
                  }
                });
              },
              child: ListTile(
                title: Text(type=="Category"
                  ? typeVideo[index]
                  : orderVideo[index]
                ),
              ),
            );
          })
        ),
    );
  }
}
