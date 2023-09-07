import 'package:flutter/material.dart';
import 'package:vx_demo_app/Views/CardTicket/TicketWidgets/ticket_design_view.dart';
import 'package:vx_demo_app/Views/CardTicket/card_ticket_detail.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      // height: 250,
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CardTicketDetail(),
          //     fullscreenDialog: true,
          //   ),
          // );
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (BuildContext context) {
              return CardTicketDetail(
                categoryName: "クーポン券",
                givingGiftName: "VX構想企画",
                myName: "山田太郎",
                dateExpiry: DateTime(2023, 12, 22),
                alreadyUsedCard: true,
              );
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.only(right: 16),
          child: TicketDesignView(
            categoryName: "クーポン券",
            givingGiftName: "VX構想企画",
            myName: "山田太郎",
            dateExpiry: DateTime(2023, 12, 22),
            alreadyUsedCard: true,
          ),
        ),
      ),
    );
  }
}
