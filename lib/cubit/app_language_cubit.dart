import 'package:flutter_bloc/flutter_bloc.dart';

class AppLanguageCubit extends Cubit<String> {
  AppLanguageCubit() : super('en');

  void changeLanguage(String newLanguage) {
    if (state != newLanguage) {
      emit(newLanguage);
    }
  }
}
