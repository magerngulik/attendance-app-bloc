// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'attendance_bloc.dart';

abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final Map<String, dynamic> data;
  AttendanceLoaded({
    required this.data,
  });
}

class AttendanceError extends AttendanceState {
  final String error;
  AttendanceError({
    required this.error,
  });
}

class AttendanceCompleate extends AttendanceState {
  final String message;
  AttendanceCompleate({
    required this.message,
  });
}

class AttendanceCheking extends AttendanceState {}
