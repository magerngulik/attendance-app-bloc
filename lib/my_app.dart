import 'package:attendance_app/data/services/permission_location.dart';
import 'package:attendance_app/data/services/services_attendance.dart';
import 'package:attendance_app/data/services/services_user.dart';
import 'package:attendance_app/logic/attendance/attendance_bloc.dart';
import 'package:attendance_app/logic/login/login_bloc.dart';
import 'package:attendance_app/presentation/login/view/login_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    ServiceAttandance serviceAttandance = ServiceAttandance(dioClient: dio);
    ServicesUser servicesUser = ServicesUser(dioClient: dio);
    LocationServices servicesLoasi = LocationServices(dioClient: dio);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AttendanceBloc(
              services: serviceAttandance, location: servicesLoasi),
        ),
        BlocProvider(
          create: (context) => LoginBloc(services: servicesUser),
        )
      ],
      child: MaterialApp(
          title: 'Attendance App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const LoginView()),
    );
  }
}
