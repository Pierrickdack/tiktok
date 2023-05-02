import 'package:flutter/material.dart';

class HoomePage extends StatefulWidget {
  const HoomePage({Key? key}) : super(key: key);

  @override
  State<HoomePage> createState() => _HoomePageState();
}

class _HoomePageState extends State<HoomePage> {
  TextEditingController typeController = new TextEditingController();TextEditingController orderController = new TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text("Welcome on TikTok !"),
      ), */
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            //end: Alignment.center,
            end: Alignment.topLeft,
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
                      Text("Category"),
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
                      Text("Order by"),
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
          color: Color.fromARGB(255, 105, 95, 95),
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
            child: Icon(Icons.arrow_downward_rounded),
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
