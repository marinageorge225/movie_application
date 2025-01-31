import 'package:flutter/material.dart';

import 'bloc/language_screen.dart';


class Profile extends StatelessWidget {
  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Language(),
    );
  }
}