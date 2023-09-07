// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vx_demo_app/Views/Attendance/Components/attendance_detail_view.dart';
import 'package:vx_demo_app/style.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "出席管理",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          ...List.generate(
            10,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Container(
                decoration: Styles.attendanceListDecoration,
                child: ListTile(
                  leading: Icon(Icons.dns_sharp),
                  title: Text("集中講義"),
                  subtitle: Text("2023/11/23"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AttendanceDetailView(),
                          fullscreenDialog: true),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
