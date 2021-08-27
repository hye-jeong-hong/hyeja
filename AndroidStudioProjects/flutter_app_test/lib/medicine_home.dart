import 'package:flutter/material.dart';
import 'package:flutter_app_test/medicine_info.dart';
import 'package:flutter_app_test/medicine_info_list.dart';
import 'package:flutter_app_test/medicine_notification.dart';
import 'package:flutter_app_test/medicine_search.dart';

class MedicineHome extends StatefulWidget {
  List<String> MemberName;
  MedicineHome({this.MemberName});

  @override
  _MedicineHomeState createState() => _MedicineHomeState();
}

class _MedicineHomeState extends State<MedicineHome> {
  final List<String> listExample = List.generate(10, (index) => "Text $index");
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Text('복약 관리',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20),
              child: Text('After Me와 함께 꼼꼼하고 편리한 복약 관리를 해보세요 :D',
                style: TextStyle(fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text('\u{1F48A} 복약 기록',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: 50,
                width: 370,
                child: RaisedButton(
                  child: Text('복약 기록하기', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed:() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MedicineInfo()));
                  },
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                height: 50,
                width: 370,
                child: RaisedButton(
                  child: Text('나의 복약 기록 보러가기', style: TextStyle(fontWeight: FontWeight.bold),),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed:() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MedicineInfoList()));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20),
              child: Text('\u{1F48A} 복용 알림 받기',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                height: 50,
                width: 370,
                child: RaisedButton(
                  child: Text('복용 알림 설정하기', style: TextStyle(fontWeight: FontWeight.bold),),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed:() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MedicineNotification(MemberName: widget.MemberName)));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Text('\u{1F48A} 복약 정보 조회',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            Center(
              child: Container(
                height: 50,
                width: 370,
                child: RaisedButton(
                  child: Text('복약 정보 조회하러가기', style: TextStyle(fontWeight: FontWeight.bold),),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed:() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchMedicine()));
                  },
                ),
              ),
            ),
          ],
        ),
    );
  }
}