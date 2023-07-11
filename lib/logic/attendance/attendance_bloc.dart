import 'package:bloc/bloc.dart';

import 'package:attendance_app/data/services/services_attendance.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final ServiceAttandance services;
  AttendanceBloc({
    required this.services,
  }) : super(AttendanceInitial()) {
    on<AbsenMasukEvent>((event, emit) async {
      // var loger = Logger();
      emit(AttendanceLoading());
      var result = await services.absenMasuk(
          id: event.id, lokasiMasuk: event.locationMasuk);
      Map<String, dynamic> data = {};
      result.fold((l) {
        data = l;
        if (data['status'] == 409) {
          emit(AttendanceError(error: data['message']));
        } else {
          emit(AttendanceError(error: data['message']));
        }
      }, (r) {
        data = r;
        emit(AttendanceLoaded(data: data));
      });
    });

    on<AbsenKeluarEvent>((event, emit) async {
      // var loger = Logger();
      emit(AttendanceLoading());
      var result = await services.absenKeluar(
          id: event.id, lokasiKeluar: event.locationKeluar);
      Map<String, dynamic> data = {};
      result.fold((l) {
        data = l;
        if (data['status'] == 409) {
          emit(AttendanceError(error: data['message']));
        } else {
          emit(AttendanceError(error: data['message']));
        }
      }, (r) {
        data = r;
        emit(AttendanceLoaded(data: data));
      });
    });

    on<LoadedAttendaceEvent>((event, emit) async {
      emit(AttendanceLoading());
      var result = await services.cekAbsen(id: "1");
      Map<String, dynamic> data = {};
      result.fold((l) {
        data = l;
        if (data['status'] == 409) {
          emit(AttendanceError(error: data['message']));
        } else {
          emit(AttendanceError(error: data['message']));
        }
      }, (r) {
        data = r;
        emit(AttendanceLoaded(data: data));
      });
    });
  }
}
