import 'package:flutter/material.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/browse_tab/browse_tab_widget.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/home_tab_widget.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/profile/update_profile/update_profile.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/search_tab/search_tab_widget.dart';
import '../../core/utils/app_color.dart';
import '../../core/utils/assets_manager.dart';

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
    UpdateProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        height: height * 0.0855,
        width: width * 0.9,
        margin: EdgeInsets.only(right: width * 0.03,left: width * 0.03,bottom: height * 0.02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomNavigationBar(
            iconSize: 20,
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