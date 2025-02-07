import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/api_manger.dart';
import 'cubit/login_states.dart';
import 'login_connector.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginViewModel extends Cubit<LoginState> {
  final ApiManager apiManager;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  late LoginConnector connector;

  LoginViewModel(this.apiManager) : super(LoginInitial());

   validateAndLogin(String email, String password, GlobalKey<FormState> formKey) async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoading());

      try {
        final response = await apiManager.login(email, password);

        if (response.data !=null) {


            emit(LoginSuccess(response.message!));
        } else {

          emit(LoginFailure(response.message!));
        }
      } catch (e) {
        emit(LoginFailure('An error occurred: $e'));

      }
    }
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    emit(LoginLoading());

    try {
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();
    if(user==null) {
    print("Google Sign-In canceled.");
    }
      if (user != null) {
        print("User signed in: ${user.displayName}, Email: ${user.email}");
      }
      return user;
    } catch (e) {
      return null;
    }
  }

  loginWithGoogle() async {

    final user = await signInWithGoogle();

    if (user == null) {
      emit(LoginFailure("Google Sign-In failed"));
      return;
    }
    emit(LoginSuccess( "Google Sign-In successful"));
  }
}

