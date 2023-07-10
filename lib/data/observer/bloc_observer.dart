import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    var loger = Logger();
    loger.v(change);
  }
}
