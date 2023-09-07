// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vx_demo_app/Views/CardTicket/TicketWidgets/ticket_design_view.dart';
import 'package:vx_demo_app/style.dart';

class CardTicketDetail extends StatefulWidget {
  final String categoryName, givingGiftName, myName;
  final DateTime dateExpiry;
  final bool alreadyUsedCard;
  const CardTicketDetail({
    super.key,
    required this.categoryName,
    required this.givingGiftName,
    required this.myName,
    required this.dateExpiry,
    this.alreadyUsedCard = true,
  });

  @override
  State<CardTicketDetail> createState() => _CardTicketDetailState();
}

class _CardTicketDetailState extends State<CardTicketDetail> {
  double initialX = 0.0;
  double finalX = 0.0;
  bool swipeCompleted = false;

  void _onHorizontalDragStart(DragStartDetails details) {
    initialX = details.localPosition.dx;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    finalX = details.localPosition.dx;
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (finalX - initialX < -50.0) {
      // ジェスチャーが特定の閾値を超えた場合（例: -50.0ピクセル）
      setState(() {
        swipeCompleted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: swipeCompleted ? 450 : 270,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 100,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Center(
              child: GestureDetector(
                onHorizontalDragStart: _onHorizontalDragStart,
                onHorizontalDragUpdate: _onHorizontalDragUpdate,
                onHorizontalDragEnd: _onHorizontalDragEnd,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TicketDesignView(
                        categoryName: widget.categoryName,
                        givingGiftName: widget.givingGiftName,
                        myName: widget.myName,
                        dateExpiry: widget.dateExpiry,
                        alreadyUsedCard: !swipeCompleted,
                      ),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500), // アニメーションの時間を設定
                        child: swipeCompleted
                            ? Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  color: whiteBlack,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(21),
                                    bottomRight: Radius.circular(21),
                                  ),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: RotatingStar(),
                                    ),
                                    Positioned(
                                      right: 20,
                                      child: AutoScalingCircle(
                                        color: gradation2,
                                        begin: 10,
                                        end: 50,
                                        seconds: 1,
                                      ),
                                    ),
                                    AutoScalingCircle(
                                      color: gradation1,
                                      seconds: 4,
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      left: 30,
                                      child: AutoScalingCircle(
                                        color: baseColor,
                                        begin: 30,
                                      ),
                                    ),
                                    Positioned(
                                      left: 5,
                                      top: 5,
                                      child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              swipeCompleted = !swipeCompleted;
                                            });
                                          },
                                          child: Text(
                                            "リセット",
                                            style: Styles.restStyle,
                                          )),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "使用回数1回まで",
                                              style: Styles.hedLineStyle4
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                            Text(
                                              "有効期限 ${widget.dateExpiry.year}/${widget.dateExpiry.month}/${widget.dateExpiry.day}",
                                              style: Styles.hedLineStyle4
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 150,
                                              height: 150,
                                              child: QrImageView(
                                                data: "codeData",
                                                backgroundColor: white,
                                                foregroundColor: baseColor,
                                                // embeddedImage: const AssetImage("assets/icons/wa_be_logo.png"),
                                                embeddedImageStyle:
                                                    QrEmbeddedImageStyle(
                                                        size: Size.zero),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SelectableText(
                                          "5550260626466266550626",
                                          style: TextStyle(color: blue),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ),
                      swipeCompleted ? SizedBox() : Text("＊右から左へスワイプしてください"),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AutoScalingCircle extends StatefulWidget {
  final Color color;
  final double begin, end;
  final int seconds;

  const AutoScalingCircle(
      {super.key,
      required this.color,
      this.begin = 50.0,
      this.end = 150.0,
      this.seconds = 2});
  @override
  _AutoScalingCircleState createState() => _AutoScalingCircleState();
}

class _AutoScalingCircleState extends State<AutoScalingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.seconds), // アニメーションの期間
    )..repeat(reverse: true); // アニメーションを繰り返す

    _scaleAnimation = Tween<double>(
      begin: widget.begin, // 最小の円の直径
      end: widget.end, // 最大の円の直径
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Container(
          width: _scaleAnimation.value,
          height: _scaleAnimation.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color,
          ),
        );
      },
    );
  }
}

class RotatingStar extends StatefulWidget {
  const RotatingStar({Key? key}) : super(key: key);

  @override
  _RotatingStarState createState() => _RotatingStarState();
}

class _RotatingStarState extends State<RotatingStar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.14,
          child: child,
        );
      },
      child: const Icon(
        Icons.star,
        size: 50,
      ),
    );
  }
}
