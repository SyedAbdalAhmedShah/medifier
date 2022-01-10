import 'package:medicine_notifier/blocs/make_appoinment_bloc/make_appoinment_event.dart';

abstract class MakeAppoinmentState {}

class InitialMakeAppoinmentState extends MakeAppoinmentState {}

class LoadingMakeAppoinmentState extends MakeAppoinmentState {}

class SuccessFullyMakeAppoinmentState extends MakeAppoinmentState {}

class FailureMakeAppoinmentState extends MakeAppoinmentState {
  final String error;

  FailureMakeAppoinmentState({required this.error});
}
