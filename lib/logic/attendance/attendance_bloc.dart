import 'package:bloc/bloc.dart';

import 'package:attendance_app/data/services/services_attendance.dart';
import 'package:logger/logger.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final ServiceAttandance services;
  AttendanceBloc({
    required this.services,
  }) : super(AttendanceInitial()) {
    var loger = Logger();
    on<AbsenMasukEvent>((event, emit) async {
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
        if (data.isEmpty) {
          emit(AttendanceError(error: "Data Kosong Kuy"));
        } else {
          loger.d("ini data udah ngak kosong");
          loger.w(data);

          emit(AttendanceCompleate(message: data['message']));
        }
      });
    });

    on<LoadedAttendaceEvent>((event, emit) async {
      emit(AttendanceLoading());
      var result = await services.cekAbsen(id: event.id);
      loger.d("ini jalan ya");
      Map<String, dynamic> data = {};
      result.fold((l) {
        data = l;
        if (data['status_code'] == 409) {
          emit(AttendanceInitial());
        } else {
          emit(AttendanceError(error: data['message']));
        }
      }, (r) {
        data = r;
        if (data.isEmpty) {
          loger.d("ini data kosong: userId>>> ${event.id}");
          emit(AttendanceError(error: "Data Kembalian Kosong"));
        } else {
          emit(AttendanceLoaded(data: data));
        }
      });
    });
  }
}
