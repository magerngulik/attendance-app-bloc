import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ServiceAttandance {
  final Dio dioClient;
  ServiceAttandance({required this.dioClient});
  String baseUrl = "http://attendance-app.test";

  Future<Either<String, List<Map<String, dynamic>>>> getAbsen(String id) async {
    try {
      final response = await dioClient.get("$baseUrl/api/attendance/day/$id");
      Map obj = response.data;
      return Right(List<Map<String, dynamic>>.from(obj['data']));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
