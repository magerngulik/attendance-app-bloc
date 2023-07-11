// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'attendance_bloc.dart';

class AttendanceEvent {}

class AbsenMasukEvent extends AttendanceEvent {
  final String id;
  final String locationMasuk;
  AbsenMasukEvent({
    required this.id,
    required this.locationMasuk,
  });
}

class AbsenKeluarEvent extends AttendanceEvent {
  final String id;
  final String locationKeluar;
  AbsenKeluarEvent({
    required this.id,
    required this.locationKeluar,
  });
}

class LoadedAttendaceEvent extends AttendanceEvent {
  final String id;
  LoadedAttendaceEvent({
    required this.id,
  });
}
