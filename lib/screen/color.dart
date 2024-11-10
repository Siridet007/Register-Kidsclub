import 'package:flutter/material.dart';
import 'package:register_kidsclub/screen/sex.dart';

import 'face.dart';
import 'face2.dart';

class ColorPage extends StatefulWidget {
  final String rfid, sex, cardCode, selectZone, bg;
  const ColorPage({
    super.key,
    required this.rfid,
    required this.sex,
    required this.cardCode,
    required this.selectZone,
    required this.bg,
  });

  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  String selectColor = '';
  String bg = 'BG3.png';
  String back = 'back';
  void nextPage() {
    if (widget.sex == 'M') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => FacePage(
              cardCode: widget.cardCode,
              rfid: widget.rfid,
              selectColor: selectColor,
              selectZone: widget.selectZone,
              sex: widget.sex,
              bg: widget.bg,
            ),
          ),
          (Route<dynamic> route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => FacePage2(
              cardCode: widget.cardCode,
              rfid: widget.rfid,
              selectColor: selectColor,
              selectZone: widget.selectZone,
              sex: widget.sex,
              bg: widget.bg,
            ),
          ),
          (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.bg == 'en') {
      bg = 'BG3.png';
      back = 'back';
    } else if (widget.bg == 'th') {
      bg = 'th/BG3.jpg';
      back = 'th/backTH';
    } else if (widget.bg == 'chs') {
      bg = 'chs/BG3.jpg';
      back = 'chs/backCHS';
    } else if (widget.bg == 'cht') {
      bg = 'cht/BG3.jpg';
      back = 'cht/backCHT';
    } else if (widget.bg == 'rs') {
      bg = 'rs/BG3.jpg';
      back = 'rs/backRS';
    } else if (widget.bg == 'jp') {
      bg = 'jp/BG3.jpg';
      back = 'jp/backJP';
    } else if (widget.bg == 'ar') {
      bg = 'ar/BG3.jpg';
      back = 'ar/backAR';
    } else if (widget.bg == 'fr') {
      bg = 'fr/BG3.jpg';
      back = 'fr/backFr';
    } else if (widget.bg == 'kaz') {
      bg = 'kaz/BG3.jpg';
      back = 'kaz/backKaz';
    } else if (widget.bg == 'sp') {
      bg = 'sp/BG3.jpg';
      back = 'sp/backSP';
    } else if (widget.bg == 'vn') {
      bg = 'vn/BG3.jpg';
      back = 'vn/backVN';
    } else if (widget.bg == 'heb') {
      bg = 'heb/BG3.jpg';
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                selectColor = '1';
                                nextPage();
                              });
                            },
                            icon: selectColor == '1'
                                ? const Icon(Icons.done)
                                : const Icon(
                                    null,
                                  ), //icon data for elevated button
                            label: const Text(""), //label text
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              padding: const EdgeInsets.only(left: 10),
                              minimumSize: const Size(200, 200),
                              maximumSize: const Size(200, 200),
                            ),
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                selectColor = '2';
                                nextPage();
                              });
                            },
                            icon: selectColor == '2'
                                ? const Icon(Icons.done)
                                : const Icon(
                                    null,
                                  ), //icon data for elevated button
                            label: const Text(""), //label text
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              padding: const EdgeInsets.only(left: 10),
                              minimumSize: const Size(200, 200),
                              maximumSize: const Size(200, 200),
                            ),
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                selectColor = '3';
                                nextPage();
                              });
                            },
                            icon: selectColor == '3'
                                ? const Icon(Icons.done)
                                : const Icon(
                                    null,
                                  ), //icon data for elevated button
                            label: const Text(""), //label text
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.yellow,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              padding: const EdgeInsets.only(left: 10),
                              minimumSize: const Size(200, 200),
                              maximumSize: const Size(200, 200),
                            ),
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                selectColor = '4';
                                nextPage();
                              });
                            },
                            icon: selectColor == '4'
                                ? const Icon(Icons.done)
                                : const Icon(
                                    null,
                                  ), //icon data for elevated button
                            label: const Text(""), //label text
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              padding: const EdgeInsets.only(left: 10),
                              minimumSize: const Size(200, 200),
                              maximumSize: const Size(200, 200),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                selectColor = '5';
                                nextPage();
                              });
                            },
                            icon: selectColor == '5'
                                ? const Icon(Icons.done)
                                : const Icon(
                                    null,
                                  ), //icon data for elevated button
                            label: const Text(""), //label text
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              padding: const EdgeInsets.only(left: 10),
                              minimumSize: const Size(200, 200),
                              maximumSize: const Size(200, 200),
                            ),
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                selectColor = '6';
                                nextPage();
                              });
                            },
                            icon: selectColor == '6'
                                ? const Icon(Icons.done)
                                : const Icon(
                                    null,
                                  ), //icon data for elevated button
                            label: const Text(""), //label text
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              padding: const EdgeInsets.only(left: 10),
                              minimumSize: const Size(200, 200),
                              maximumSize: const Size(200, 200),
                            ),
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                selectColor = '7';
                                nextPage();
                              });
                            },
                            icon: selectColor == '7'
                                ? const Icon(Icons.done)
                                : const Icon(
                                    null,
                                  ), //icon data for elevated button
                            label: const Text(""), //label text
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.lightGreen,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              padding: const EdgeInsets.only(left: 10),
                              minimumSize: const Size(200, 200),
                              maximumSize: const Size(200, 200),
                            ),
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(0),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                selectColor = '8';
                                nextPage();
                              });
                            },
                            icon: selectColor == '8'
                                ? const Icon(Icons.done)
                                : const Icon(
                                    null,
                                  ), //icon data for elevated button
                            label: const Text(""), //label text
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.lightBlue,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              padding: const EdgeInsets.only(left: 10),
                              minimumSize: const Size(200, 200),
                              maximumSize: const Size(200, 200),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => SexPage(
                                    cardCode: widget.cardCode,
                                    rfid: widget.rfid,
                                    selectZone: widget.selectZone,
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
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
