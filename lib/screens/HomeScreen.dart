import 'package:flutter/material.dart';
import 'package:hairstyles_app/screens/listscreens/LongScreen.dart';
import 'package:hairstyles_app/screens/listscreens/PartyScreen.dart';
import 'package:hairstyles_app/screens/listscreens/SchoolScreen.dart';
import 'package:hairstyles_app/screens/listscreens/ShortScreen.dart';
import 'package:hairstyles_app/screens/listscreens/WorkScreen.dart';
import 'package:hairstyles_app/screens/widgets/DrawerScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: DrawerScreen(),
          appBar: AppBar(
            //backgroundColor: Color.fromARGB(255, 255, 102, 204),
            backgroundColor: Color.fromARGB(255, 221, 169, 203),
            leading: IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              iconSize: 30,
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
            ),
            title: Text(
              "Hairstyles step by step",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "WORK HAIR",
                ),
                Tab(
                  text: "SCHOOL HAIR",
                ),
                Tab(
                  text: "PARTY HAIR",
                ),
                Tab(
                  text: "LONG HAIR",
                ),
                Tab(
                  text: "SHORT HAIR",
                )
              ],
              controller: _tabController,
              indicatorColor: Colors.white,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            bottomOpacity: 1,
          ),
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              WorkScreen(),
              SchoolScreen(),
              PartyScreen(),
              LongScreen(),
              ShortScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
