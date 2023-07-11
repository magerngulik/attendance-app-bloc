import 'package:attendance_app/data/services/services_attendance.dart';
import 'package:attendance_app/logic/attendance/attendance_bloc.dart';
import 'package:attendance_app/presentation/home/view/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    ServiceAttandance serviceAttandance = ServiceAttandance(dioClient: dio);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AttendanceBloc(services: serviceAttandance),
        ),
      ],
      child: MaterialApp(
          title: 'Attendance App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePageView()),
    );
  }
}
