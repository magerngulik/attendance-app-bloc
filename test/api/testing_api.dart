import 'package:attendance_app/data/services/services_attendance.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Dio dioClient = Dio();
  var data = ServiceAttandance(dioClient: dioClient);

  test('api get Destination', () async {
    var response = await data.getAbsen("1");
    expect(response.isRight(), true);
    expect(response.isLeft(), false);
  });
}
