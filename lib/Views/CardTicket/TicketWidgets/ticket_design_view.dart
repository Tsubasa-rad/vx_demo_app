// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vx_demo_app/Views/CardTicket/TicketWidgets/ticket_container.dart';
import 'package:vx_demo_app/style.dart';

class TicketDesignView extends StatelessWidget {
  final String categoryName, givingGiftName, myName;
  final int numberTimes = 1;
  final DateTime dateExpiry;
  final bool alreadyUsedCard;
  final Color textColor, cardTop, cardBottom;
  const TicketDesignView({
    super.key,
    required this.categoryName,
    required this.givingGiftName,
    required this.myName,
    required this.dateExpiry,
    this.alreadyUsedCard = false,
    this.textColor = cardTicketTextColor,
    this.cardTop = cardTopColor,
    this.cardBottom = cardBottomColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //showing the blue part of the card
        Container(
          decoration: BoxDecoration(
            color: cardTop,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(21),
              topRight: Radius.circular(21),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categoryName,
                  style: Styles.hedLineStyle3.copyWith(color: textColor),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "詳細",
                    style: Styles.hedLineStyle4.copyWith(color: textColor),
                  ),
                )
              ],
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    givingGiftName,
                    style: Styles.hedLineStyle4.copyWith(color: textColor),

                    softWrap: true, // テキストを折り返すかどうかを設定
                    overflow: TextOverflow.fade, // 文字がはみ出した場合にフェードアウトする
                    maxLines: 2, // 表示する最大行数
                  ),
                ),
                SizedBox(width: 5),
                TicketContainer(),
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 24,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                (constraints.constrainWidth() / 6).floor(),
                                (index) => const SizedBox(
                                  width: 3,
                                  height: 1,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Center(
                        child: Transform.rotate(
                          angle: 2.5,
                          child: const Icon(
                            Icons.card_membership_rounded,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TicketContainer(),
                SizedBox(width: 5),
                SizedBox(
                  width: 80,
                  child: Text(
                    myName,
                    style: Styles.hedLineStyle4.copyWith(color: textColor),
                    softWrap: true, // テキストを折り返すかどうかを設定
                    overflow: TextOverflow.fade, // 文字がはみ出した場合にフェードアウトする
                    maxLines: 2, // 表示する最大行数
                  ),
                )
              ],
            )
          ]),
        ),
        //showing the blue part of the card
        Container(
          color: cardBottom,
          child: Row(
            children: [
              SizedBox(
                height: 20,
                width: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: cardTicketSideColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: alreadyUsedCard
                      ? EdgeInsets.all(12)
                      : EdgeInsets.only(top: 12, right: 12, left: 12),
                  child: Column(
                    children: [
                      LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => const SizedBox(
                                width: 5,
                                height: 1,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
                width: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: cardTicketSideColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        alreadyUsedCard
            ? Container(
                decoration: BoxDecoration(
                  color: cardBottom,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "使用回数${numberTimes}回まで",
                        style: Styles.hedLineStyle4.copyWith(color: textColor),
                      ),
                      Text(
                        "有効期限 ${dateExpiry.year}/${dateExpiry.month}/${dateExpiry.day}",
                        style: Styles.hedLineStyle4.copyWith(color: textColor),
                      ),
                    ],
                  )
                ]),
              )
            : SizedBox(),
      ],
    );
  }
}
