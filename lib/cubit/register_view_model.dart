
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_movie_app/cubit/register_states.dart';

import '../api/api_service_register.dart';
import '../model/user_model_register.dart';


class RegisterCubit extends Cubit<RegisterState> {
final ApiService apiService;
RegisterCubit(this.apiService) : super(RegisterInitial());

void register(String name, String email, String password, String confirmPassword, String phone, int avatarId) async {
emit(RegisterLoading());
final user = UserModel(
name: name,
email: email,
password: password,
confirmPassword: confirmPassword,
phone: phone,
avaterId: avatarId,
);
try {
await apiService.registerUser(user);
emit(RegisterSuccess(message: 'Registration successful!'));
} catch (e) {
emit(RegisterFailure(error: 'Registration failed: $e'));
}
}
}