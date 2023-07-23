// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:attendance_app/data/services/qurl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather_model.dart';

class LocationServices {
  Dio dioClient;

  LocationServices({
    required this.dioClient,
  });

  String baseUrl = BaseUrlAttendance().weatherApp;
  String keytoken = BaseUrlAttendance().token;

  Future<void> getPermision() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Future<Either<String, Weather>> getWeather() async {
    Position position = await Geolocator.getCurrentPosition();
    var latitude = position.latitude;
    var longitude = position.longitude;

    try {
      final response = await Dio()
          .get("$baseUrl/current.json?key=$keytoken&q=$latitude,$longitude");

      return Right(Weather.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
