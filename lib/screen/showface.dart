import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:register_kidsclub/screen/takephoto.dart';
import 'package:register_kidsclub/screen/thankyou.dart';

import '../model/model.dart';

class ShowFace extends StatefulWidget {
  final String rfid,
      sex,
      mask,
      cardCode,
      checkFace,
      selectColor,
      selectZone,
      bg;
  const ShowFace({
    super.key,
    required this.rfid,
    required this.sex,
    required this.mask,
    required this.cardCode,
    required this.checkFace,
    required this.selectColor,
    required this.selectZone,
    required this.bg,
  });

  @override
  State<ShowFace> createState() => _ShowFaceState();
}

class _ShowFaceState extends State<ShowFace> {
  List<GetFace> getFace = [];
  String face = '0';
  String idface = '0';
  String bg = 'BG7.png';
  String back = 'back';
  String submit = 'submit';

  Future<void> readData() async {
    String urlAPI =
        '${domain_sightguide}upload_face.php?select=select_face_show&RFID=${widget.rfid}';

    Dio().get(urlAPI).then((value) {
      var result = json.decode(value.data);

      setState(() {
        getFace = GetFace.fromJsonList(result);
        face = getFace[0].faces!;
        idface = getFace[0].idpic!;
      });
    });
  }

  Future<void> deleteData() async {
    List<String> xxx = [
      widget.rfid,
    ];
    FormData formData = FormData.fromMap({
      "mode": "P",
      "data": jsonEncode(xxx),
    });

    String urlAPI = '${domain_sightguide}upload_face.php?select=deleteface';
    Dio().post(urlAPI, data: formData).then((value) {}).then((value) {
      //startTimer();
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.bg == 'en') {
      bg = 'BG7.png';
      back = 'back';
      submit = 'submit';
    } else if (widget.bg == 'th') {
      bg = 'th/BG7.jpg';
      back = 'th/backTH';
      submit = 'th/LikeTH';
    } else if (widget.bg == 'chs') {
      bg = 'chs/BG7.jpg';
      back = 'chs/backCHS';
      submit = 'chs/LikeCHS';
    } else if (widget.bg == 'cht') {
      bg = 'cht/BG7.jpg';
      back = 'cht/backCHT';
      submit = 'cht/LikeCHT';
    } else if (widget.bg == 'rs') {
      bg = 'rs/BG7.jpg';
      back = 'rs/backRS';
      submit = 'rs/LikeRS';
    } else if (widget.bg == 'jp') {
      bg = 'jp/BG7.jpg';
      back = 'jp/backJP';
      submit = 'jp/LikeJP';
    } else if (widget.bg == 'ar') {
      bg = 'ar/BG7.jpg';
      back = 'ar/backAR';
      submit = 'ar/LikeAR';
    } else if (widget.bg == 'fr') {
      bg = 'fr/BG7.jpg';
      back = 'fr/backFr';
      submit = 'fr/LikeFr';
    } else if (widget.bg == 'kaz') {
      bg = 'kaz/BG7.jpg';
      back = 'kaz/backKaz';
      submit = 'kaz/LikeKaz';
    } else if (widget.bg == 'sp') {
      bg = 'sp/BG7.jpg';
      back = 'sp/backSP';
      submit = 'sp/LikeSP';
    } else if (widget.bg == 'vn') {
      bg = 'vn/BG7.jpg';
      back = 'vn/backVN';
      submit = 'vn/LikeVN';
    } else if (widget.bg == 'heb') {
      bg = 'heb/BG7.jpg';
      back = 'heb/backHeb';
      submit = 'heb/LikeHeb';
    }
    setState(() {
      readData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/$bg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 300,
              child: Container(
                //  margin: EdgeInsets.only(top: marginTop),
                width: 300,
                height: 380,
                //height: MediaQuery.of(context).size.height / 2,
                //width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        '${domain_sightguide}assets/images/$face.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 138,
              left: 355,
              child: Container(
                // margin: EdgeInsets.only(top: marginTop),
                width: 165,
                height: 185,
                //height: MediaQuery.of(context).size.height / 2,
                //width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        '${domain_sightguide}assets/faces/$idface.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 380,
              left: 250,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      deleteData();
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
                          .then((value) {
                        deleteData();
                      });
                    },
                    child: Container(
                      width: 140,
                      height: 55,
                      decoration: BoxDecoration(
                        //border: Border.all(),
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: AssetImage("assets/images/$back.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 45),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => ThankYouPage(
                              cardCode: widget.cardCode,
                              bg: widget.bg,
                            ),
                          ),
                          (Route<dynamic> route) => false);
                    },
                    child: Container(
                      width: 300,
                      height: 55,
                      decoration: BoxDecoration(
                        //border: Border.all(),
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: AssetImage("assets/images/$submit.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
