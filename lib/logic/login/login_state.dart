// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final Map<String, dynamic> dataUser;
  const LoginLoaded({
    required this.dataUser,
  });
}

class LoginError extends LoginState {
  final String error;
  const LoginError({
    required this.error,
  });
}

class LogoutErorr extends LoginState {
  final String logoutError;
  const LogoutErorr({
    required this.logoutError,
  });
}
