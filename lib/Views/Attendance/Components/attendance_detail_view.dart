import 'package:flutter/material.dart';
import 'package:vx_demo_app/style.dart';

class AttendanceDetailView extends StatelessWidget {
  const AttendanceDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("詳細"),
        elevation: 1,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Text(
            "data",
            style: Styles.hedLineStyle1,
          )
        ],
      )),
    );
  }
}
