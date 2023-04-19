import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> images = [
    'images/management.jpg',
    'images/sunflower.jpeg',
    'images/management.jpg',
  ];

  int currentIndexPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 18),
            child: SvgPicture.asset(
              "assets/toktok.svg",
              color: Color(0xffff6f8b),
            ),
          ),
          centerTitle: false,
          titleSpacing: 5,
          title: Text(
            "TokTok",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Image.asset(
                "assets/appbar_heart.png",
                width: 20,
                height: 20,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 25),
              child:
                  Image.asset("assets/chat_bubble.png", width: 20, height: 20),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 95,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        margin: EdgeInsets.only(right: 15, left: 20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 33,
                                  backgroundImage:
                                      AssetImage('images/justin.jpeg'),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 5,
                                  child: SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: FloatingActionButton(
                                      onPressed: (){},
                                      backgroundColor: Color(0xffff3563),
                                      child: Icon(Icons.add, color: Colors.white, size: 10,),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7),
                              child: Text("You", style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                      );
                    } else if ((index + 1) % 2 == 0) {
                      return Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xffff6f8b),
                              radius: 33.0,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('images/selena.jpeg'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7),
                              child: Text("Selena", style: TextStyle(color: Colors.black,),),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xffe0e0e0),
                              radius: 33.0,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('images/justin.jpeg'),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7),
                              child: Text(
                                "Andrew",
                                 style: TextStyle(color: Color(0xff878787),fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage('images/selena.jpeg'),
                          ),
                          title: Text(
                            "anny_wilson",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text("Marketing Coordinator",style: TextStyle(fontSize: 12,color: Color(0xff878787),fontWeight: FontWeight.bold),),
                          trailing: Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Image.asset('images/horizontal_menu.png',
                                  width: 20, height: 20)),
                        ),
                        margin: EdgeInsets.only(left: 5),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 20, left: 20),
                            height: 300,
                            child: PageView.builder(
                              controller: _pageController,
                              onPageChanged: (int page) {
                                setState(() {
                                  currentIndexPage = page;
                                });
                              },
                              itemCount: images.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(images[index],
                                      fit: BoxFit.fill),
                                );
                              },
                            ),
                          ),
                          Positioned.fill(
                            bottom: 7,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: DotsIndicator(
                                dotsCount: images.length,
                                position: currentIndexPage.toDouble(),
                                decorator: DotsDecorator(
                                  activeColor: Color(0xffff3563),
                                  color: Colors.white,
                                  activeSize: Size.square(8),
                                  size: Size.square(6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  splashFactory: NoSplash.splashFactory,
                                  padding: EdgeInsets.only(left: 5),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite_sharp,
                                    color: Color(0xffff6f8b),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    "44,389",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  splashFactory: NoSplash.splashFactory,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              child: Row(
                                children: [
                                  Image.asset("assets/chat_bubble.png",
                                      width: 20, height: 20),
                                  SizedBox(width: 7),
                                  Text(
                                    "26,376",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.only(left: 0, right: 5),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerLeft,
                                splashFactory: NoSplash.splashFactory,
                              ),
                              child: GestureDetector(
                                onTap: () => {},
                                child: Image.asset('images/send.png',
                                    width: 20, height: 20),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.only(left: 20),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                alignment: Alignment.centerLeft,
                                splashFactory: NoSplash.splashFactory,
                              ),
                              child: GestureDetector(
                                onTap: () => {},
                                child: SvgPicture.asset(
                                  "images/bookmark.svg",
                                  width: 23,
                                  height: 23,
                                ),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
