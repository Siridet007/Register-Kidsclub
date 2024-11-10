import 'package:flutter/material.dart';
import 'package:register_kidsclub/screen/sex.dart';
import 'package:register_kidsclub/screen/start.dart';

class ZonePage extends StatefulWidget {
  final String rfid, cardCode,bg;
  const ZonePage({super.key, required this.rfid, required this.cardCode, required this.bg});

  @override
  State<ZonePage> createState() => _ZonePageState();
}

class _ZonePageState extends State<ZonePage> {
  String selectZone = '';
  String bg = 'BGZONE';
  String back = 'back';
  String skip = 'skip';

  void nextPage() {
    print(selectZone);
    print('bg ${widget.bg}');
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => SexPage(
            rfid: widget.rfid,
            cardCode: widget.cardCode,
            selectZone: selectZone,
            bg: widget.bg,
          ),
        ),
        (route) => false);
  }

  @override
  void initState() {
    print(widget.rfid);
    super.initState();
    if(widget.bg == 'en'){
      bg = 'BGZONE';
      back = 'back';
      skip = 'skip';
    }else if(widget.bg == 'th'){
      bg = 'th/BGZONE';
      back = 'th/backTH';
      skip = 'skip';
    }else if(widget.bg == 'chs'){
      bg = 'chs/BGZONE';
      back = 'chs/backCHS';
      skip = 'skip';
    }else if(widget.bg == 'cht'){
      bg = 'cht/BGZONE';
      back = 'cht/backCHT';
      skip = 'skip';
    }else if(widget.bg == 'rs'){
      bg = 'rs/BGZONE';
      back = 'rs/backRS';
      skip = 'skip';
    }else if(widget.bg == 'jp'){
      bg = 'jp/BGZONE';
      back = 'jp/backJP';
      skip = 'skip';
    }else if(widget.bg == 'ar'){
      bg = 'ar/BGZONE';
      back = 'ar/backAR';
      skip = 'skip';
    }else if(widget.bg == 'fr'){
      bg = 'fr/BGZONE';
      back = 'fr/backFr';
      skip = 'skip';
    }else if(widget.bg == 'kaz'){
      bg = 'kaz/BGZONE';
      back = 'kaz/backKaz';
      skip = 'skip';
    }else if(widget.bg == 'sp'){
      bg = 'sp/BGZONE';
      back = 'sp/backSP';
      skip = 'skip';
    }else if(widget.bg == 'vn'){
      bg = 'vn/BGZONE';
      back = 'vn/backVN';
      skip = 'skip';
    }else if(widget.bg == 'heb'){
      bg = 'heb/BGZONE';
      back = 'heb/backHeb';
      skip = 'skip';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF272A2F),
        body: Container(
          decoration:  const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/BGZONE.jpg'),
              fit: BoxFit.cover,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'A';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'A',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'B';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'B',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'C';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'C',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'D';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'D',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'E';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'E',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'F';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'F',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'G';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'G',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'H';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'H',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'I';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'I',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'J';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'J',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'K';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'K',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'L';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'L',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = 'M';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      'M',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectZone = '-';
                                      nextPage();
                                    });
                                  },
                                  child: const SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'tp',
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                                      builder: (context) => StartPage(bg: widget.bg),
                                    ),
                                    (Route<dynamic> route) => false);
                              },
                              child: Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/$back.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => SexPage(
                                        cardCode: widget.cardCode,
                                        rfid: widget.rfid,
                                        selectZone: selectZone,
                                        bg: widget.bg,
                                      ),
                                    ),
                                    (Route<dynamic> route) => false);
                              },
                              child: Container(
                                width: 170,
                                height: 59,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/$skip.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 27,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
