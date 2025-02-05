import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/cubit/home_tap_view_model.dart';
import 'package:graduation_movie_app/ui/home_screen/tabs/home_tab/home_tap_bottom_part.dart';
import 'package:graduation_movie_app/utils/app_color.dart';
import 'package:graduation_movie_app/utils/app_styles.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeTabViewModel viewModel = HomeTabViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.changeGenre();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(width: width * 0.03,),
                Expanded(
                  child: Text(
                    viewModel.selectedGenre,
                    style: AppStyles.regular20WhiteRoboto,
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'See More',
                          style: AppStyles.regular16OrangeRoboto,
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.orangeColor,
                          size: 15,
                        )
                      ],
                    ))
              ],
            ),
            HomeTapBottomPart(genre: viewModel.selectedGenre,),
          ],
        ),
      ),
    );
  }
}
