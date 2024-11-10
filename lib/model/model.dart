import 'package:dio/dio.dart';

const String domain = 'http://172.2.100.14/posdata/';
const String domain_pic = 'http://172.2.100.14/posdata/';
const String domain_sightguide = 'http://172.2.100.14/SightguideKid/';

//const String domain = 'http://pfclapi.synology.me/~F0143/transfersystem/';
//const String domain_pic = 'http://pfclapi.synology.me/~F0143/';

class LoginModel {
  String? usercode;
  String? username;
  String? passwords;
  String? status;

  LoginModel({this.usercode, this.username, this.passwords, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
    usercode = json['usercode'];
    username = json['username'];
    passwords = json['passwords'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['usercode'] = usercode;
    data['username'] = username;
    data['passwords'] = passwords;
    data['status'] = status;
    return data;
  }
}

class DataTransferHeadList {
  String? rowNum;
  String? docNo;
  String? bookRecive;
  String? bookName;
  String? reTime;
  String? hotelCode;
  String? hotelName;
  String? resCode;
  String? room;
  String? voucherCode;
  String? sendSum;
  String? customerCode;
  String? nameCus;
  String? remark;
  String? showDate;
  String? agent;
  String? nameT;
  String? description;
  String? wellcome;
  String? catname;
  String? namepic;
  String? private;
  String? nickname;
  String? tOC;
  String? star;
  String? driverCode;
  String? driverName;
  String? carNoApp;
  String? latitude;
  String? longitude;
  String? customercome;

  DataTransferHeadList(
      {this.rowNum,
      this.docNo,
      this.bookRecive,
      this.bookName,
      this.reTime,
      this.hotelCode,
      this.hotelName,
      this.resCode,
      this.room,
      this.voucherCode,
      this.sendSum,
      this.customerCode,
      this.nameCus,
      this.remark,
      this.showDate,
      this.agent,
      this.nameT,
      this.description,
      this.wellcome,
      this.catname,
      this.namepic,
      this.private,
      this.nickname,
      this.tOC,
      this.star,
      this.driverCode,
      this.driverName,
      this.carNoApp,
      this.latitude,
      this.longitude,
      this.customercome});

  DataTransferHeadList.fromJson(Map<String, dynamic> json) {
    rowNum = json['row_num'];
    docNo = json['DocNo'];
    bookRecive = json['Book_Recive'];
    bookName = json['BookName'];
    reTime = json['Re_Time'];
    hotelCode = json['HotelCode'];
    hotelName = json['HotelName'];
    resCode = json['Res_Code'];
    room = json['Room'];
    voucherCode = json['Voucher_Code'];
    sendSum = json['SendSum'];
    customerCode = json['Customer_Code'];
    nameCus = json['NameCus'];
    remark = json['Remark'];
    showDate = json['Show_date'];
    agent = json['Agent'];
    nameT = json['Name_T'];
    description = json['Description'];
    wellcome = json['Wellcome'];
    catname = json['catname'];
    namepic = json['namepic'];
    private = json['Private'];
    nickname = json['nickname'];
    tOC = json['TOC'];
    star = json['Star'];
    driverCode = json['DriverCode'];
    driverName = json['DriverName'];
    carNoApp = json['CarNo_App'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    customercome = json['customercome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['row_num'] = rowNum;
    data['DocNo'] = docNo;
    data['Book_Recive'] = bookRecive;
    data['BookName'] = bookName;
    data['Re_Time'] = reTime;
    data['HotelCode'] = hotelCode;
    data['HotelName'] = hotelName;
    data['Res_Code'] = resCode;
    data['Room'] = room;
    data['Voucher_Code'] = voucherCode;
    data['SendSum'] = sendSum;
    data['Customer_Code'] = customerCode;
    data['NameCus'] = nameCus;
    data['Remark'] = remark;
    data['Show_date'] = showDate;
    data['Agent'] = agent;
    data['Name_T'] = nameT;
    data['Description'] = description;
    data['Wellcome'] = wellcome;
    data['catname'] = catname;
    data['namepic'] = namepic;
    data['Private'] = private;
    data['nickname'] = nickname;
    data['TOC'] = tOC;
    data['Star'] = star;
    data['DriverCode'] = driverCode;
    data['DriverName'] = driverName;
    data['CarNo_App'] = carNoApp;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['customercome'] = customercome;
    return data;
  }
}

class DriverShow {
  String? showDate;
  String? docNo;
  String? driverCode;
  String? driverName;
  String? carNo;
  String? private;
  String? flagPrint;
  String? carnoApp;

  DriverShow(
      {this.showDate,
      this.docNo,
      this.driverCode,
      this.driverName,
      this.carNo,
      this.private,
      this.flagPrint,
      this.carnoApp});

  DriverShow.fromJson(Map<String, dynamic> json) {
    showDate = json['Show_Date'];
    docNo = json['DocNo'];
    driverCode = json['DriverCode'];
    driverName = json['DriverName'];
    carNo = json['CarNo'];
    private = json['Private'];
    flagPrint = json['FlagPrint'];
    carnoApp = json['carno_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Show_Date'] = showDate;
    data['DocNo'] = docNo;
    data['DriverCode'] = driverCode;
    data['DriverName'] = driverName;
    data['CarNo'] = carNo;
    data['Private'] = private;
    data['FlagPrint'] = flagPrint;
    data['carno_app'] = carnoApp;
    return data;
  }
}

class TransH {
  String? rowNum;
  String? showDate;
  String? docNo;
  String? driverCode;
  String? driverName;
  String? countPrint;
  String? carNo;
  String? private;
  String? flagPrint;
  String? carnoApp;
  String? reTime;
  String? flagtype;
  String? countbooking;
  String? qty;

  TransH(
      {this.rowNum,
      this.showDate,
      this.docNo,
      this.driverCode,
      this.driverName,
      this.countPrint,
      this.carNo,
      this.private,
      this.flagPrint,
      this.carnoApp,
      this.reTime,
      this.countbooking,
      this.qty});

  TransH.fromJson(Map<String, dynamic> json) {
    rowNum = json['row_num'];
    showDate = json['Show_Date'];
    docNo = json['DocNo'];
    driverCode = json['DriverCode'];
    driverName = json['DriverName'];
    countPrint = json['CountPrint'] ?? '';
    carNo = json['CarNo'];
    private = json['Private'];
    flagPrint = json['FlagPrint'];
    carnoApp = json['carno_app'];
    reTime = json['re_time'];
    flagtype = json['flagtype'];
    countbooking = json['countbooking'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['row_num'] = rowNum;
    data['Show_Date'] = showDate;
    data['DocNo'] = docNo;
    data['DriverCode'] = driverCode;
    data['DriverName'] = driverName;
    data['CountPrint'] = countPrint;
    data['CarNo'] = carNo;
    data['Private'] = private;
    data['FlagPrint'] = flagPrint;
    data['carno_app'] = carnoApp;
    data['re_time'] = reTime;
    data['flagtype'] = flagtype;
    data['countbooking'] = countbooking;
    data['qty'] = qty;
    return data;
  }
}

class Personal {
  String? personId;
  String? code;
  String? name;
  String? nickname;
  String? nameT;
  String? lNameT;
  String? nameE;
  String? lNameE;
  String? nicknameE;
  String? flagwork;
  String? position;
  String? prefix;
  String? startwork;
  String? pOSICODE;
  String? sectionCode;
  String? serviceName;
  String? company;

  Personal(
      {this.personId,
      this.code,
      this.name,
      this.nickname,
      this.nameT,
      this.lNameT,
      this.nameE,
      this.lNameE,
      this.nicknameE,
      this.flagwork,
      this.position,
      this.prefix,
      this.startwork,
      this.pOSICODE,
      this.sectionCode,
      this.serviceName,
      this.company});

  Personal.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    code = json['code'];
    name = json['name'];
    nickname = json['nickname'];
    nameT = json['Name_T'];
    lNameT = json['LName_T'];
    nameE = json['Name_E'];
    lNameE = json['LName_E'];
    nicknameE = json['Nickname_E'];
    flagwork = json['Flagwork'];
    position = json['Position'];
    prefix = json['Prefix'];
    startwork = json['Startwork'];
    pOSICODE = json['POSI_CODE'];
    sectionCode = json['section_code'];
    serviceName = json['Service_Name'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['person_id'] = personId;
    data['code'] = code;
    data['name'] = name;
    data['nickname'] = nickname;
    data['Name_T'] = nameT;
    data['LName_T'] = lNameT;
    data['Name_E'] = nameE;
    data['LName_E'] = lNameE;
    data['Nickname_E'] = nicknameE;
    data['Flagwork'] = flagwork;
    data['Position'] = position;
    data['Prefix'] = prefix;
    data['Startwork'] = startwork;
    data['POSI_CODE'] = pOSICODE;
    data['section_code'] = sectionCode;
    data['Service_Name'] = serviceName;
    data['company'] = company;
    return data;
  }

  static List<Personal>? fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => Personal.fromJson(item)).toList();
  }
}

class ChangeList {
  String? bookRecive;
  String? changecode;
  String? changedate;
  String? groupRunno;
  String? items;
  String? flagNew;
  String? remarks;
  String? drivercode;
  String? staffcode;
  String? ad;
  String? ch;
  String? inf;
  String? gud;
  String? tl;
  String? reTime;
  String? sms;
  String? no;
  String? changename;
  String? changenameEng;

  ChangeList(
      {this.bookRecive,
      this.changecode,
      this.changedate,
      this.groupRunno,
      this.items,
      this.flagNew,
      this.remarks,
      this.drivercode,
      this.staffcode,
      this.ad,
      this.ch,
      this.inf,
      this.gud,
      this.tl,
      this.reTime,
      this.sms,
      this.no,
      this.changename,
      this.changenameEng});

  ChangeList.fromJson(Map<String, dynamic> json) {
    bookRecive = json['book_recive'];
    changecode = json['changecode'];
    changedate = json['changedate'];
    groupRunno = json['group_runno'];
    items = json['items'];
    flagNew = json['flag_new'];
    remarks = json['remarks'];
    drivercode = json['drivercode'];
    staffcode = json['staffcode'];
    ad = json['ad'];
    ch = json['ch'];
    inf = json['inf'];
    gud = json['gud'];
    tl = json['tl'];
    reTime = json['re_time'];
    sms = json['sms'];
    no = json['no'];
    changename = json['changename'];
    changenameEng = json['changename_eng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['book_recive'] = bookRecive;
    data['changecode'] = changecode;
    data['changedate'] = changedate;
    data['group_runno'] = groupRunno;
    data['items'] = items;
    data['flag_new'] = flagNew;
    data['remarks'] = remarks;
    data['drivercode'] = drivercode;
    data['staffcode'] = staffcode;
    data['ad'] = ad;
    data['ch'] = ch;
    data['inf'] = inf;
    data['gud'] = gud;
    data['tl'] = tl;
    data['re_time'] = reTime;
    data['sms'] = sms;
    data['no'] = no;
    data['changename'] = changename;
    data['changename_eng'] = changenameEng;
    return data;
  }

  static List<ChangeList> fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => ChangeList.fromJson(item)).toList();
  }
}

class ChangeMaster {
  String? rowNum;
  String? changecode;
  String? changename;
  String? changenameEng;
  String? orderby;
  String? chk;

  ChangeMaster(
      {this.rowNum,
      this.changecode,
      this.changename,
      this.changenameEng,
      this.orderby,
      this.chk});

  ChangeMaster.fromJson(Map<String, dynamic> json) {
    rowNum = json['row_num'];
    changecode = json['changecode'];
    changename = json['changename'];
    changenameEng = json['changename_eng'];
    orderby = json['orderby'];
    chk = json['chk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['row_num'] = rowNum;
    data['changecode'] = changecode;
    data['changename'] = changename;
    data['changename_eng'] = changenameEng;
    data['orderby'] = orderby;
    data['chk'] = chk;
    return data;
  }

  static List<ChangeMaster> fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => ChangeMaster.fromJson(item)).toList();
  }
}

class ShowPic {
  String? docdate;
  String? filename;

  ShowPic({this.docdate, this.filename});

  ShowPic.fromJson(Map<String, dynamic> json) {
    docdate = json['docdate'];
    filename = json['filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['docdate'] = docdate;
    data['filename'] = filename;
    return data;
  }

  static List<ShowPic> fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => ShowPic.fromJson(item)).toList();
  }
}

class DbClass {
  //http://220.200.30.245:3000/
  // String domain =
  //     "https://pfclapi.synology.me/~F0096/ticketapi/datamodule/mainlib.php";
  String domain =
      "http://172.2.200.200/cmfrontapp/ticketing/ticketapi/datamodule/mainlib.php/";
  String socketserver = 'http://172.2.5.49:3000';

  String servrerimg = 'http://172.2.5.49/';
  String systemid = "1019";

  DbClass();

  Future<String> opendoor() async {
    FormData formData = new FormData.fromMap(
      {
        "param": "getoneseat",
      },
    );
    String urlAPI = "${socketserver}" + "/opendoor";
    Response response = await Dio().get(urlAPI);
    return 'Y';
    //var result = GuideModelInfo.fromJson(response.data);
    //return result;
  }

  Future<String> imgprocess({required String param, required String image}) async {
    FormData formData = new FormData.fromMap(
      {"param": param, "img": image},
    );

    String urlAPI = "${servrerimg}";
    Response response = await Dio().post(urlAPI, data: formData);
    return response.data["img"];
  }
}

class Rowdetail {
  String? seat;
  String? col;
  String? row;
  String? zone;
  String? isRim;
  String? isExtra;
  String? zoneLevel;
  String? gate;
  String? status;
  String? royalseat;
  String? seattype;
  String? dzone;

  Rowdetail(
      {this.seat,
      this.col,
      this.row,
      this.zone,
      this.isRim,
      this.isExtra,
      this.zoneLevel,
      this.gate,
      this.status,
      this.royalseat,
      this.seattype,
      this.dzone});

  Rowdetail.fromJson(Map<String, dynamic> json) {
    seat = json['seat'];
    col = json['col'];
    row = json['row'];
    zone = json['zone'];
    isRim = json['is_rim'];
    isExtra = json['is_extra'];
    zoneLevel = json['zone_level'];
    gate = json['gate'];
    status = "N";
    royalseat = json['royalseat'];
    seattype = json['seattype'];
    dzone = json['dzone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seat'] = seat;
    data['col'] = col;
    data['row'] = row;
    data['zone'] = zone;
    data['is_rim'] = isRim;
    data['is_extra'] = isExtra;
    data['zone_level'] = zoneLevel;
    data['gate'] = gate;
    data['status'] = status;
    data['royalseat'] = royalseat;
    data['seattype'] = seattype;
    data['dzone'] = dzone;
    return data;
  }

  static List<Rowdetail> fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => Rowdetail.fromJson(item)).toList();
  }
}

class GetFace {
  String? id;
  String? faces;
  String? idpic;

  GetFace({this.id, this.faces, this.idpic});

  GetFace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    faces = json['faces'];
    idpic = json['idpic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['faces'] = faces;

    data['idpic'] = idpic;

    return data;
  }

  static List<GetFace> fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => GetFace.fromJson(item)).toList();
  }
}

class CheckCard {
  String? id;
  String? sex;
  String? color;
  String? faces;
  String? idpic;

  CheckCard({this.id, this.sex, this.color, this.faces, this.idpic});

  CheckCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sex = json['sex'];
    color = json['color'];
    faces = json['faces'];
    idpic = json['idpic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sex'] = sex;
    data['color'] = color;
    data['faces'] = faces;
    data['idpic'] = idpic;
    return data;
  }

  static List<CheckCard> fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => CheckCard.fromJson(item)).toList();
  }
}

class Machine {
  String? machinecode;
  String? machinename;
  String? cardcode;

  Machine({this.machinecode, this.machinename, this.cardcode});

  Machine.fromJson(Map<String, dynamic> json) {
    machinecode = json['machinecode'];
    machinename = json['machinename'];
    cardcode = json['cardcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['machinecode'] = machinecode;
    data['machinename'] = machinename;
    data['cardcode'] = cardcode;
    return data;
  }

  static List<Machine> fromJsonList(List list) {
    //if (list == null) return null;
    return list.map((item) => Machine.fromJson(item)).toList();
  }
}
