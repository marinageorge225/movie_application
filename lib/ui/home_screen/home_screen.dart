import 'package:flutter/material.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/browse_tab/browse_tab_widget.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/home_tab_widget.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/profile_tab_widget.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/search_tab/search_tab_widget.dart';
import 'package:graduation_movie_app/utils/app_color.dart';

import '../../utils/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15), // Clip the corners
          child: BottomNavigationBar(
            backgroundColor: AppColors.darkGrayColor,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              if (index < tabs.length) {
                setState(() {
                  selectedIndex = index;
                });
              }
            },
            items: [
              BottomNavigationBarItem(
                  icon: builtItemInButtonNavBar(
                      index: 0, iconPath: AssetsManager.homeIcon),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: builtItemInButtonNavBar(
                      index: 1, iconPath: AssetsManager.searchIcon),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: builtItemInButtonNavBar(
                      index: 2, iconPath: AssetsManager.browseIcon),
                  label: 'Browse'),
              BottomNavigationBarItem(
                  icon: builtItemInButtonNavBar(
                      index: 3, iconPath: AssetsManager.profileIcon),
                  label: 'Profile'),
            ],
          ),
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  Widget builtItemInButtonNavBar({required int index, required String iconPath}) {
    return ImageIcon(
      AssetImage(iconPath),
    );
  }
}
