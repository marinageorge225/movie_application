abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
   // String data;
   String message;

  LoginSuccess(this.message);
}

class LoginFailure extends LoginState {
   String errorMessage;
  LoginFailure(this.errorMessage);
}
