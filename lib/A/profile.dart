import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task3/A/editprofile.dart';
import 'package:url_launcher/url_launcher.dart';

import '../customwidgets/DecoratedTabBar.dart';
import '../model/profilefollowers.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  var url = "https://www.sunrule.in/";
  List<ProfileFollowers> choices = const <ProfileFollowers>[
    ProfileFollowers(title: "356", count: "Posts"),
    ProfileFollowers(title: "46,379", count: "Followers"),
    ProfileFollowers(title: "318", count: "Following"),
  ];

  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

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
          title: Row(
            children: [
              Text(
                "john_doe",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xff5b5b5b),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Image.asset("images/add_fab.png",
                  width: 20, height: 20, color: Color(0xff5b5b5b)),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context,"/editprofileone");
              },
              child: Container(
                margin: EdgeInsets.only(right: 15),
                child: Image.asset("images/edit.png",
                    width: 20, height: 20, color: Color(0xff5b5b5b)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 25),
              child: Image.asset("images/horizontal_menu.png",
                  width: 20, height: 20, color: Color(0xff5b5b5b)),
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 450,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 53,
                              backgroundImage: AssetImage('images/justin.jpeg'),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 8,
                              child: SizedBox(
                                width: 22,
                                height: 22,
                            /*    child: FloatingActionButton(
                                  // heroTag: "btn1",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EditProfile()),
                                    );
                                  },
                                  backgroundColor: Color(0xffff3563),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                ),*/
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text("John Doe",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6),
                        child: Text("UI/UX Designer",
                            style: TextStyle(
                                color: Color(0xff5b5b5b),
                                fontSize: 12,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6, left: 20, right: 20),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xff858585), fontSize: 12),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7),
                        child: InkWell(
                          onTap: () async {
                            final uri = Uri.parse(url);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            } else {
                              throw "Could not launch $url";
                            }
                          },
                          child: Text("www.sunrule.in",
                              style: TextStyle(
                                  color: Color(0xff5896ff),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(
                            bottom: 12, top: 20, right: 50, left: 40),
                        child: GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(choices.length, (index) {
                              return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    if (index == 1 || index == 2)
                                      VerticalDivider(
                                        color: Color(0xff858585),
                                        thickness: 0.15,
                                      ),
                                    Column(
                                      children: [
                                        Text(
                                          choices[index].title,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                          choices[index].count,
                                          style: TextStyle(
                                              color: Color(0xff858585),
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ]);
                            })),
                      ),
                      Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 5),
                          child: Divider()),
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
                                  margin: EdgeInsets.only(right: 10, left: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 65,
                                        width: 65,
                                        decoration: BoxDecoration(
                                            color: Color(0xffff446c),
                                            borderRadius:
                                                BorderRadius.circular(50)
                                            //more than 50% of width makes circle
                                            ),
                                        child: Center(
                                          child: SizedBox(
                                            width: 23,
                                            height: 23,
                              /*              child: FloatingActionButton(
                                              onPressed: () {},
                                              backgroundColor: Colors.white,
                                              elevation: 0,
                                              child: Icon(
                                                Icons.add,
                                                color: Color(0xffff446c),
                                                size: 18,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5))),
                                            ),*/
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 7),
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xffff446c),
                                        radius: 34.0,
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundImage:
                                              AssetImage('images/selena.jpeg'),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 7),
                                        child: Text(
                                          "Hangout",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
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
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Column(
            children: [
              DecoratedTabBar(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xffeeeeee),
                      width: 2.0,
                    ),
                  ),
                ),
                tabBar: TabBar(
                  controller: _tabController,
                  labelColor: Color(0xffff3563),
                  unselectedLabelColor: Color(0xff9e9e9e),
                  indicatorColor: Color(0xffff3563),
                  isScrollable: false,
                  indicatorWeight: 3,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.dashboard,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text('Feeds'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.video_call,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text('Shorts'),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.person,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text('Tag'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 8),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Feeds(),
                      FirstPage(
                        title: 'Page 2',
                      ),
                      FirstPage(
                        title: 'Page 3',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  FirstPage({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(title),
            )
          ],
        ),
      ),
    );
  }
}

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  State<Feeds> createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: 17,
        itemBuilder: (ctx, index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black.withOpacity(0.1), width: 1, //<-- SEE HERE
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                 Radius.circular(5),
                ),
                child:  (index + 1) % 2 == 0 ? Image.asset('images/selena.jpeg', fit: BoxFit.fill) : Image.asset('images/justin.jpeg',fit: BoxFit.fill),

              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 120,
        ),
      ),
    );
  }
}
