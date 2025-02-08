abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {
  final String message;
  const RegisterSuccess({required this.message});
}
class RegisterFailure extends RegisterState {
  final String error;
  const RegisterFailure({required this.error});
}
