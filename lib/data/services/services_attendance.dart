import 'package:attendance_app/data/services/qurl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ServiceAttandance {
  final Dio dioClient;
  ServiceAttandance({required this.dioClient});
  var log = Logger();

  final String _baseUrl = BaseUrlAttendance().baseUrlAttandace;

  Future<Either<Map<String, dynamic>, Map<String, dynamic>>> absenMasuk(
      {required String id, required String lokasiMasuk}) async {
    log.w("lokasi masuk = $lokasiMasuk, url = $_baseUrl");
    try {
      var response = await dioClient.post(
        "$_baseUrl/api/attendance/absenMasuk",
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
          "message":
              "Server sedang maintance harap login beberapa saat lagi LOGIN ${e.response!.statusCode}",
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
        "$_baseUrl/api/attendance/absenKeluar",
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
          "message":
              "Server sedang maintance harap coba beberapa saat lagi LG ${e.response!.statusCode}",
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
          await dioClient.get("$_baseUrl/api/attendance/getAttendance/$id");
      Map obj = response.data;
      return Right(Map<String, dynamic>.from(obj));
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          Map<String, dynamic>? responseMap = {
            "message": "Not Found",
            "status": false,
            "status_code": 404
          };
          return Left(responseMap);
        }

        if (e.response?.statusCode == 409) {
          Map<String, dynamic>? responseMap =
              e.response?.data as Map<String, dynamic>?;
          responseMap!["status_code"] = 409;
          return Left(responseMap);
        }

        Map<String, dynamic> message = {
          "message": "Server sedang maintance harap login beberapa saat lagi",
          "status_code": e.response!.statusCode
        };
        return Left(message);
      } else {
        Map<String, dynamic> message = {"message": e.toString()};
        return Left(message);
      }
    }
  }
}
