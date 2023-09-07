// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vx_demo_app/Models/home_bottom_card_model.dart';
import 'package:vx_demo_app/Views/Home/Widgets/bottom_card.dart';
import 'package:vx_demo_app/Views/Home/Widgets/ticket_card.dart';
import 'package:vx_demo_app/Views/Home/Widgets/top_card_profile.dart';
import 'package:vx_demo_app/Views/MyCode/qr_code_view.dart';
import 'package:vx_demo_app/style.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _cardWallet = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Positioned(
                  top: 110,
                  child: Container(
                    width: size.width - 16,
                    height: 110,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(20), // 角丸にする
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _cardWallet = !_cardWallet;
                      });
                    },
                    child: TopCardProfile(
                      universityName: '崇城大学',
                      faculty: "情報学部",
                      subject: "情報学科",
                      studentName: "山田太郎",
                      studentNumber: "2031022",
                      address: '熊本市西区池田4丁目22-1',
                    ),
                  ),
                ),
                Positioned(
                  bottom: _cardWallet ? -70 : 0,
                  child: Container(
                    width: size.width - 16,
                    height: 70,
                    decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(20), // 角丸にする
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardBottomButton(
                            Icons.help,
                            "使い方",
                            () {},
                          ),
                          cardBottomButton(
                            Icons.qr_code,
                            "QRコード",
                            () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QRCodeView(codeData: "2031022",),
                                    fullscreenDialog: true,
                                  ));
                            },
                          ),
                          cardBottomButton(
                            Icons.settings,
                            "カード設定",
                            () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("現在取得中チケット", style: Styles.hedLineStyle2),
                InkWell(
                  onTap: () {
                    print("object");
                  },
                  child: Text("詳細",
                      style: Styles.textStyle.copyWith(color: baseColor)),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: List.generate(4, (index) => TicketCard()),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Wrap(
              runSpacing: 15,
              spacing: 20,
              children: cardModel
                  .map((cardModel) => BottomCard(cardModel: cardModel))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector cardBottomButton(icon, String text, ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          width: 70,
          height: 50,
          decoration: BoxDecoration(
              color: white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 25,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 10),
              ),
            ],
          )),
    );
  }
}
