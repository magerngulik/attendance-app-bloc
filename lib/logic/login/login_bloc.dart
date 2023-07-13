// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/services/services_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ServicesUser services;
  LoginBloc({required this.services}) : super(LoginInitial()) {
    on<TryLogin>((event, emit) async {
      emit(LoginLoading());
      final result =
          await services.login(email: event.email, password: event.password);

      result.fold((l) {
        emit(LoginError(error: l));
      }, (r) => {emit(LoginLoaded(dataUser: r.cast()))});
    });

    on<Logout>((event, emit) async {
      emit(LoginLoading());
      final result = await services.logout(token: event.token);
      result.fold((l) {
        LogoutErorr(logoutError: l);
      }, (r) {
        emit(LoginInitial());
      });
    });
  }
}
