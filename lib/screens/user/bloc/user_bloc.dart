import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:satasat_app/screens/user/model/user_model.dart';
import 'package:satasat_app/screens/user/service/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserGetEvent>((event, emit) async {
      emit(UserGetLoading());
      var response = await UserService().getUserData();
      if (response?.id != null) {
        emit(UserGetSuccess(data: response));
      }
    });
  }
}
