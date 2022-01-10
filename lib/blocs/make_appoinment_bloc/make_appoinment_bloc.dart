import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_notifier/Repository/api_helper.dart';
import 'package:medicine_notifier/blocs/make_appoinment_bloc/make_appoinment_event.dart';
import 'package:medicine_notifier/blocs/make_appoinment_bloc/make_appoinment_state.dart';
import 'package:medicine_notifier/model/make_appoinment.dart';
import 'package:medicine_notifier/view/components/user_manager.dart';

class MakeAppoinmentBloc
    extends Bloc<MakeAppoinmentEvent, MakeAppoinmentState> {
  ApiHelper api = ApiHelper();
  MakeAppoinmentBloc() : super(InitialMakeAppoinmentState()) {
    on<CreateAppoinmentState>((event, emit) async {
      emit(LoadingMakeAppoinmentState());
      try {
        await api.makeAppoinment(
            data: event.appoinment, uid: UserManager.user.uid!);
        emit(SuccessFullyMakeAppoinmentState());
      } catch (error) {
        FailureMakeAppoinmentState(error: error.toString());
      }
    });
  }
}
