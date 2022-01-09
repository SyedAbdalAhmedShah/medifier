abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  String error;
  LoginFailureState({required this.error});
}
