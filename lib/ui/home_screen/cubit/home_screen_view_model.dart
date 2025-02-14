import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/ui/home_screen/cubit/home_screen_states.dart';

import '../tabs/browse_tab/browse_tab_widget.dart';
import '../tabs/home_tab/home_tab_widget.dart';
import '../tabs/profile/update_profile/update_profile.dart';
import '../tabs/search_tab/search_tab_widget.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitialState());

  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    UpdateProfile(),
  ];

  bottomNavigationOnTab(int index){
    selectedIndex = index;
    emit(ChangeSelectedIndex());
  }
}