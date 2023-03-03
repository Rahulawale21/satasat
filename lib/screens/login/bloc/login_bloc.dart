import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:satasat_app/global_service/auth.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      emit(LoginLoding());
      var response = await AuthService()
          .loginWithEmailAndPassword(event.email, event.password);
      if (response) {
        emit(LoginSuccess());
      }
    });
  }
}
