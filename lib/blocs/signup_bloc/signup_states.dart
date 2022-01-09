abstract class SignUpState {}

class InitialSignupState extends SignUpState {}

class LoadingSingupState extends SignUpState {}

class SuccessSingupState extends SignUpState {}

class FailureSingupState extends SignUpState {
  String message;
  FailureSingupState({required this.message});
}
