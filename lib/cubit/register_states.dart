abstract class RegisterStates {

}

class RegisterInitial extends RegisterStates{}

class RegisterLoading extends RegisterStates{}

class RegisterValidationError extends RegisterStates{
    String message;
  RegisterValidationError( {required this.message});
}


class RegisterEmailExists extends RegisterStates{
    String message;
    RegisterEmailExists( {required this.message});
}

class RegisterNetworkError extends RegisterStates{
  String message;
  RegisterNetworkError(   {required this.message});
}

class RegisterSuccess extends RegisterStates{
  String message;
  RegisterSuccess( {required this.message});
}