// // ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// import 'package:attendance_app/data/models/weather_model.dart';
// import 'package:attendance_app/data/services/permission_location.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:logger/logger.dart';

// class QLocationServices extends StatefulWidget {
//   const QLocationServices({Key? key}) : super(key: key);

//   @override
//   State<QLocationServices> createState() => _QLocationServicesState();
// }

// class _QLocationServicesState extends State<QLocationServices> {
//   var log = Logger();
//   var location = LocationServices();
//   Position? data;
//   double? latitude;
//   double? longitude;
//   String checkLokasi = "";
//   Weather? weather;
//   String? error;

//   String? currentLocation;

//   @override
//   void initState() {
//     super.initState();
//   }

//   getLocation() async {
//     await location.getPermision();
//     var data = await location.getWeather();
//     data.fold((l) {
//       error = l;
//     }, (r) {
//       currentLocation =
//           "${r.location.name}, ${r.location.region}, ${r.location.country}";
//     });
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Dashboard"),
//         actions: const [],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Text(
//                 "Current = $currentLocation",
//                 style: const TextStyle(
//                   fontSize: 20.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () => getLocation(),
//                   child: const Text("Save"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
