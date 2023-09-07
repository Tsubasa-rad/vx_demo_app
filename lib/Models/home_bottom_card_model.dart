import 'package:flutter/material.dart';
import 'package:vx_demo_app/Views/Attendance/attendance_view.dart';
import 'package:vx_demo_app/Views/Schedule/schedule_view.dart';
import 'package:vx_demo_app/style.dart';

class HomeBottomCardModel {
  final String title;
  final icon;
  final ontap;
  final String? url, image;
  final Color color1, color2;

  HomeBottomCardModel({
    required this.title,
    required this.icon,
    this.ontap,
    required this.url,
    required this.color1,
    required this.color2,
    this.image,
  });
}

final cardModel = [
  HomeBottomCardModel(
    title: '出席管理',
    icon: Icons.fact_check_outlined,
    ontap: AttendanceView(),
    url: null,
    color1: baseColor,
    color2: blue,
  ),
  HomeBottomCardModel(
    title: 'スケジュール管理',
    icon: Icons.lightbulb_circle_outlined,
    ontap: ScheduleView(),
    url: null,
    color1: Colors.pink,
    color2: gradation2,
  ),
];
