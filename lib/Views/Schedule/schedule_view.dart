// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vx_demo_app/Models/day_of_week_model.dart';
import 'package:vx_demo_app/Models/timetable_model.dart';
import 'package:vx_demo_app/style.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  DateTime dateNow = DateTime.now();
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('大学スケジュール'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    ...List.generate(
                      timetable.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.5),
                        child: Container(
                          height: 100.0, // セルの高さ
                          color: blue.withOpacity(0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                timetable[index].start,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                              Text("${timetable[index].timetable}"),
                              Text(
                                timetable[index].end,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                            dayOfWeekModel.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: size.width / 6.5,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: dateNow.weekday ==
                                            dayOfWeekModel[index].weekday
                                        ? green
                                        : blue.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Text(
                                    dayOfWeekModel[index].weekdayString,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: size.width - 50,
                      child: Wrap(
                        // alignment: WrapAlignment.center, // 要素を中央に配置
                        spacing: 10, // 要素間の横方向のスペース
                        runSpacing: 5, // 要素間の縦方向のスペース
                        children: List.generate(
                          25, // 5x5のセル数
                          (index) => GestureDetector(
                            onTap: () {
                              print("${index}");

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return EditAlert(context, index);
                                  });
                            },
                            child: Container(
                              width: size.width / 6.5, // セルの幅
                              height: 100.0, // セルの高さ

                              decoration: BoxDecoration(
                                color: blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Center(
                                child: Text(
                                  '$index', // セル内のテキスト
                                  style: TextStyle(
                                    fontSize: 16.0, // テキストのフォントサイズ
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              child: Text("その他追加"),
            )
          ],
        ));
  }

  AlertDialog EditAlert(BuildContext context, int index) {
    // textController.text = widget.data[widget.cardIndex]['list'][index]
    // [3]; // 保存されたテキストを編集用コントローラーにセット
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('コメントを残す...'),
          IconButton(
            onPressed: () {
              // textController.text = ""; // 保存されたテキストを空文字列に設定
              textController.clear();
            },
            icon: Icon(
              Icons.delete_outline_rounded,
              color: blue,
            ),
          ),
        ],
      ),
      content: TextField(
        // controller: model.usernameController,
        decoration: InputDecoration(
          hintText: 'コメントを編集する ${index}',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        controller: textController,
        maxLines: 5,
        maxLength: 300,
      ),
      actions: [
        TextButton(
          onPressed: () {
            textController.clear();
            // refreshDataList;
            Navigator.pop(context);
          },
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () {
            // editDataItem(widget.data[widget.cardIndex]['id']);
            // refreshDataList;
            Navigator.pop(context);
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
}
