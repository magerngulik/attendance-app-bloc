// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'attendance_bloc.dart';

class AttendanceEvent {}

class AbsenMasukEvent extends AttendanceEvent {
  final String id;
  AbsenMasukEvent({
    required this.id,
  });
}

class AbsenKeluarEvent extends AttendanceEvent {
  final String id;
 
  AbsenKeluarEvent({
    required this.id,

  });
}

class LoadedAttendaceEvent extends AttendanceEvent {
  final String id;
  LoadedAttendaceEvent({
    required this.id,
  });
}
