import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_app_test/info_select.dart';
import 'package:flutter_app_test/medicine_info.dart';
import 'package:flutter_app_test/recovery_info_list.dart';
import 'package:flutter_app_test/recovery.dart';


class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 260,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 20),
                      child: Text('안녕하세요 홍길동님 :)',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                          child: Container(
                            width: 400,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
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
                                              MaterialPageRoute(builder: (context) => InfoSelect()));
                                        },
                                      child: Text('변경하러 가기 >',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Text('#쌍카풀',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  Text('수술한지 13일',
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
                    ),
                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.only(top:20, left: 20, right: 20),
              child: Container(
                height: 140,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top:10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('나의 회복 단계',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text('염증 시기',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      Text('수술부위의 조직 손상으로 인한 염증반응이 일어나고 회복하는 단계로 가장 붓기가 심하고 통증이 심한 시기입니다. '
                          '전문 관리를 통해 염증 시기를 단축시킬 수 있습니다.')
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
                        MaterialPageRoute(builder: (context) => RecoveryWrite()));
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
                  child: Text('전문의에게 상담신청하기',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  borderSide: BorderSide(color: Colors.deepPurple, width: 3.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20, left: 20, right: 20),
              child: Text('복용약이 있으신가요?\n나의 복용 정보를 기록해보세요!',
                style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:13, left: 20, right: 20),
              child: Container(
                height: 50,
                width: 370,
                child: OutlineButton(
                  child: Text('복용 정보 기록하기',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  borderSide: BorderSide(color: Colors.deepPurple, width: 3.0),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MedicineInfo()));
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