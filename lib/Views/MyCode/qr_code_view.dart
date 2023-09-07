// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vx_demo_app/style.dart';

class QRCodeView extends StatefulWidget {
  final String codeData;
  const QRCodeView({super.key, required this.codeData});

  @override
  State<QRCodeView> createState() => _QRCodeViewState();
}

class _QRCodeViewState extends State<QRCodeView> {
  bool _isSwitched = true; // スイッチの状態
  String hashString(String input) {
    var bytes = utf8.encode(input); // 文字列をUTF-8エンコード
    var digest = sha256.convert(bytes); // SHA-256ハッシュを計算
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: baseColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [Styles.shadowCard],
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: size.width / 1.5,
                        height: 100,
                        decoration: BoxDecoration(
                          color: white,
                        ),
                        padding: EdgeInsets.all(10),
                        child: BarcodeWidget(
                          barcode: Barcode.codabar(), // 任意のバーコードの規格
                          data: '2${widget.codeData}', // 任意のdetaを指定
                          width: 545,
                          height: 200,
                          drawText: false, // <- バーコード下部にdetaの値を表示させない
                        ),
                      ), // 生成したいバーコードデータを指定
                      SizedBox(height: 20),
                      QrImageView(
                        data: _isSwitched
                            ? hashString(widget.codeData)
                            : widget.codeData,
                        backgroundColor: white,
                        foregroundColor: baseColor,
                        // embeddedImage: const AssetImage("assets/icons/wa_be_logo.png"),
                        embeddedImageStyle:
                            QrEmbeddedImageStyle(size: Size.zero),
                      ),
                      Text("コードデータ: ${widget.codeData}"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("学籍番号をハッシュ化(暗号化)させる"),
                  Switch(
                    value: _isSwitched,
                    onChanged: (newValue) {
                      setState(() {
                        _isSwitched = newValue; // スイッチの状態を更新
                      });
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "元のページへ戻る",
                style: Styles.cardTextStyle4,
              ),
            )
          ],
        )),
      ),
    );
  }
}
