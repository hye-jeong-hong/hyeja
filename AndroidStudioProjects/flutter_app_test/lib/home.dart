import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_app_test/info_select.dart';
import 'package:flutter_app_test/login.dart';
import 'package:flutter_app_test/medical_consultation.dart';
import 'package:flutter_app_test/medicine_home.dart';
import 'package:flutter_app_test/recovery_info_list.dart';
import 'package:flutter_app_test/recovery.dart';
import 'package:flutter_app_test/recovery_test.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  List<String> MemberName;
  List<String> Member_face_lifting;
  List<String> hospital_name;
  List<int> MemberId;
  List<dynamic> surgery_info;
  List<String> surgery_category;

  Home({this.MemberName, this.Member_face_lifting, this.hospital_name, this.MemberId, this.surgery_info, this.surgery_category});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {


    widget.surgery_info = ['2021/08/27'];  //로그인 -> HOME 들어오기 위한 초기화
    String temp = (widget.surgery_info[0]).toString();
    String date = temp.replaceAll('/', '');
    var selectdate = DateTime.parse(date);
    var now = DateTime.now();
    var betweenday = now.difference(selectdate).inDays;



    String face_result = widget.Member_face_lifting.toString();
    face_result = face_result.replaceAll('[', '');
    face_result = face_result.replaceAll(']', '');
    face_result = face_result.replaceAll(',', '  #');

    // 수술 날짜부터 현재 날짜를 기준으로 기간에 따른 회복 단계 제공
    String level_title_1 = '지혈 시기';
    String level_title_2 = '염증 시기';
    String level_title_3 = '증식 시기';
    String level_title_4 = '재형성 시기';
    String level_title = '';
    String recovery_level_1 = '1일차 수술 직후 지혈이 이뤄져야 하는 시기로, 절대 수술 부위를 건드리시면 안됩니다.'; //1일차-3일차
    String recovery_level_2 = '수술부위의 조직 손상으로 인한 염증반응이 일어나고 회복하는 단계로 가장 붓기가 심하고 통증이 심한 시기입니다. 전문 관리를 통해 염증 시기를 단축시킬 수 있습니다.'; //4-10일차
    String recovery_level_3 = '마지막까지 잘 안빠지는 붓기와 멍을 다스릴 수 있는 시기입니다. 이 시기에는 조직의 혈관이 생성되고 섬유 모세포의 증식으로 상처가 아물고 자리잡게됩니다.'; //11-30일차
    String recovery_level_4 = '수개월까지 콜라겐 생성 및 반흔 형성으로 인한 상처 회복 기간입니다.'; //30일 이후
    String recovery_level = '';

    if(0<betweenday && betweenday<4){
      level_title = level_title_1;
      recovery_level =recovery_level_1;
    }else if(4<=betweenday && betweenday<11){
      level_title = level_title_2;
      recovery_level = recovery_level_2;
    }else if(11<=betweenday && betweenday<31){
      level_title = level_title_3;
      recovery_level = recovery_level_3;
    }else{
      level_title = level_title_4;
      recovery_level = recovery_level_4;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.14,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70, left: 20),
                          child: Text('안녕하세요 ' + widget.MemberName[0] + '님 :)',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 60, left: 60),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => loginPage()));
                            },
                            child: Text('로그아웃',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('나의 수술 정보', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                child: Container(
                  width: 400,
                  height: 135,
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent[200],
                    borderRadius: BorderRadius.all(Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 220),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => InfoSelect(MemberName: widget.MemberName, MemberId: widget.MemberId)));
                            },
                            child: Text('변경하러 가기 >',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text('# ' + face_result,
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        if(betweenday == 0)
                          Text('등록된 정보가 없습니다',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),)
                        else
                          Text('수술한지 ' + betweenday.toString() + '일',
                            style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            softWrap: false,
                          ),
                      ],
                    ),
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20, left: 20, right: 20),
              child: Container(
                height: 160,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.amber[300],
                  borderRadius: BorderRadius.all(Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top:10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('나의 회복 단계\n',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(level_title,
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      Text(recovery_level),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20, left: 20, right: 20),
              child: Text('회복 기록을 작성하여\n나의 수술 후 관리를 시작하세요!',
                style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20, left: 20, right: 20),
              child: Container(
                height: 50,
                width: 370,
                child: OutlineButton(
                  child: Text('지금 바로 회복기록하기',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  borderSide: BorderSide(color: Colors.deepPurple, width: 3.0),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RecoveryTest()));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:13, left: 20, right: 20),
              child: Container(
                height: 50,
                width: 370,
                child: OutlineButton(
                  child: Text('작성한 회복기록 보러가기',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  borderSide: BorderSide(color: Colors.deepPurple, width: 3.0),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RecoveryInfoList()));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20, left: 20, right: 20),
              child: Text('전문의와 함께\n보다 안전하고 빠른 회복을 원한다면?',
                style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:13, left: 20, right: 20),
              child: Container(
                height: 50,
                width: 370,
                child: OutlineButton(
                  child: Text('전문의와 함께 회복하기',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  borderSide: BorderSide(color: Colors.deepPurple, width: 3.0),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MedicalConsultation(MemberName: widget.MemberName, hospital_name: widget.hospital_name, Member_face_lifting: widget.Member_face_lifting)));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20, left: 20, right: 20),
              child: Text('복용약이 있으신가요?\n나의 복용 정보를 기록하고 관리해보세요!',
                style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:13, left: 20, right: 20),
              child: Container(
                height: 50,
                width: 370,
                child: OutlineButton(
                  child: Text('복약 관리',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  borderSide: BorderSide(color: Colors.deepPurple[300], width: 3.0),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MedicineHome(MemberName: widget.MemberName)));
                  },
                ),
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}