import '../core/utils/app_color.dart';
import '../core/utils/app_styles.dart';
import '../core/utils/assets_manager.dart';
import '../ui/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:graduation_movie_app/OnBoarding_Screen/Customized_OnBoarding_Container.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatefulWidget {
  static String routeName = "OnBoardingScreen";

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final GlobalKey<IntroductionScreenState> introKey =
      GlobalKey<IntroductionScreenState>();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {

    return IntroductionScreen(
      key: introKey,
      controlsPadding: EdgeInsets.zero,
      showBackButton: false,
      showDoneButton: false,
      showSkipButton: false,
      onDone: () {},
      showNextButton: false,
      isProgress: false,
      showBottomPart: false,
      freeze: true,
      onChange: (index) {
        pageIndex = index;
        print("the pageIndex=$pageIndex");
        setState(() {});
      },
      pages: [
        CustomizedPageViewModel(
          Colors.grey,
          Colors.grey,
            context,
            AssetsManager.onboarding1StImage,
            0.03,
            "Find Your Next Favorite Movie Here",
            "Get access to a huge library of movies to suit all tastes. You will surely like it.",
            OnNextBotton,
            "Explore Now",
            AppStyles.medium36WhiteInter,
            AppColors.transparentColor,
            null,
            null,
            null,
            null),
        CustomizedPageViewModel(
            Colors.white,
            Color(0xff084250),
            context,
            AssetsManager.onboarding2NdImage,
            0.23,
            "Discover Movies",
            "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
            OnNextBotton,
            "Next",
            null,
            AppColors.blackColor,
            null,
            null,
            null,
            null),
        CustomizedPageViewModel(
            Colors.white,
            Color(0xff85210E),
            context,
            AssetsManager.onboarding3RdImage,
            0.11,
            "Explore All Genres",
            "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
            OnNextBotton,
            "Next",
            null,
            AppColors.blackColor,
            OnBackBotton,
            "Back",
            AppColors.blackColor,
            AppStyles.semiBold20OrangeInter),
        CustomizedPageViewModel(
            Colors.white,
            Color(0xff4C2471),
            context,
            AssetsManager.onboarding4ThImage,
            0.105,
            "Create Watchlists",
            "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
            OnNextBotton,
            "Next",
            null,
            AppColors.blackColor,
            OnBackBotton,
            "Back",
            AppColors.blackColor,
            AppStyles.semiBold20OrangeInter),
        CustomizedPageViewModel(
            Colors.white,
            AppColors.redColor,
            context,
            AssetsManager.onboarding5ThImage,
            0.068,
            "Rate, Review, and Learn",
            "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
            OnNextBotton,
            "Next",
            null,
            AppColors.blackColor,
            OnBackBotton,
            "Back",
            AppColors.blackColor,
            AppStyles.semiBold20OrangeInter),
        CustomizedPageViewModel(
            Colors.white,
            AppColors.darkGrayColor,
            context,
            AssetsManager.onboarding6ThImage,
            0.23,
            "Start Watching Now",
            null,
            OnFinishBotton,
            "Finish",
            null,
            AppColors.blackColor,
            OnBackBotton,
            "Back",
            AppColors.blackColor,
            AppStyles.semiBold20OrangeInter),
      ],
    );
  }

  void OnNextBotton() {
    introKey.currentState?.next();
  }

  void OnBackBotton() {
    introKey.currentState?.previous();
  }

  void OnFinishBotton() {
    saveOnBoarding();
    Navigator.of(context).pushNamed(LoginView.routeName);
  }

  PageViewModel CustomizedPageViewModel(
      Color gradientTopColor,
      Color gradientBottomColor,
      BuildContext context,
      String imagePath,
      double boxHeight,
      String title,
      String? body,
      Function onPressed,
      String textBottom,
      TextStyle? titleStyle,
      Color? backgroundColor,
      Function? onPressed2,
      String? textBottom2,
      Color? bottomColor,
      TextStyle? textBottomStyle) {
    var height = MediaQuery.of(context).size.height;

    return PageViewModel(
        useScrollView: true,
        decoration: const PageDecoration(
            safeArea: 0,
            fullScreen: true,
            footerFlex: 2,
            bodyFlex: 2
        ),
        image: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(colors: [gradientTopColor, gradientBottomColor], begin: Alignment.topCenter, end: Alignment.bottomCenter,).createShader(bounds),
          child: Image.asset(
            imagePath,
            height: height * 0.7, // Full screen height
            width: double.infinity, // Full screen width
            fit: BoxFit.cover,
            // Ensures the image scales to fill the screen while maintaining its aspect ratio
          ),
        ),
        title: "",
        body: "",
        footer: CustomizedOnboardingContainer(
          textBottom2: textBottom2,
          bottomColor: bottomColor,
          textBottom2Style: textBottomStyle,
          titleStyle: titleStyle,
          onPressed2: onPressed2,
          onPressed: onPressed,
          textBottom: textBottom,
          title: title,
          body: body,
          backgroundColor: backgroundColor,
        ));
  }

  Future<void> saveOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(OnBoarding.routeName, true);
  }
}
