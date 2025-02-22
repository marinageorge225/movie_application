import 'package:flutter/material.dart';
import 'package:graduation_movie_app/core/utils/app_color.dart';
import 'package:graduation_movie_app/core/utils/app_styles.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MovieWebView extends StatelessWidget {
  String movieUrl;

  MovieWebView({required this. movieUrl});

  @override
  Widget build(BuildContext context) {

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse( movieUrl));

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            size: 30,
            color: AppColors.orangeColor,
        ),
        title: Text('Movie',
          style: AppStyles.bold20OrangeInter,),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
