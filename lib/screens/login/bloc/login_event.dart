part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class DoLoginEvent implements LoginEvent {
  final String email;
  final String password;
  DoLoginEvent({
    required this.email,
    required this.password,
  });
}
