import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation_movie_app/cubit/register_states.dart';

import 'package:graduation_movie_app/model/user_model_register.dart';


import '../api/api_service_register.dart';



class RegisterCubit extends Cubit<RegisterStates> {
  final ApiService apiService;

  RegisterCubit({required this.apiService}) : super(RegisterInitial());

  Future<void> registerUser(UserModel user) async {
    emit(RegisterLoading());

    try {
      final userData = user.toJson();
      final response = await apiService.registerUser(userData);

      if (response.statusCode == 200) {
        emit(RegisterSuccess(message: "Registration successful!"));
      } else {
        emit(RegisterValidationError(message: response.message ?? "Unknown error"));
      }
    } catch (e) {
      if (e is String) {
        if (e.contains("Email already exists")) {
          emit(RegisterEmailExists(message: e));
        } else if (e.contains("Network error")) {
          emit(RegisterNetworkError(message: e));
        } else {
          emit(RegisterValidationError(message: e));
        }
      } else {
        emit(RegisterNetworkError(message: "Network error, please try again."));
      }
    }
  }
}