// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class TryLogin extends LoginEvent {
  final String email, password;
  const TryLogin({
    required this.email,
    required this.password,
  });
}

class Logout extends LoginEvent {
  final String token;
  const Logout({
    required this.token,
  });
}
