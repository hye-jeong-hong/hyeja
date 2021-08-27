import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/date.dart';
import 'package:http/http.dart' as http;

class Hospital extends StatefulWidget {
  List<String> MemberName;
  List<String> Member_face_lifting;
  List<int> MemberId;
  Hospital({this.MemberName, this.Member_face_lifting, this.MemberId});

  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  final _hospitalinfo = ['바노바기성형외과', '디엠성형외과의원', '쥬얼리성형외과의원'];
  var _selecthospital = '바노바기성형외과';

  List<int> hospital_id = [];
  List<int> hospital_info = [];

  TextEditingController _hospitalController = new TextEditingController();
  Hospital(String name) async {

    final response = await http.get(Uri.parse('http://3.35.67.179:3300/hospital'),  //보낼 서버 주소
      headers: {'Content-Type': 'application/json'},
    );

    Map<String, dynamic> hospital_data = json.decode(response.body.toString());
    print('response Body: ' + response.body);  //보내지는지 확인

    if (response.statusCode == 200 || response.statusCode == 201) {

      if(name == '바노바기성형외과')
        hospital_info[0] = 1;

      if (name == '디엠성형외과의원')
        hospital_info[0] = 2;

      if(name == '쥬얼리성형외과의원')
        hospital_info[0] = 3;

    } else if(response.statusCode == 504){
      print('서버와의 연결이 불안정합니다.');
    } else {
      print('코드가 올바르지 않습니다');
      throw Exception('Failed to contect Server');
    }


    return hospital_info;
  }

  final _hospitalKey = GlobalKey<FormState>();
  int hospital = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('After Me'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 10),
              child: Text(widget.MemberName[0] + '님이 성형수술/시술하신\n병원이름을 입력해주세요!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 70),
                child: DropdownButton(
                  value: _selecthospital,
                  items: _hospitalinfo.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value)
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selecthospital = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 100),
            RaisedButton(
              child: Text('다음'),
              color: Colors.orange[300],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {

                int hospital = 0;

                if(_selecthospital == '바노바기성형외과')
                  hospital = 1;
                if (_selecthospital == '디엠성형외과의원')
                  hospital = 2;
                if(_selecthospital == '쥬얼리성형외과의원')
                  hospital = 3;

                hospital_id.add(hospital);

                print(hospital_id);

                if(_selecthospital != '') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Date(MemberName: widget.MemberName, Member_face_lifting: widget.Member_face_lifting, hospital_id: hospital_id, MemberId: widget.MemberId)));
                } else {
                  showAlertDialog_hospital(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  //병원 이름 입력안되었을 시 입력을 안내하는 알림창 뜸
  void showAlertDialog_hospital(BuildContext context) async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('After Me'),
            content: Text("병원 이름을 입력해주세요 :)"),
            actions: [
              FlatButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}