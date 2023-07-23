import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'location_check_state.dart';

class LocationCheckCubit extends Cubit<LocationCheckState> {
  LocationCheckCubit() : super(LocationCheckInitial());
}
