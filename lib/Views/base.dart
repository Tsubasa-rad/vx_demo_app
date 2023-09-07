import 'package:flutter/material.dart';
import 'package:vx_demo_app/Views/Home/home_view.dart';
import 'package:vx_demo_app/style.dart';

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sss"),
        backgroundColor: appBarBackground,
      ),
      body: HomeView(),
    );
  }
}
