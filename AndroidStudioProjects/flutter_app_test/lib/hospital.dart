import 'package:flutter/material.dart';
import 'package:flutter_app_test/info_select.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('애프터 미'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text('홍길동님이 성형수술/시술하신\n병원을 선택해주세요!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
