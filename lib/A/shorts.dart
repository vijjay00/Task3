import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'followButton.dart';

class Shorts extends StatefulWidget {
  const Shorts({Key? key}) : super(key: key);

  @override
  State<Shorts> createState() => _ShortsState();
}

class _ShortsState extends State<Shorts> {
  final List<String> images = [
    'images/s1.jpeg',
    'images/s2.jpg',
    'images/s3.jpeg',
  ];

  int currentIndexPage = 0;
  final PageController _pageController = PageController();
  var _listItems = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageView.builder(
        controller: _pageController,
         itemCount: images.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child:
                Image.asset(images[index], fit: BoxFit.fill),
              ),
              Positioned(
                top: 70,
                  left: 15,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("Shorts", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal,decoration: TextDecoration.none),),
                    Icon(Icons.camera_alt_outlined, color: Colors.white,)
                  ],),),
              Center( child: Icon(Icons.play_circle, color: Colors.white,size: 50,),),
              Positioned(
                right: 5,
                bottom: 24,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                          tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.center),
                      child: Column(
                        children: [
                          Icon(
                            Icons.favorite_sharp,
                            color: Color(0xffff3563),
                            size: 30,
                          ),
                          SizedBox(height: 7),
                          Text(
                            "12,267",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8), fontSize: 12),
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
                          alignment: Alignment.center),
                      child: Column(
                        children: [
                          Image.asset("images/chat_bubble_dark.png",
                              width: 30, height: 30, color: Colors.white,),
                          SizedBox(height: 7),
                          Text(
                            "9,287",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8), fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child:Image.asset('images/send_dark.png',
                            width: 35, height: 35, color: Colors.white,),

                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                        splashFactory: NoSplash.splashFactory,
                      ),
                        child: Image.asset(
                          "images/menu_dark.png",
                          width: 30,
                          height: 30, color: Colors.white,
                        ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(
                    width: 310,
                    child: ListTile(
                      leading: SizedBox(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            'images/justin.jpeg'
                          ),
                        ),
                        width: 60,
                          height: 60,
                      ),
                      title: Text(
                        "jenny_wirosa",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
                      ),
                      subtitle: Text(
                        "Videographer",
                        style: TextStyle(
                            fontSize: 12,
                          color: Colors.white.withOpacity(0.9),),
                      ),
                      trailing: FollowButton(value: _listItems, onTap: (){
                        loadPress();
                      },),
                    ),
                  ),
                    SizedBox(
                      width: 310,
                    child: ListTile(
                        dense:true,
                        contentPadding: EdgeInsets.only(top: -20, left: 20),
                        minLeadingWidth : 0,
                        horizontalTitleGap: 10,
                        leading: SizedBox(width: 25,
                          height: 25,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'images/selena.jpeg',
                            ),
                          ),
                        ),
                        title: Text(
                          "Favorite Girl by Justin Bieber",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),fontSize: 12,),
                        ),
                      ),
                  ),
                ],)
              ),
            ],
          );
        },
    ),
    );
  }

  void loadPress() {
    setState((){
      if(_listItems){
        _listItems = false;
      } else {
        _listItems = true;
      }
    });
  }
}