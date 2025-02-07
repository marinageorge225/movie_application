import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/api/api_manger.dart';
import 'cubit/login_states.dart';
import 'login_connector.dart';


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


            emit(LoginSuccess(response.data!,response.message!));
        } else {

          emit(LoginFailure(response.message!));
        }
      } catch (e) {
        emit(LoginFailure('An error occurred: $e'));

      }
    }
  }
}

