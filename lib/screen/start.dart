import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:register_kidsclub/screen/loadtest.dart';
import 'package:register_kidsclub/screen/sex.dart';
import 'package:universal_html/html.dart' as html;
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../model/model.dart';

class StartPage extends StatefulWidget {
  final String? rfidCard, bg;
  const StartPage({super.key, this.rfidCard, this.bg});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String cardcode = '';
  IO.Socket? socket;
  bool linkClicked = false;
  // ignore: prefer_typing_uninitialized_variables
  var _preventContextMenu;
  bool checkload = false;
  bool changLanguage = false;
  double? width;
  double? height;
  double engTop = 40;
  double thTop = 70;
  double chsTop = 100;
  double chtTop = 130;
  double rsTop = 160;
  double jpTop = 190;
  double arTop = 220;
  double frTop = 250;
  double kazTop = 280;
  double spTop = 310;
  double vnTop = 340;
  double hbTop = 370;
  String lan = 'ENG';
  String bg = 'BG1.png';
  String background = 'en';

  List<CheckCard> checkCard1 = [];

  Future<void> checkCard(cardcode) async {
    String urlAPI = '${domain}upload_face.php?select=checkcard&RFID=$cardcode';
    try {
      await Dio().get(urlAPI).then((value) {
        var result = json.decode(value.data);
        checkCard1 = CheckCard.fromJsonList(result);
        print(checkCard1[0].id);
        setState(() {
          if (checkCard1[0].id != '') {
            showAnimatedDialog(
              context: context,
              barrierDismissible: false,
              alignment: Alignment.center,
              builder: (BuildContext context) {
                return Center(
                  child: SizedBox(
                    width: width! * .7,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/message.png'),
                        Positioned(
                          top: 244,
                          left: 456,
                          child: Container(
                            width: 115,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              //color: Colors.green,
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pop();
                                });
                              },
                              child: const Text(''),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                /*return AlertDialog(
                            title: const Text(
                              "Message",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontFamily: 'TrajanProBold',
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text(
                                  "OK",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.black,
                                    fontFamily: 'TrajanProBold',
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            content: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Image.asset('assets/images/message.png')
                                ),
                                const Positioned(
                                  left: 10,
                                  top: 200,
                                  child: Text(
                                    "You are already registered.",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.white,
                                      fontFamily: 'TrajanProBold',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );*/
              },
              animationType: DialogTransitionType.size,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(seconds: 1),
            ).then((value) {});
          } else {
            print('wewwww');
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => SexPage(
                    rfid: cardcode,
                    cardCode: cardcode,
                    bg: background,
                    selectZone: '',
                  ),
                ),
                (Route<dynamic> route) => false);
          }
        });
      }).then((value) {});
    } catch (e) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => SexPage(
              rfid: cardcode,
              cardCode: cardcode,
              bg: background,
              selectZone: '',
            ),
          ),
          (Route<dynamic> route) => false);
    }
  }

  void socketIo() {
    socket = IO.io('http://220.200.30.245:3000', <String, dynamic>{
      'transports': ['websocket'], // Use WebSocket transport
      'autoConnect': false, // Disable autoConnect for manual control
    });

    // Add event listeners
    socket!.on('connect', (_) {
      //print('Connected');
    });

    socket!.on('cardcode54', (data) {
      setState(
        () {
          cardcode = data['cardcode'];
          //print(cardcode);
          /*if (cardcode == '') {
            showAnimatedDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                return ClassicGeneralDialogWidget(
                  titleText: 'Message',
                  contentText: 'Please scan',
                  positiveText: 'OK',
                  onPositiveClick: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              animationType: DialogTransitionType.size,
              curve: Curves.fastOutSlowIn,
              duration: const Duration(seconds: 1),
            ).then((value) => {});
          } else {
            checkCard(cardcode);
          }*/
          checkCard(cardcode);
        },
      );
    });

    socket!.on('connect_error', (error) {
      //print('Connection error: $error');
    });

    socket!.on('connect_timeout', (timeout) {
      //print('Connection timeout: $timeout');
    });

    // Manually connect the socket
    socket!.connect();
  }

  @override
  void initState() {
    super.initState();

    if (widget.bg == 'en') {
      bg = 'BG1.png';
      lan = 'ENG';
      engTop = 40;
      thTop = 70;
      chsTop = 100;
      chtTop = 130;
      rsTop = 160;
      jpTop = 190;
      arTop = 220;
      frTop = 250;
      kazTop = 280;
      spTop = 310;
      vnTop = 340;
      hbTop = 370;
      background = 'en';
    } else if (widget.bg == 'th') {
      bg = 'th/BG1.jpg';
      lan = 'TH';
      thTop = 40;
      engTop = 70;
      chsTop = 100;
      chtTop = 130;
      rsTop = 160;
      jpTop = 190;
      arTop = 220;
      frTop = 250;
      kazTop = 280;
      spTop = 310;
      vnTop = 340;
      hbTop = 370;
      background = 'th';
    } else if (widget.bg == 'chs') {
      bg = 'chs/BG1.jpg';
      lan = 'CHS';
      chsTop = 40;
      engTop = 70;
      thTop = 100;
      chtTop = 130;
      rsTop = 160;
      jpTop = 190;
      arTop = 220;
      frTop = 250;
      kazTop = 280;
      spTop = 310;
      vnTop = 340;
      hbTop = 370;
      background = 'chs';
    } else if (widget.bg == 'cht') {
      bg = 'cht/BG1.jpg';
      lan = 'CHT';
      chtTop = 40;
      engTop = 70;
      thTop = 100;
      chsTop = 130;
      rsTop = 160;
      jpTop = 190;
      arTop = 220;
      frTop = 250;
      kazTop = 280;
      spTop = 310;
      vnTop = 340;
      hbTop = 370;
      background = 'cht';
    } else if (widget.bg == 'rs') {
      bg = 'rs/BG1.jpg';
      lan = 'RS';
      rsTop = 40;
      engTop = 70;
      thTop = 100;
      chsTop = 130;
      chtTop = 160;
      jpTop = 190;
      arTop = 220;
      frTop = 250;
      kazTop = 280;
      spTop = 310;
      vnTop = 340;
      hbTop = 370;
      background = 'rs';
    } else if (widget.bg == 'jp') {
      bg = 'jp/BG1.jpg';
      lan = 'JP';
      jpTop = 40;
      engTop = 70;
      thTop = 100;
      chsTop = 130;
      chtTop = 160;
      rsTop = 190;
      arTop = 220;
      frTop = 250;
      kazTop = 280;
      spTop = 310;
      vnTop = 340;
      hbTop = 370;
      background = 'jp';
    } else if (widget.bg == 'ar') {
      bg = 'ar/BG1.jpg';
      lan = 'AR';
      arTop = 40;
      engTop = 70;
      thTop = 100;
      chsTop = 130;
      chtTop = 160;
      rsTop = 190;
      jpTop = 220;
      frTop = 250;
      kazTop = 280;
      spTop = 310;
      vnTop = 340;
      hbTop = 370;
      background = 'ar';
    } else if (widget.bg == 'fr') {
      bg = 'fr/BG1.jpg';
      lan = 'French';
      frTop = 40;
      engTop = 70;
      thTop = 100;
      chsTop = 130;
      chtTop = 160;
      rsTop = 190;
      jpTop = 220;
      arTop = 250;
      kazTop = 280;
      spTop = 310;
      vnTop = 340;
      hbTop = 370;
      background = 'fr';
    } else if (widget.bg == 'kaz') {
      bg = 'kaz/BG1.jpg';
      lan = 'Kazakh';
      kazTop = 40;
      engTop = 70;
      thTop = 100;
      chsTop = 130;
      chtTop = 160;
      rsTop = 190;
      jpTop = 220;
      arTop = 250;
      frTop = 280;
      spTop = 310;
      vnTop = 340;
      hbTop = 370;
      background = 'kaz';
    } else if (widget.bg == 'sp') {
      bg = 'sp/BG1.jpg';
      lan = 'Spanish';
      spTop = 40;
      engTop = 70;
      thTop = 100;
      chsTop = 130;
      chtTop = 160;
      rsTop = 190;
      jpTop = 220;
      arTop = 250;
      frTop = 280;
      kazTop = 310;
      vnTop = 340;
      hbTop = 370;
      background = 'sp';
    } else if (widget.bg == 'vn') {
      bg = 'vn/BG1.jpg';
      lan = 'Vietnamese';
      vnTop = 40;
      engTop = 70;
      thTop = 100;
      chsTop = 130;
      chtTop = 160;
      rsTop = 190;
      jpTop = 220;
      arTop = 250;
      frTop = 280;
      kazTop = 310;
      spTop = 340;
      hbTop = 370;
      background = 'vn';
    } else if (widget.bg == 'heb') {
      bg = 'heb/BG1.jpg';
      lan = 'Hebrew';
      hbTop = 40;
      engTop = 70;
      thTop = 100;
      chsTop = 130;
      chtTop = 160;
      rsTop = 190;
      jpTop = 220;
      arTop = 250;
      frTop = 280;
      kazTop = 310;
      spTop = 340;
      vnTop = 370;
      background = 'heb';
    }
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _preventContextMenu = (html.Event event) => {
          if (linkClicked)
            {
              event.preventDefault(),
              linkClicked = false,
            }
        };
    html.document.addEventListener('contextmenu', _preventContextMenu);
    socketIo();
  }

  @override
  void dispose() {
    socket!.disconnect();
    socket!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$bg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            '',
                            style: TextStyle(
                              fontFamily: 'tp',
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.yellow,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              /*Positioned(
                left: 0,
                top: 40,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      showAnimatedDialog(
                        context: context,
                        barrierDismissible: false,
                        alignment: Alignment.center,
                        builder: (BuildContext context) {
                          return Center(
                            child: Container(
                              width: width! * .7,
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/message.png'),
                                  Positioned(
                                    top: 244,
                                    left: 456,
                                    child: Container(
                                      width: 115,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        //color: Colors.green,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: const Text(''),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          /*return AlertDialog(
                            title: const Text(
                              "Message",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontFamily: 'TrajanProBold',
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text(
                                  "OK",
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    color: Colors.black,
                                    fontFamily: 'TrajanProBold',
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            content: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Image.asset('assets/images/message.png')
                                ),
                                const Positioned(
                                  left: 10,
                                  top: 200,
                                  child: Text(
                                    "You are already registered.",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.white,
                                      fontFamily: 'TrajanProBold',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );*/
                        },
                        animationType: DialogTransitionType.size,
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(seconds: 1),
                      );
                    });
                  },
                  child: const SizedBox(
                    width: 90,
                    child: Text('Test'),
                  ),
                ),
              ),*/
              /*Positioned(
                left: 0,
                top: 80,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoadTest(),
                        ),
                      );
                    });
                  },
                  child: const SizedBox(width: 90, child: Text('test2')),
                ),
              ),*/
              Positioned(
                right: 0,
                top: 50,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'ENG';
                          engTop = 40;
                          bg = 'BG1.png';
                          background = 'en';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'en'
                            ? Image.asset(
                                'assets/images/button_lan/ENG2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/ENG.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'TH';
                          bg = 'th/BG1.jpg';
                          background = 'th';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'th'
                            ? Image.asset(
                                'assets/images/button_lan/TH2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/TH.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'CHS';
                          bg = 'chs/BG1.jpg';
                          background = 'chs';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'chs'
                            ? Image.asset(
                                'assets/images/button_lan/CHS2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/CHS.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'CHT';
                          bg = 'cht/BG1.jpg';
                          background = 'cht';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'cht'
                            ? Image.asset(
                                'assets/images/button_lan/CHT2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/CHT.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'RS';
                          bg = 'rs/BG1.jpg';
                          background = 'rs';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'rs'
                            ? Image.asset(
                                'assets/images/button_lan/RS2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/RS.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'JP';
                          bg = 'jp/BG1.jpg';
                          background = 'jp';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'jp'
                            ? Image.asset(
                                'assets/images/button_lan/JP2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/JP.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'AR';
                          bg = 'ar/BG1.jpg';
                          background = 'ar';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'ar'
                            ? Image.asset(
                                'assets/images/button_lan/AR2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/AR.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'French';
                          bg = 'fr/BG1.jpg';
                          background = 'fr';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'fr'
                            ? Image.asset(
                                'assets/images/button_lan/French2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/French.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'Kazakh';
                          bg = 'kaz/BG1.jpg';
                          background = 'kaz';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'kaz'
                            ? Image.asset(
                                'assets/images/button_lan/Kazakh2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/Kazakh.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'Spanish';
                          bg = 'sp/BG1.jpg';
                          background = 'sp';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'sp'
                            ? Image.asset(
                                'assets/images/button_lan/Spanish2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/Spanish.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'Vietnamese';
                          bg = 'vn/BG1.jpg';
                          background = 'vn';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'vn'
                            ? Image.asset(
                                'assets/images/button_lan/Vietnamese2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/Vietnamese.png',
                              ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          lan = 'Hebrew';
                          bg = 'heb/BG1.jpg';
                          background = 'heb';
                        });
                      },
                      /*onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SexPage(
                              rfid: cardcode,
                              cardCode: cardcode,
                              bg: background,
                              selectZone: '',
                            ),
                          ),
                        );
                      },*/
                      child: SizedBox(
                        width: 90,
                        child: background == 'heb'
                            ? Image.asset(
                                'assets/images/button_lan/Hebrew2.png',
                              )
                            : Image.asset(
                                'assets/images/button_lan/Hebrew.png',
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              /*Positioned(
                right: 0,
                top: 40,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'ENG';
                        engTop = 40;
                        bg = 'BG1.png';
                        background = 'en';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'en'
                          ? Image.asset(
                              'assets/images/button_lan/ENG2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/ENG.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 72,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'TH';
                        bg = 'th/BG1.jpg';
                        background = 'th';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'th'
                          ? Image.asset(
                              'assets/images/button_lan/TH2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/TH.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 104,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'CHS';
                        bg = 'chs/BG1.jpg';
                        background = 'chs';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'chs'
                          ? Image.asset(
                              'assets/images/button_lan/CHS2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/CHS.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 136,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'CHT';
                        bg = 'cht/BG1.jpg';
                        background = 'cht';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'cht'
                          ? Image.asset(
                              'assets/images/button_lan/CHT2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/CHT.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 168,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'RS';
                        bg = 'rs/BG1.jpg';
                        background = 'rs';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'rs'
                          ? Image.asset(
                              'assets/images/button_lan/RS2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/RS.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 200,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        changLanguage = !changLanguage;
                        lan = 'JP';
                        bg = 'jp/BG1.jpg';
                        background = 'jp';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'jp'
                          ? Image.asset(
                              'assets/images/button_lan/JP2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/JP.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 232,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'AR';
                        bg = 'ar/BG1.jpg';
                        background = 'ar';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'ar'
                          ? Image.asset(
                              'assets/images/button_lan/AR2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/AR.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 264,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'French';
                        bg = 'fr/BG1.jpg';
                        background = 'fr';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'fr'
                          ? Image.asset(
                              'assets/images/button_lan/French2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/French.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 296,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'Kazakh';
                        bg = 'kaz/BG1.jpg';
                        background = 'kaz';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'kaz'
                          ? Image.asset(
                              'assets/images/button_lan/Kazakh2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/Kazakh.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 328,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'Spanish';
                        bg = 'sp/BG1.jpg';
                        background = 'sp';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'sp'
                          ? Image.asset(
                              'assets/images/button_lan/Spanish2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/Spanish.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 360,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'Vietnamese';
                        bg = 'vn/BG1.jpg';
                        background = 'vn';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'vn'
                          ? Image.asset(
                              'assets/images/button_lan/Vietnamese2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/Vietnamese.png',
                            ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 392,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        lan = 'Hebrew';
                        bg = 'heb/BG1.jpg';
                        background = 'heb';
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: background == 'heb'
                          ? Image.asset(
                              'assets/images/button_lan/Hebrew2.png',
                            )
                          : Image.asset(
                              'assets/images/button_lan/Hebrew.png',
                            ),
                    ),
                  ),
                ),
              ),*/
              /*Positioned(
                right: 0,
                top: 40,
                child: SizedBox(
                  width: 90,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        changLanguage = !changLanguage;
                      });
                    },
                    child: Transform.scale(
                      scale: 1,
                      child: Image.asset(
                        'assets/images/button_lan/$lan.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: engTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'ENG';
                              engTop = 40;
                              thTop = 70;
                              chsTop = 100;
                              chtTop = 130;
                              rsTop = 160;
                              jpTop = 190;
                              arTop = 220;
                              frTop = 250;
                              kazTop = 280;
                              spTop = 310;
                              vnTop = 340;
                              hbTop = 370;
                              bg = 'BG1.png';
                              background = 'en';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/ENG.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: thTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'TH';
                              thTop = 40;
                              engTop = 70;
                              chsTop = 100;
                              chtTop = 130;
                              rsTop = 160;
                              jpTop = 190;
                              arTop = 220;
                              frTop = 250;
                              kazTop = 280;
                              spTop = 310;
                              vnTop = 340;
                              hbTop = 370;
                              bg = 'th/BG1.jpg';
                              background = 'th';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/TH.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: chsTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'CHS';
                              chsTop = 40;
                              engTop = 70;
                              thTop = 100;
                              chtTop = 130;
                              rsTop = 160;
                              jpTop = 190;
                              arTop = 220;
                              frTop = 250;
                              kazTop = 280;
                              spTop = 310;
                              vnTop = 340;
                              hbTop = 370;
                              bg = 'chs/BG1.jpg';
                              background = 'chs';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/CHS.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: chtTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'CHT';
                              chtTop = 40;
                              engTop = 70;
                              thTop = 100;
                              chsTop = 130;
                              rsTop = 160;
                              jpTop = 190;
                              arTop = 220;
                              frTop = 250;
                              kazTop = 280;
                              spTop = 310;
                              vnTop = 340;
                              hbTop = 370;
                              bg = 'cht/BG1.jpg';
                              background = 'cht';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/CHT.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: rsTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'RS';
                              rsTop = 40;
                              engTop = 70;
                              thTop = 100;
                              chsTop = 130;
                              chtTop = 160;
                              jpTop = 190;
                              arTop = 220;
                              frTop = 250;
                              kazTop = 280;
                              spTop = 310;
                              vnTop = 340;
                              hbTop = 370;
                              bg = 'rs/BG1.jpg';
                              background = 'rs';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/RS.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: jpTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'JP';
                              jpTop = 40;
                              engTop = 70;
                              thTop = 100;
                              chsTop = 130;
                              chtTop = 160;
                              rsTop = 190;
                              arTop = 220;
                              frTop = 250;
                              kazTop = 280;
                              spTop = 310;
                              vnTop = 340;
                              hbTop = 370;
                              bg = 'jp/BG1.jpg';
                              background = 'jp';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/JP.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: arTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'AR';
                              arTop = 40;
                              engTop = 70;
                              thTop = 100;
                              chsTop = 130;
                              chtTop = 160;
                              rsTop = 190;
                              jpTop = 220;
                              frTop = 250;
                              kazTop = 280;
                              spTop = 310;
                              vnTop = 340;
                              hbTop = 370;
                              bg = 'ar/BG1.jpg';
                              background = 'ar';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/AR.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: frTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'French';
                              frTop = 40;
                              engTop = 70;
                              thTop = 100;
                              chsTop = 130;
                              chtTop = 160;
                              rsTop = 190;
                              jpTop = 220;
                              arTop = 250;
                              kazTop = 280;
                              spTop = 310;
                              vnTop = 340;
                              hbTop = 370;
                              bg = 'fr/BG1.jpg';
                              background = 'fr';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/French.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: kazTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'Kazakh';
                              kazTop = 40;
                              engTop = 70;
                              thTop = 100;
                              chsTop = 130;
                              chtTop = 160;
                              rsTop = 190;
                              jpTop = 220;
                              arTop = 250;
                              frTop = 280;
                              spTop = 310;
                              vnTop = 340;
                              hbTop = 370;
                              bg = 'kaz/BG1.jpg';
                              background = 'kaz';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/Kazakh.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: spTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'Spanish';
                              spTop = 40;
                              engTop = 70;
                              thTop = 100;
                              chsTop = 130;
                              chtTop = 160;
                              rsTop = 190;
                              jpTop = 220;
                              arTop = 250;
                              frTop = 280;
                              kazTop = 310;
                              vnTop = 340;
                              hbTop = 370;
                              bg = 'sp/BG1.jpg';
                              background = 'sp';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/Spanish.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: vnTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'Vietnamese';
                              vnTop = 40;
                              engTop = 70;
                              thTop = 100;
                              chsTop = 130;
                              chtTop = 160;
                              rsTop = 190;
                              jpTop = 220;
                              arTop = 250;
                              frTop = 280;
                              kazTop = 310;
                              spTop = 340;
                              hbTop = 370;
                              bg = 'vn/BG1.jpg';
                              background = 'vn';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/Vietnamese.png',
                            ),
                          ),
                        ),
                      ),
                    ),
              !changLanguage
                  ? Container()
                  : Positioned(
                      right: 0,
                      top: hbTop,
                      child: SizedBox(
                        width: 90,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              changLanguage = !changLanguage;
                              lan = 'Hebrew';
                              hbTop = 40;
                              engTop = 70;
                              thTop = 100;
                              chsTop = 130;
                              chtTop = 160;
                              rsTop = 190;
                              jpTop = 220;
                              arTop = 250;
                              frTop = 280;
                              kazTop = 310;
                              spTop = 340;
                              vnTop = 370;
                              bg = 'heb/BG1.jpg';
                              background = 'hb';
                            });
                          },
                          child: Transform.scale(
                            scale: 1,
                            child: Image.asset(
                              'assets/images/button_lan/Hebrew.png',
                            ),
                          ),
                        ),
                      ),
                    ),*/
            ],
          ),
        ),
      ),
    );
  }
}
