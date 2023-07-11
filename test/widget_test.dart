import 'package:attendance_app/data/services/services_attendance.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

void main() async {
  Dio dioClient = Dio();
  var data = ServiceAttandance(dioClient: dioClient);
  final logger = Logger();
  test('cek absen benar', () async {
    var response = await data.cekAbsen(
      id: "1",
    );
    expect(response.isRight(), true);
    expect(response.isLeft(), false);
  });
  test('cek salah no absen', () async {
    var response = await data.cekAbsen(id: "4");
    expect(response.isRight(), false);
    expect(response.isLeft(), true);
  });

  await testget(data, "Cek Absen", logger, "1");
}

Future<void> testget(
    ServiceAttandance data, String title, Logger logger, String id) async {
  var testingLoginService = await data.cekAbsen(id: id);
  debugPrint(title);
  testingLoginService.fold(
    (l) {
      logger.w(l);
    },
    (r) {
      logger.d(r);
    },
  );
}
