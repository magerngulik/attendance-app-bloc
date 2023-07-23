import 'dart:async';
import 'package:attendance_app/logic/attendance/attendance_bloc.dart';
import 'package:attendance_app/shared/dialog/show_info_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../data/services/permission_location.dart';
import '../../../logic/login/login_bloc.dart';
import '../../../shared/dialog/q_confirmation_dialog.dart';
import '../../login/view/login_view.dart';
import '../widget/q_clock_home_page.dart';

class HomePageView extends StatefulWidget {
  final Map<String, dynamic> data;
  const HomePageView({Key? key, required this.data}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  DateTime tanggal = DateTime.now();
  Stream<DateTime>? _dateTimeStream;
  StreamController<DateTime>? _dateTimeController;
  var log = Logger();
  var location = LocationServices(dioClient: Dio());

  String idUser = "";
  String token = "";
  Map<String, dynamic> dataUser = {};
  var logger = Logger();

  _getDataByParameter() {
    token = widget.data['token'];
    dataUser = widget.data['user'];
    idUser = widget.data['user']['id'].toString();
  }

  String replaceBackslashWithSlash(String inputString) {
    // Menggunakan metode replaceAll untuk mengganti backslash (\) dengan slash (/)
    String outputString = inputString.replaceAll('\\', '/');
    return outputString;
  }

  @override
  void initState() {
    super.initState();
    _dateTimeController = StreamController<DateTime>();
    _getDataByParameter();
    _cekDataAwal();
    _startTimer();
  }

  _cekDataAwal() {
    logger.wtf("User id awal: $idUser");
    logger.wtf(widget.data);
    context
        .read<AttendanceBloc>()
        .add(LoadedAttendaceEvent(id: widget.data['user']['id'].toString()));
  }

  void _startTimer() {
    _dateTimeStream = Stream<DateTime>.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now(),
    );
    _dateTimeController!.addStream(_dateTimeStream!);
  }

  _setKosong() {
    idUser = "";
    token = "";
    dataUser = {};
  }

  @override
  void dispose() {
    _dateTimeController!.close();
    _setKosong();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var attandance = context.read<AttendanceBloc>();
    var login = context.read<LoginBloc>();
    return MultiBlocListener(
      listeners: [
        BlocListener<AttendanceBloc, AttendanceState>(
          bloc: attandance,
          listener: (context, state) async {
            if (state is AttendanceError) {
              showInfoDialog(
                  buildContext: context,
                  message: state.error,
                  title: "Kesalahan");
              attandance.add(LoadedAttendaceEvent(
                id: idUser,
              ));
            } else if (state is AttendanceCompleate) {
              showInfoDialog(
                  buildContext: context, message: state.message, title: "Info");
              attandance.add(LoadedAttendaceEvent(
                id: idUser,
              ));
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          bloc: login,
          listener: (context, state) async {
            if (state is LoginInitial) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          actions: [
            IconButton(
              onPressed: () {
                qshowConfirmationDialog(
                    context: context,
                    ontap: () {
                      login.add(Logout(token: token));
                    },
                    title: "Peringatan",
                    message: "Apakah anda yakin ingin keluar?");
              },
              icon: const Icon(
                Icons.logout,
                size: 24.0,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StreamBuilder<DateTime>(
                        stream: _dateTimeController!.stream,
                        initialData: DateTime.now(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              "${snapshot.data!.hour}: ${snapshot.data!.minute}",
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          } else {
                            return const Text(
                              'Loading...',
                              style: TextStyle(fontSize: 24),
                            );
                          }
                        },
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        bloc: login,
                        builder: (context, state) {
                          if (state is LoginLoaded) {
                            Map<String, dynamic> item = state.dataUser;
                            var dataUser = item['user'];
                            var avatar =
                                replaceBackslashWithSlash(dataUser['avatar']);

                            return Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: avatar,
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                          maxRadius: 100,
                                          backgroundImage: imageProvider),
                                  placeholder: (context, url) =>
                                      const CircleAvatar(
                                          maxRadius: 100,
                                          child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "${dataUser['name']}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${dataUser['email']}",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 80.0,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.login),
                        label: const Text("Check in"),
                        onPressed: () async {
                          await location.getPermision();

                          attandance.add(AbsenMasukEvent(id: idUser));
                        },
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.logout),
                        label: const Text("Check Out"),
                        onPressed: () async {
                          await location.getPermision();
                          attandance.add(AbsenKeluarEvent(id: idUser));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                BlocBuilder<AttendanceBloc, AttendanceState>(
                  bloc: attandance,
                  builder: (context, state) {
                    if (state is AttendanceLoaded) {
                      var item = state.data['data'];
                      String? absenMasuk = item['waktu_masuk'] ?? '-';
                      String? absenKeluar = item['waktu_keluar'] ?? '-';
                      String? waktuKerja = item['waktu_kerja'] ?? '-';

                      return Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            QClockHomePage(
                                time: absenMasuk ?? '-',
                                status: "Check In",
                                icon: Icons.more_time),
                            QClockHomePage(
                                time: absenKeluar ?? "-",
                                status: "Check Out",
                                icon: Icons.access_time_sharp),
                            QClockHomePage(
                                time: waktuKerja ?? "-",
                                status: "Working Time",
                                icon: Icons.access_time_sharp),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            QClockHomePage(
                                time: '-',
                                status: "Check In",
                                icon: Icons.more_time),
                            QClockHomePage(
                                time: "-",
                                status: "Check Out",
                                icon: Icons.access_time_sharp),
                            QClockHomePage(
                                time: "-",
                                status: "Working Time",
                                icon: Icons.access_time_sharp),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
