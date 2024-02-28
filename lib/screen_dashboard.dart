import 'package:assignment_app/data_apis/screen_dashboard_apis.dart';
import 'package:assignment_app/data_hive/screen_dashboard_hive.dart';
import 'package:assignment_app/data_sqflite/screen_dashboard_sqflite.dart';
import 'package:flutter/material.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment Dashboard"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => ApiDashboard()));
                },
                child: Text("APIS Dashboard")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ScreenDashboardSqflite()));
                },
                child: Text("SQFlite Dashboard")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ScreenDashboardHive()));
                },
                child: Text("Hive Dashboard")),
          ],
        ),
      ),
    );
  }
}
