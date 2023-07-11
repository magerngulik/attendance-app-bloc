import 'dart:async';

import 'package:attendance_app/logic/attendance/attendance_bloc.dart';
import 'package:attendance_app/shared/dialog/show_info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widget/q_clock_home_page.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final DateTime _dateTime = DateTime.now();
  DateTime tanggal = DateTime.now();
  Stream<DateTime>? _dateTimeStream;
  StreamController<DateTime>? _dateTimeController;

  @override
  void initState() {
    super.initState();
    _dateTimeController = StreamController<DateTime>();
    _startTimer();
  }

  void _startTimer() {
    _dateTimeStream = Stream<DateTime>.periodic(
      const Duration(seconds: 1),
      (_) => DateTime.now(),
    );

    _dateTimeController!.addStream(_dateTimeStream!);
  }

  @override
  void dispose() {
    _dateTimeController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(">>>>>REBUILT");
    var attandance = context.read<AttendanceBloc>();
    return BlocListener<AttendanceBloc, AttendanceState>(
      bloc: attandance,
      listener: (context, state) async {
        if (state is AttendanceError) {
          await showInfoDialog(state.error, context: context);
          attandance.add(LoadedAttendaceEvent(
            id: "1",
          ));
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100.0,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StreamBuilder<DateTime>(
                        stream: _dateTimeController!.stream,
                        initialData: DateTime.now(),
                        builder: (context, snapshot) {
                          debugPrint(">>>>>REDATA");
                          if (snapshot.hasData) {
                            return Text(
                              "${snapshot.data!.hour}: ${snapshot.data!.minute}",
                              style: const TextStyle(fontSize: 30),
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
                      const CircleAvatar(
                        maxRadius: 100,
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/PGv8ZzG/me.jpg",
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Zulkarnaen",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
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
                        onPressed: () {
                          attandance.add(AbsenMasukEvent(
                              id: "1", locationMasuk: 'Kantor Utama'));
                        },
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.logout),
                        label: const Text("Logout"),
                        onPressed: () {
                          attandance.add(AbsenKeluarEvent(
                              id: "1", locationKeluar: 'Kantor Utama'));
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
