import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:register_kidsclub/screen/start.dart';
import 'package:register_kidsclub/screen/zone.dart';

import 'color.dart';

class SexPage extends StatefulWidget {
  final String rfid, cardCode, selectZone, bg;
  const SexPage({
    super.key,
    required this.rfid,
    required this.cardCode,
    required this.selectZone,
    required this.bg,
  });

  @override
  State<SexPage> createState() => _SexPageState();
}

class _SexPageState extends State<SexPage> {
  String sex = '';
  String imagePath1 = 'assets/images/Boy.png';
  String imagePath2 = 'assets/images/Girl.png';
  String bg = 'BG2.png';
  String back = 'back';

  Future<void> postArray() async {
    List<String> xxx = [sex];

    FormData formData = FormData.fromMap({
      "param": "savetemp",
      "token": "",
      "data": jsonEncode(xxx),
    });
    //String urlAPI = domain + "data_pos.php?select=insert_bill";
    //Dio().post(urlAPI, data: formData);
  }

  @override
  void initState() {
    super.initState();
    if (widget.bg == 'en') {
      bg = 'BG2.png';
      back = 'back';
      imagePath1 = 'assets/images/Boy.png';
      imagePath2 = 'assets/images/Girl.png';
    } else if (widget.bg == 'th') {
      bg = 'th/BG2.jpg';
      back = 'th/backTH';
      imagePath1 = 'assets/images/th/THboy.png';
      imagePath2 = 'assets/images/th/THgirl.png';
    } else if (widget.bg == 'chs') {
      bg = 'chs/BG2.jpg';
      back = 'chs/backCHS';
      imagePath1 = 'assets/images/chs/CHSboy.png';
      imagePath2 = 'assets/images/chs/CHSgirl.png';
    } else if (widget.bg == 'cht') {
      bg = 'cht/BG2.jpg';
      back = 'cht/backCHT';
      imagePath1 = 'assets/images/cht/CHTboy.png';
      imagePath2 = 'assets/images/cht/CHTgirl.png';
    } else if (widget.bg == 'rs') {
      bg = 'rs/BG2.jpg';
      back = 'rs/backRS';
      imagePath1 = 'assets/images/rs/BoyRS.png';
      imagePath2 = 'assets/images/rs/GirlRS.png';
    } else if (widget.bg == 'jp') {
      bg = 'jp/BG2.jpg';
      back = 'jp/backJP';
      imagePath1 = 'assets/images/jp/JPboy.png';
      imagePath2 = 'assets/images/jp/JPgirl.png';
    } else if (widget.bg == 'ar') {
      bg = 'ar/BG2.jpg';
      back = 'ar/backAR';
      imagePath1 = 'assets/images/ar/ARBoy.png';
      imagePath2 = 'assets/images/ar/ARGirl.png';
    } else if (widget.bg == 'fr') {
      bg = 'fr/BG2.jpg';
      back = 'fr/backFr';
      imagePath1 = 'assets/images/fr/BoyFr.png';
      imagePath2 = 'assets/images/fr/GirlFr.png';
    } else if (widget.bg == 'kaz') {
      bg = 'kaz/BG2.jpg';
      back = 'kaz/backKaz';
      imagePath1 = 'assets/images/kaz/BoyKaz.png';
      imagePath2 = 'assets/images/kaz/GirlKaz.png';
    } else if (widget.bg == 'sp') {
      bg = 'sp/BG2.jpg';
      back = 'sp/backSP';
      imagePath1 = 'assets/images/sp/BoySP.png';
      imagePath2 = 'assets/images/sp/GirlSP.png';
    } else if (widget.bg == 'vn') {
      bg = 'vn/BG2.jpg';
      back = 'vn/backVN';
      imagePath1 = 'assets/images/vn/BoyVN.png';
      imagePath2 = 'assets/images/vn/GirlVN.png';
    } else if (widget.bg == 'heb') {
      bg = 'heb/BG2.jpg';
      back = 'heb/backHeb';
      imagePath1 = 'assets/images/heb/BoyHeb.png';
      imagePath2 = 'assets/images/heb/GirlHeb.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF272A2F),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/$bg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              sex = 'M';
                              postArray().then((value) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => ColorPage(
                                        cardCode: widget.cardCode,
                                        rfid: widget.rfid,
                                        selectZone: widget.selectZone,
                                        sex: sex,
                                        bg: widget.bg,
                                      ),
                                    ),
                                    (Route<dynamic> route) => false);
                              });
                            });
                          },
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(imagePath1),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              sex = 'W';
                              postArray().then((value) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => ColorPage(
                                        cardCode: widget.cardCode,
                                        rfid: widget.rfid,
                                        selectZone: widget.selectZone,
                                        sex: sex,
                                        bg: widget.bg,
                                      ),
                                    ),
                                    (Route<dynamic> route) => false);
                              });
                            });
                          },
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(imagePath2),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StartPage(
                                      bg: widget.bg,
                                    ),
                                  ),
                                  (Route<dynamic> route) => true);
                            },
                            child: Container(
                              width: 140,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: AssetImage("assets/images/$back.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
