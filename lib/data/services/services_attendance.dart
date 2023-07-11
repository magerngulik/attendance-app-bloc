import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ServiceAttandance {
  final Dio dioClient;
  ServiceAttandance({required this.dioClient});
  String baseUrl = "http://attendance-app.test";

  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> absenMasuk(
      {required String id, required String lokasiMasuk}) async {
    try {
      var response = await dioClient.post(
        "$baseUrl/api/attendance/absenMasuk",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "lokasi_masuk": lokasiMasuk,
          "user_id": id,
        },
      );

      Map obj = response.data;
      return Right(Map<String, dynamic>.from(obj));
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          Map<String, dynamic>? responseMap =
              e.response?.data as Map<String, dynamic>?;

          return Left(responseMap!);
        }

        if (e.response?.statusCode == 409) {
          Map<String, dynamic>? responseMap =
              e.response?.data as Map<String, dynamic>?;

          return Left(responseMap!);
        }

        Map<String, dynamic> message = {
          "message": "Server sedang maintance harap login beberapa saat lagi",
          "status code": e.response!.statusCode
        };
        return Left(message);
      } else {
        Map<String, dynamic> message = {"message": e.toString()};
        return Left(message);
      }
    }
  }

  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> absenKeluar(
      {required String id, required String lokasiKeluar}) async {
    try {
      var response = await dioClient.post(
        "$baseUrl/api/attendance/absenKeluar",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "lokasi_keluar": lokasiKeluar,
          "user_id": id,
        },
      );

      Map obj = response.data;
      return Right(Map<String, dynamic>.from(obj));
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          Map<String, dynamic>? responseMap =
              e.response?.data as Map<String, dynamic>?;

          return Left(responseMap!);
        }

        if (e.response?.statusCode == 409) {
          Map<String, dynamic>? responseMap =
              e.response?.data as Map<String, dynamic>?;

          return Left(responseMap!);
        }

        Map<String, dynamic> message = {
          "message": "Server sedang maintance harap login beberapa saat lagi",
          "status code": e.response!.statusCode
        };
        return Left(message);
      } else {
        Map<String, dynamic> message = {"message": e.toString()};
        return Left(message);
      }
    }
  }

  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> cekAbsen(
      {required String id}) async {
    try {
      final response =
          await dioClient.get("$baseUrl/api/attendance/getAttendance/$id");
      Map obj = response.data;
      return Right(Map<String, dynamic>.from(obj));
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          Map<String, dynamic>? responseMap = {
            "message": "Not Found",
            "status": false
          };
          return Left(responseMap);
        }

        if (e.response?.statusCode == 409) {
          Map<String, dynamic>? responseMap =
              e.response?.data as Map<String, dynamic>?;

          return Left(responseMap!);
        }

        Map<String, dynamic> message = {
          "message": "Server sedang maintance harap login beberapa saat lagi",
          "status code": e.response!.statusCode
        };
        return Left(message);
      } else {
        Map<String, dynamic> message = {"message": e.toString()};
        return Left(message);
      }
    }
  }
}
