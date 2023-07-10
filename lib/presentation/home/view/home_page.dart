// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:attendance_app/presentation/home/widget/q_clock_home_page.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    const Text(
                      "09:22",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    const Text(
                      "Rabu,23 December 2018",
                      style: TextStyle(
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
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.login),
                            label: const Text("Login"),
                            onPressed: () {},
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.logout),
                            label: const Text("Logout"),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    QClockHomePage(
                        time: "20.00",
                        status: "Check In",
                        icon: Icons.more_time),
                    QClockHomePage(
                        time: "17:00",
                        status: "Check Out",
                        icon: Icons.access_time_sharp),
                    QClockHomePage(
                        time: "07:00",
                        status: "Working Time",
                        icon: Icons.access_time_sharp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
