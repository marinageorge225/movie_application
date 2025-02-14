import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageCubit extends Cubit<String> {
  AppLanguageCubit() : super('en'); // اللغة الافتراضية English

  void changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('app_language', languageCode);
    emit(languageCode);
  }
}
