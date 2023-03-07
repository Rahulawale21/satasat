part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserGetLoading extends UserState {}

class UserGetSuccess extends UserState {
  final UserModel? data;
  UserGetSuccess({this.data});
}

class UserGetFailed extends UserState {}
