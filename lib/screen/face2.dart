import 'package:flutter/material.dart';
import 'package:register_kidsclub/screen/color.dart';
import 'package:register_kidsclub/screen/takephoto.dart';

class FacePage2 extends StatefulWidget {
  final String rfid, sex, selectColor, cardCode, selectZone, bg;
  const FacePage2({
    super.key,
    required this.rfid,
    required this.sex,
    required this.selectColor,
    required this.cardCode,
    required this.selectZone,
    required this.bg,
  });

  @override
  State<FacePage2> createState() => _FacePage2State();
}

class _FacePage2State extends State<FacePage2> {
  String selectFace = '0';
  String bg = 'BG4.png';
  String back = 'back';

  void nextPage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => MyAppPhoto(
            cardCode: widget.cardCode,
            checkFace: '2',
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
                padding: const EdgeInsets.all(10),
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
                                        selectFace = '10';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '10'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/10.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Balloon",
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
                                        selectFace = '11';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '11'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/11.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Chameleon",
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
                                        selectFace = '12';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '12'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/12.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Carnival",
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
                                        selectFace = '13';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '13'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/13.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Deer",
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
                                        selectFace = '14';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '14'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/14.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Peacock",
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
                                        selectFace = '15';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '15'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/15.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Crab",
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
                                        selectFace = '16';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '16'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/16.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Hornbill",
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
                                        selectFace = '17';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '17'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/17.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Croc",
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
                                        selectFace = '18';
                                        nextPage();
                                      });
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: selectFace == '18'
                                            ? Colors.pink
                                            : Colors.transparent,
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/18.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    "Tuktuk",
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
