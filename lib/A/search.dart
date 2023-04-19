import 'package:flutter/material.dart';
import 'package:task3/A/followButton.dart';
import 'package:task3/customwidgets/DecoratedTabBar.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DefaultTabController(
          length: 5,
          child: Scaffold(
              body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  title: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: SizedBox(
                      height: 48,
                      child: TextFormField(
                        showCursor: false,
                        cursorColor: Colors.black,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          filled: true,
                          fillColor: Color(0xfff5f5f5),
                          contentPadding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xffcbcbcb),
                            size: 20,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {}
                        },
                      ),
                    ),
                  ),
                  pinned: true,
                  floating: true,
                  bottom: DecoratedTabBar(
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
                          icon: Icon(Icons.dashboard),
                        ),
                        Tab(
                          icon: Icon(Icons.person),
                        ),
                        Tab(
                          icon: Icon(Icons.mic),
                        ),
                        Tab(
                          icon: Icon(Icons.tag),
                        ),
                        Tab(
                          icon: Icon(Icons.location_pin),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: Navigator(
              key: _navKey,
              onGenerateRoute: (_) => MaterialPageRoute(
                builder: (_) => TabBarView(
                  controller: _tabController,
                  children: [
                    FirstPage(
                      title: 'Page 1',
                    ),
                    FollowProfile(),
                    FirstPage(
                      title: 'Page 3',
                    ),
                    FirstPage(
                      title: 'Page 4',
                    ),
                    FirstPage(
                      title: 'Page 5',
                    ),
                  ],
                ),
              ),
            ),
          )),
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

class FollowProfile extends StatefulWidget {
  const FollowProfile({Key? key}) : super(key: key);

  @override
  State<FollowProfile> createState() => _FollowProfileState();
}

class _FollowProfileState extends State<FollowProfile> {
  List<bool> _listItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listItems = [false,true,false,true,false,true,false,true,false,true,false,true,false,true];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.zero,
        alignment: Alignment.topCenter,
        child: ListView.builder(
            itemCount: _listItems.length,
            itemBuilder: (context, index) {
              if ((index) % 2 == 0) {
                print(index);
                print(_listItems[index]);
                return Container(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        'images/selena.jpeg',
                      ),
                    ),
                    title: Text(
                      "angelinaa_",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Text(
                      "Web Designer",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff878787),
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: FollowButton(value: _listItems[index], onTap: (){
                      print(index);
                      loadPress(index);
                    },),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 10),
                );
              } else {
                return Container(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        'images/justin.jpeg',
                      ),
                    ),
                    title: Text(
                      "angelina_tamara",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Text(
                      "President of Sales",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff878787),
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: FollowButton(value: _listItems[index], onTap: (){
                      loadPress(index);
                    },),
                  ),
                  margin: EdgeInsets.only(left: 15, right: 10),
                );
              }
            }),
      ),
    );
  }

  void loadPress(int index) {
    setState((){
      if(_listItems[index]){
        _listItems[index] = false;
      } else {
        _listItems[index] = true;
      }
    });
  }

}

