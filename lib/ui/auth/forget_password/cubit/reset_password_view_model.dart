import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/repository/reset_password/repository/reset_password_repository.dart';
import 'package:graduation_movie_app/ui/auth/forget_password/cubit/reset_password_states.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates> {
  final ResetPasswordRepository resetPasswordRepository;

  ResetPasswordViewModel({required this.resetPasswordRepository})
      : super(ResetPasswordInitial());

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> resetPassword() async {
    if (formKey.currentState?.validate() == true) {
      emit(ResetPasswordLoading());

      try {
        final prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString("user_token");

        if (token == null || token.isEmpty) {
          emit(ResetPasswordFailure("Token is missing"));
          return;
        }

        var response = await resetPasswordRepository.resetPassword(
          token: token,
          newPassword: newPasswordController.text,
          oldPassword: oldPasswordController.text,
        );

        if (response?.statusCode==null) {
          emit(ResetPasswordSuccess(response!.message!));


        } else if(response?.statusCode==400){
          emit(ResetPasswordFailure(response!.message!));

        }
      } catch (e) {
        print(e.toString());
        emit(ResetPasswordFailure("error : ${e.toString()}"));
      }
    }
  }
}
