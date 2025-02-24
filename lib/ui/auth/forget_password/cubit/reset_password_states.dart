abstract class ResetPasswordStates {}

class ResetPasswordInitial extends ResetPasswordStates {}

class ResetPasswordLoading extends ResetPasswordStates {}

class ResetPasswordSuccess extends ResetPasswordStates {
  String message;
  ResetPasswordSuccess(this.message);
}

class ResetPasswordFailure extends ResetPasswordStates {
  String errorMessage;
  ResetPasswordFailure(this.errorMessage);
}
