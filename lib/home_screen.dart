import 'package:flutter/material.dart';

import 'package:movies/ui/BrowseTap/browseTab.dart';
import 'package:movies/ui/Home_Tab/home_Tab.dart';
import 'package:movies/ui/SearchTab/search_Tab.dart';
import 'package:movies/ui/WatchListTab/watch_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homescreen';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
            height: 50,
            width: 200,
            child: Image.asset("assets/splash_screen.png")),
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
        currentIndex: selectedTabIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.movie),
              label: 'Browse'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.collections_bookmark),
              label: 'Watchlist'),
        ],
      ),
      body: tabs[selectedTabIndex],
    );
  }

  var tabs = [homeTab(), SearchTab(), BrowseTab(), WatchListTab()];

  int selectedTabIndex = 0;
}
