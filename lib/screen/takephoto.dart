import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:register_kidsclub/model/model.dart';

import 'face.dart';
import 'face2.dart';
import 'loadface.dart';
import 'package:image/image.dart' as img;
import 'package:exif/exif.dart';

class MyAppPhoto extends StatefulWidget {
  final String rfid,
      sex,
      selectColor,
      mask,
      cardCode,
      checkFace,
      selectZone,
      bg;
  const MyAppPhoto(
      {super.key,
      required this.rfid,
      required this.sex,
      required this.selectColor,
      required this.mask,
      required this.cardCode,
      required this.checkFace,
      required this.selectZone,
      required this.bg});

  @override
  State<MyAppPhoto> createState() => _MyAppPhotoState();
}

class _MyAppPhotoState extends State<MyAppPhoto> {
  List<CameraDescription>? cameras;
  CameraController? controller;
  XFile? image;
  int counter = 0;
  Timer? timer;
  bool visibilityObs = false;
  String bg = 'BG6.png';
  String back = 'back';
  Uint8List? imageData;
  int orientation = 1;

  void startTime(context) {
    counter = 5;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter--;
        });
      } else {
        timer.cancel();
        capture(context);
      }
    });
  }

  /*void capture(context) async {
    try {
      controller!.takePicture().then((value) async {
        setState(() {
          image = value;
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => LoadFace(
                  orgfile: image!,
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
              (Route<dynamic> route) => false);
        });
      });
    } catch (e) {
      print(e);
    }
  }*/

  void capture(BuildContext context) async {
    try {
      final XFile? picture = await controller!.takePicture();
      if (picture != null) {
        final File imageFile = File(picture.path);

        // Read the image from the file
        img.Image? capturedImage =
            img.decodeImage(await imageFile.readAsBytes());

        if (capturedImage != null) {
          // Read EXIF data
          final Map<String, IfdTag> exifData =
              await readExifFromBytes(await imageFile.readAsBytes());

          img.Image orientedImage = capturedImage;

          // Check if the image contains orientation data and adjust accordingly
          if (exifData.isNotEmpty &&
              exifData.containsKey('Image Orientation')) {
            orientation =
                exifData['Image Orientation']?.values.firstAsInt() ?? 1;

            switch (orientation) {
              case 3:
                // Rotate 180 degrees
                orientedImage = img.copyRotate(capturedImage, angle: 180);
                break;
              case 6:
                // Rotate 90 degrees clockwise
                orientedImage = img.copyRotate(capturedImage, angle: 90);
                break;
              case 8:
                // Rotate 90 degrees counterclockwise
                orientedImage = img.copyRotate(capturedImage, angle: 90);
                break;
              default:
                // No rotation needed
                break;
            }
          }

          // Write the fixed image back to the file
          await imageFile.writeAsBytes(img.encodeJpg(orientedImage));

          setState(() {
            image = XFile(imageFile.path);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => LoadFace(
                    orgfile: image!,
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
                (Route<dynamic> route) => false);
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  Future<void> deleteData() async {
    List<String> xxx = [widget.rfid];
    FormData formData = FormData.fromMap({
      'mode': 'P',
      'data': jsonEncode(xxx),
    });
    String urlApi = '${domain_sightguide}upload_face.php?select=deleteface';
    Dio().post(urlApi, data: formData).then((value) {
      print('Delete');
    }).then((value) {});
  }

  @override
  void initState() {
    if (widget.bg == 'en') {
      bg = 'BG6.png';
      back = 'back';
    } else if (widget.bg == 'th') {
      bg = 'th/BG6.jpg';
      back = 'th/backTH';
    } else if (widget.bg == 'chs') {
      bg = 'chs/BG6.jpg';
      back = 'chs/backCHS';
    } else if (widget.bg == 'cht') {
      bg = 'cht/BG6.jpg';
      back = 'cht/backCHT';
    } else if (widget.bg == 'rs') {
      bg = 'rs/BG6.jpg';
      back = 'rs/backRS';
    } else if (widget.bg == 'jp') {
      bg = 'jp/BG6.jpg';
      back = 'jp/backJP';
    } else if (widget.bg == 'ar') {
      bg = 'ar/BG6.jpg';
      back = 'ar/backAR';
    } else if (widget.bg == 'fr') {
      bg = 'fr/BG6.jpg';
      back = 'fr/backFr';
    } else if (widget.bg == 'kaz') {
      bg = 'kaz/BG6.jpg';
      back = 'kaz/backKaz';
    } else if (widget.bg == 'sp') {
      bg = 'sp/BG6.jpg';
      back = 'sp/backSP';
    } else if (widget.bg == 'vn') {
      bg = 'vn/BG6.jpg';
      back = 'vn/backVN';
    } else if (widget.bg == 'heb') {
      bg = 'heb/BG6.jpg';
      back = 'heb/backHeb';
    }
    loadCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/$bg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                  //-25
                  top: 30,
                  left: 300,
                  child: //image == null ?
                      Container(
                    //decoration: BoxDecoration(border: Border.all()),
                    //450
                    height: 400,
                    //320
                    width: 270,
                    child: controller == null
                        ? const Center(child: Text("Loading Camera..."))
                        : !controller!.value.isInitialized
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : RotationTransition(
                                // 15/60
                                turns: const AlwaysStoppedAnimation(15 / 60),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white,
                                  ),
                                  child: CameraPreview(controller!),
                                ),
                              ),
                  )
                  /*: Container(
                        width: 400,
                        height: 270,
                        child: Image.file(
                          File(image!.path),
                        ),
                      ),*/
                  ),
              Positioned(
                top: 380,
                left: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        if (widget.checkFace == '1') {
                          Navigator.of(context)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => FacePage(
                                      cardCode: widget.cardCode,
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
                        } else {
                          Navigator.of(context)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => FacePage2(
                                      cardCode: widget.cardCode,
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
                        }
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
                    const SizedBox(
                      width: 170,
                    ),
                    visibilityObs
                        ? Container(
                            //padding: const EdgeInsets.all(5),
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFFAB104),
                                width: 5,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            child: Container(
                              // set width equal to height to make a square
                              width: 55,
                              height: 55,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFED4798),
                                  shape: BoxShape.circle),
                              alignment: Alignment.center,
                              child: Text(
                                "$counter",
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontFamily: 'TrajanProBold',
                                ),
                              ),
                            ),
                          )
                        : Row(
                            children: [
                              Container(
                                height: 55.0,
                                width: 55.0,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                      backgroundColor: Colors.white,
                                      child: const Icon(
                                        Icons.camera_alt_rounded,
                                        color: Colors.black,
                                      ),
                                      onPressed: () async {
                                        visibilityObs = true;
                                        startTime(context);
                                      }),
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
