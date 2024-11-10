import 'dart:async';
import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:register_kidsclub/model/model.dart';
import 'package:register_kidsclub/screen/showface.dart';
import 'package:register_kidsclub/screen/takephoto.dart';

class LoadFace extends StatefulWidget {
  final String rfid,
      mask,
      sex,
      selectColor,
      cardCode,
      checkFace,
      selectZone,
      bg;
  final XFile orgfile;
  const LoadFace({
    super.key,
    required this.rfid,
    required this.mask,
    required this.sex,
    required this.selectColor,
    required this.cardCode,
    required this.checkFace,
    required this.selectZone,
    required this.orgfile,
    required this.bg,
  });

  @override
  State<LoadFace> createState() => _LoadFaceState();
}

class _LoadFaceState extends State<LoadFace> {
  Uint8List? img1, img2, img3;
  bool checkTrue = false;
  int counter = 10;
  Timer? timer;
  Timer? timer2;
  int start = 5;

  void startTimerCheck() {
    counter = 10;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        timer.cancel();
        if (checkTrue == false) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => MyAppPhoto(
                  cardCode: widget.cardCode,
                  checkFace: widget.checkFace,
                  mask: widget.mask,
                  rfid: widget.rfid,
                  selectColor: widget.selectColor,
                  selectZone: widget.selectZone,
                  sex: widget.sex,
                  bg: widget.bg,
                ),
              ),
              (Route<dynamic> route) => false);
        }
      }
    });
  }

  void startTimer() {
    timer2 = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        Navigator.of(context)
            .pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => ShowFace(
                    rfid: widget.rfid,
                    sex: widget.sex,
                    selectColor: widget.selectColor,
                    mask: widget.mask,
                    cardCode: widget.cardCode,
                    checkFace: widget.checkFace,
                    selectZone: widget.selectZone,
                    bg: widget.bg,
                  ),
                ),
                (Route<dynamic> route) => false)
            .then((value) {});

        timer.cancel();
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Future<void> postArrayORG() async {
    String baseImage = base64Encode(img3!);
    List<String> xxx = [baseImage, widget.selectZone];
    FormData formData = FormData.fromMap({
      'mode': 'P',
      'data': jsonEncode(xxx),
    });
    String urlAPI = '${domain_sightguide}upload_face.php?select=2';
    await Dio().post(urlAPI, data: formData).then((value) {});
  }

  Future<void> postArray2() async {
    String baseImage = base64Encode(img1!);
    List<String> xxx = [baseImage, widget.selectZone];
    FormData formData = FormData.fromMap({
      'mode': 'P',
      'data': jsonEncode(xxx),
    });
    String urlAPI = '${domain_sightguide}upload_face.php?select=1';
    await Dio().post(urlAPI, data: formData).then((value) {});
  }

  Future<void> postArray() async {
    String baseimage = base64Encode(img2!);

    List<String> xxx = [
      baseimage,
      widget.mask,
      widget.sex,
      widget.selectColor,
      widget.rfid,
      widget.selectZone
    ];
    FormData formData = FormData.fromMap({
      "mode": "P",
      "data": jsonEncode(xxx),
    });
    try {
      String urlAPI = '${domain_sightguide}upload_face.php?select=upload_face';
      await Dio().post(urlAPI, data: formData).then((value) {});
    } catch (e) {
      Future.delayed(
        const Duration(seconds: 10),
        () {
          setState(() {
            Navigator.of(context)
                .pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => MyAppPhoto(
                        cardCode: widget.cardCode,
                        checkFace: widget.checkFace,
                        mask: widget.mask,
                        rfid: widget.rfid,
                        selectColor: widget.selectColor,
                        selectZone: widget.selectZone,
                        sex: widget.sex,
                        bg: widget.bg,
                      ),
                    ),
                    (Route<dynamic> route) => false)
                .then((value) {});
          });
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    startTimerCheck();
    widget.orgfile.readAsBytes().then((value) {
      setState(() {
        String baseImage = base64Encode(value);
        img1 = const Base64Decoder().convert(baseImage);
        postArray2();
      });
    });
    widget.orgfile.readAsBytes().then((value) {
      String baseImage = base64Encode(value);

      DbClass()
          .imgprocess(param: 'facecroporgsize', image: baseImage)
          .then((value) {
        setState(() {
          img3 = const Base64Decoder().convert(value);
          try {
            postArrayORG().then((value) {});
          } catch (e) {
            print(e);
          }
        });
      });

      DbClass().imgprocess(param: "facecrop", image: baseImage).then((value) {
        setState(() {
          img2 = const Base64Decoder().convert(value);
          try {
            checkTrue = false;
            postArray().then((value) {
              checkTrue = true;
              startTimer();
            });
          } catch (error) {
            Navigator.pop(context);
          }
        });
      });
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    timer2!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/BG0.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(child: _typer()),
                  const SizedBox(height: 30),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _typer() {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 40.0,
        color: Colors.white,
        fontFamily: 'kid',
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText(
            'PROCESSING................. ',
          ),
        ],
        isRepeatingAnimation: true,
        totalRepeatCount: 10004,
        onTap: () {},
      ),
    );
  }
}
