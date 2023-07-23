import 'package:attendance_app/data/services/qurl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ServicesUser {
  final Dio dioClient;
  ServicesUser({
    required this.dioClient,
  });
  var log = Logger();
  final String _baseUrl = BaseUrlAttendance().baseUrlAttandace;
  Future<Either<String, Map>> login(
      {required String email, required String password}) async {
    log.w(" url = $_baseUrl");
    try {
      var response = await dioClient.post(
        "$_baseUrl/api/auth/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );
      Map obj = response.data['data'];

      return Right(obj);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          Map<String, dynamic>? responseMap =
              e.response?.data as Map<String, dynamic>?;
          String errorMessage = responseMap?['message'] ??
              "Unauthorized. Please check your credentials.";
          return Left(errorMessage);
        }
        return Left(
            "Server sedang maintance harap login beberapa saat lagi ${e.response!.statusCode}");
      } else {
        return Left(e.toString());
      }
    }
  }

  Future<Either<String, String>> logout({required String token}) async {
    try {
      var response = await dioClient.get(
        "$_baseUrl/api/auth/logout",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          },
        ),
      );
      Map obj = response.data;
      String message = obj['message'];
      return Right(message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
