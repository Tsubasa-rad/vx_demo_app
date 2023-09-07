// ignore_for_file: must_be_immutable

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:vx_demo_app/style.dart';

class TopCardProfile extends StatelessWidget {
  final String universityName,
      faculty,
      subject,
      studentName,
      studentNumber,
      address;
  TopCardProfile({
    super.key,
    required this.faculty,
    required this.subject,
    required this.studentName,
    required this.studentNumber,
    required this.universityName,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // width: size.width,
      height: 200,
      decoration: Styles.cardDecoration,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  universityName,
                  style: Styles.cardTextStyle1,
                ),
                Text(
                  "学生証",
                  style: Styles.cardTextStyle1,
                )
              ],
            ),
          ),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(20),
          ),
          Spacer(),
          CardTextList(title: faculty, subtitle: subject),
          CardTextList(title: "氏　　名", subtitle: studentName, name: true),
          CardTextList(title: "学籍番号", subtitle: studentNumber),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(20),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width / 2.5,
                height: 40,
                child: BarcodeWidget(
                  barcode: Barcode.codabar(), // 任意のバーコードの規格
                  data: '2${studentNumber}', // 任意のdetaを指定
                  width: 545,
                  height: 196,
                  drawText: false, // <- バーコード下部にdetaの値を表示させない
                ),
              ), // 生成したいバーコードデータを指定
              SizedBox(
                width: size.width / 3,
                child: Text(
                  address,
                  style: Styles.cardTextStyle3,
                  softWrap: true, // テキストを折り返すかどうかを設定
                  overflow: TextOverflow.fade, // 文字がはみ出した場合にフェードアウトする
                  maxLines: 2, // 表示する最大行数
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CardTextList extends StatefulWidget {
  final String title, subtitle;
  bool name;
  CardTextList(
      {super.key,
      required this.title,
      required this.subtitle,
      this.name = false});

  @override
  State<CardTextList> createState() => _CardTextListState();
}

class _CardTextListState extends State<CardTextList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: Styles.cardTextStyle2,
        ),
        SizedBox(width: 20),
        SizedBox(
          width: 200,
          child: Text(
            widget.subtitle,
            style: TextStyle(
                color: Colors.white,
                fontSize: widget.name ? 15 : 20,
                fontWeight: FontWeight.bold),
            softWrap: true, // テキストを折り返すかどうかを設定
            overflow: TextOverflow.fade, // 文字がはみ出した場合にフェードアウトする
            maxLines: 2, // 表示する最大行数
          ),
        )
      ],
    );
  }
}
