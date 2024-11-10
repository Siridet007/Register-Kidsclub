import 'package:flutter/material.dart';
import 'package:register_kidsclub/screen/takephoto.dart';

import 'color.dart';

class FacePage extends StatefulWidget {
  final String rfid, sex, selectColor, cardCode, selectZone, bg;
  const FacePage({
    super.key,
    required this.rfid,
    required this.sex,
    required this.selectColor,
    required this.cardCode,
    required this.selectZone,
    required this.bg,
  });

  @override
  State<FacePage> createState() => _FacePageState();
}

class _FacePageState extends State<FacePage> {
  String selectFace = '0';
  String bg = 'BG4.png';
  String back = 'back';

  void nextPage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => MyAppPhoto(
            cardCode: widget.cardCode,
            checkFace: '1',
            mask: selectFace,
            rfid: widget.rfid,
            selectColor: widget.selectColor,
            selectZone: widget.selectZone,
            sex: widget.sex,
            bg: widget.bg,
          ),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    if (widget.bg == 'en') {
      bg = 'BG4.png';
      back = 'back';
    } else if (widget.bg == 'th') {
      bg = 'th/BG4.jpg';
      back = 'th/backTH';
    } else if (widget.bg == 'chs') {
      bg = 'chs/BG4.jpg';
      back = 'chs/backCHS';
    } else if (widget.bg == 'cht') {
      bg = 'cht/BG4.jpg';
      back = 'cht/backCHT';
    } else if (widget.bg == 'rs') {
      bg = 'rs/BG4.jpg';
      back = 'rs/backRS';
    } else if (widget.bg == 'jp') {
      bg = 'jp/BG4.jpg';
      back = 'jp/backJP';
    } else if (widget.bg == 'ar') {
      bg = 'ar/BG4.jpg';
      back = 'ar/backAR';
    } else if (widget.bg == 'fr') {
      bg = 'fr/BG4.jpg';
      back = 'fr/backFr';
    } else if (widget.bg == 'kaz') {
      bg = 'kaz/BG4.jpg';
      back = 'kaz/backKaz';
    } else if (widget.bg == 'sp') {
      bg = 'sp/BG4.jpg';
      back = 'sp/backSP';
    } else if (widget.bg == 'vn') {
      bg = 'vn/BG4.jpg';
      back = 'vn/backVN';
    } else if (widget.bg == 'heb') {
      bg = 'heb/BG4.jpg';
      back = 'heb/backHeb';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 65),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectFace = '1';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '1'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("assets/images/1.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Dinosaur",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'TrajanProBold',
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectFace = '2';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '2'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("assets/images/2.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Elephant 1",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'TrajanProBold',
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectFace = '3';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '3'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("assets/images/3.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Hanuman",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'TrajanProBold',
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectFace = '4';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '4'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("assets/images/4.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "HorseRider",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'TrajanProBold',
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectFace = '5';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '5'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("assets/images/5.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Tiger",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'TrajanProBold',
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectFace = '6';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '6'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("assets/images/6.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Mermaid",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'TrajanProBold',
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectFace = '7';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '7'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("assets/images/7.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Elephant 2",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'TrajanProBold',
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectFace = '8';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '8'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("assets/images/8.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Tossakan",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'TrajanProBold',
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectFace = '9';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '9'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image:
                                              AssetImage("assets/images/9.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Goddess",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'TrajanProBold',
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => ColorPage(
                                        cardCode: widget.cardCode,
                                        rfid: widget.rfid,
                                        selectZone: widget.selectZone,
                                        sex: widget.sex,
                                        bg: widget.bg,
                                      ),
                                    ),
                                    (Route<dynamic> route) => false);
                              },
                              child: Container(
                                width: 140,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/$back.png"),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
