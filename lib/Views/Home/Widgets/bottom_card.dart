import 'package:flutter/material.dart';
import 'package:vx_demo_app/Models/home_bottom_card_model.dart';
import 'package:vx_demo_app/style.dart';

class BottomCard extends StatelessWidget {
  final HomeBottomCardModel cardModel;
  const BottomCard({super.key, required this.cardModel});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 2 - 30,
      height: size.width / 2,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 10,
            offset: Offset(5, 7),
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => cardModel.ontap,
              ));
        },
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: white,
            gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  cardModel.color1.withOpacity(0.6),
                  cardModel.color2.withOpacity(0.6),
                ],
                stops: const [
                  0.0,
                  1.0,
                ]),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              Styles.shadowCard,
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              cardModel.image != null
                  ? Image.asset(cardModel.image!)
                  : Icon(
                      cardModel.icon,
                      size: size.width / 7,
                      color: black,
                    ),
              const SizedBox(height: 10),
              Text(
                cardModel.title,
                style: Styles.cardTextStyle3,
                softWrap: true, // テキストを折り返すかどうかを設定
                overflow: TextOverflow.fade, // 文字がはみ出した場合にフェードアウトする
                maxLines: 2, // 表示する最大行数
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
