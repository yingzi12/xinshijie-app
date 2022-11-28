import 'package:flutter/material.dart';
import 'package:xinshijieapp/fragments/search_fragment.dart';
import 'package:xinshijieapp/fragments/world_fragment.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:xinshijieapp/fragments/account_fragment.dart';
import 'package:xinshijieapp/fragments/story_fragment.dart';
import 'package:xinshijieapp/fragments/home_fragment.dart';
import 'package:xinshijieapp/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageItem = [
    HomeFragment(),
    HomeFragment(),
    HomeFragment(),
    HomeFragment(),
    HomeFragment(),
  ];
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageItem[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(size: 28, opacity: 1),
        unselectedIconTheme: IconThemeData(size: 28, opacity: 0.5),
        selectedLabelStyle: TextStyle(fontSize: 14),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        selectedItemColor: appStore.isDarkModeOn ? white : black,
        elevation: 40,
        selectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 20),
            activeIcon: Icon(Icons.home_rounded, size: 20, color: appStore.isDarkModeOn ? white : black),
            label: "主页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public_outlined, size: 20),
            activeIcon: Icon(Icons.public_rounded, size: 20, color: appStore.isDarkModeOn ? white : black),
            label: "世界",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.park_outlined, size: 20),
            activeIcon: Icon(Icons.park_rounded, size: 20, color: appStore.isDarkModeOn ? white : black),
            label: "故事",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 20),
            activeIcon: Icon(Icons.search_sharp, size: 20, color: appStore.isDarkModeOn ? white : black),
            label: "搜索",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_outlined, size: 20),
            activeIcon: Icon(Icons.manage_accounts_rounded, size: 20, color: appStore.isDarkModeOn ? white : black),
            label: "用户",
          ),
        ],
        currentIndex: _selectedItem,
        onTap: (setValue) {
          _selectedItem = setValue;
          setState(() {});
        },
      ),
    );
  }
}
