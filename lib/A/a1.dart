import 'package:flutter/material.dart';
import 'package:task3/A/profile.dart';
import 'package:task3/A/search.dart';
import 'package:task3/A/shorts.dart';

import '../main.dart';
import 'home.dart';

class A1 extends StatefulWidget {
  const A1({Key? key}) : super(key: key);

  @override
  State<A1> createState() => _A1State();
}

class _A1State extends State<A1> {

  var pages =  [Home(), Search(), Home(), Shorts(), Profile(),];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar:BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed ,
          selectedItemColor: Color(0xffff3563),
          unselectedItemColor: Color(0xffb6b6b6),
          onTap: (int numb){
            setState(() {
              currentIndex = numb;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search,),
                label: 'Search'
            ),
            BottomNavigationBarItem(
                icon: FloatingActionButton.small(
                  elevation: 0,
                  backgroundColor: Color(0xffff3563),
                  onPressed:(){  },
                  child: Icon(Icons.add, color: Colors.white,),
                ),
              label: ""
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline,),
                label: 'Shorts'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile'
            ),
          ],
        ),
      ),
    );
  }
}
