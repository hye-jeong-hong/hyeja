import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/home.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;

class Date extends StatefulWidget {
  List<String> MemberName;
  List<String> Member_face_lifting;
  List<int> hospital_id;
  List<int> MemberId;

  Date({this.MemberName, this.Member_face_lifting, this.hospital_id, this.MemberId});

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {

  String _selectedDate = '';
  String _printdate = '';
  List<String> date = [];
  List<dynamic> surgery_info = [];
  List<String> surgery_category = [];

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedDate = DateFormat('yyyy-MM-dd').format(args.value).toString();  //날짜를 해당 포맷으로 설정
        _printdate = _selectedDate;
        _selectedDate = _selectedDate + "T00:36:36.070Z";
        date = [];
        date.add(_selectedDate);
      }
    });
  }

  surgery(String name, String date, int patient, int hospital) async {

    String category = '';
    List<String> eye = ['쌍카풀', '눈트임', '눈매교정', '상안검리프트', '안검성형', '눈지방제거', '눈 지방이식', '애교살필러', '눈밑필러'];
    List<String> nose = ['콧대(고어텍스)', '콧대(실리콘)', '콧대(자가진피)', '스케폴더', '코끝(귀연골)', '코끝(비중격)', '코끝(늑연골/갈비뼈)', '코끝조직축소(복코)', '절개콧볼축소', '비절개콧볼축소', '휜코교정(절골)', '콧대 지방 이식', '코필러'];
    List<String> chin = ['사각턱수술', '턱끝수술', '주걱턱','무턱', '턱끝 지방이식', '무턱보형물', '턱필러'];
    List<String> cheek = ['광대뼈축소술', '퀵광대', '광대 지방이식', '광대필러'];
    List<String> forehead = ['이마윤곽술', '이마 지방이식', '이마거상', '이마보형물', '이마필러'];
    List<String> face = ['얼굴 지방흡입', '풀페이스 지방이식', '실리프팅', '안면거상', '귀족보형물', '볼필러', '풀페이스필러', '팔자주름필러'];
    List<String> chest = ['가슴확대', '가슴축소', '유두수술', '유륜수술', '처진가슴교정', '가슴 지방이식'];
    List<String> lip = ['돌출입수술', '입술축소', '입술확대', '입꼬리수술', '입술필러'];

    for(int j = 0; j<eye.length; j++) {
      if (name == eye[j])
        category = '눈';
    }
    for(int j = 0; j<nose.length; j++) {
      if (name == nose[j])
        category = '코';
    }
    for(int j = 0; j<chin.length; j++) {
      if(name == chin[j])
        category = '턱';
    }
    for(int j = 0; j<cheek.length; j++) {
      if(name == cheek[j])
        category = '광대';
    }
    for(int j = 0; j<forehead.length; j++) {
      if(name == forehead[j])
        category = '이마';
    }
    for(int j = 0; j<face.length; j++) {
      if (name == face[j])
        category = '얼굴';
    }
    for(int j = 0; j<1; j++) {
      if(name == '팔뚝 지방흡입')
        category = '팔';
      else if(name == '겨드랑이 지방흡입')
        category = '겨드랑이';
      else if(name == '브레지어라인 지방흡입')
        category = '브레지어라인';
      else if(name == '옆구리살 지방흡입')
        category = '옆구리';
      else if(name == '상/하복부 지방흡입')
        category = '상/하복부';
      else if(name == '허벅지 지방흡입')
        category = '허벅지';
      else if(name == '무릅 지방흡입')
        category = '무릎';
      else if(name == '종아리 지방흡입')
        category = '종아리';
      else if(name == '엉덩이 지방흡입' || name == '엉덩이/골반 지방이식')
        category = '엉덩이';
      else if(name == '절개인중축소' || name == '비절개인중축소')
        category = '인중';
      else if(name == '눈썹거상')
        category = '눈썹';
      else if(name == '관자놀이필러')
        category = '관자놀이';
    }
    for(int j = 0; j<chest.length; j++) {
      if(name == chest[j])
        category = '가슴';
    }
    for(int j = 0; j<lip.length; j++) {
       if(name == lip[j])
         category = '입';
     }

    Map surgery_data =
    {
      "name" : name,
      "part" : "part",
      "surgeryDay" : date, //surgeryDay,
      "reportCategory": category, //reportCategory,
      "patient": patient,
      "hospital": hospital,
    };

    final response = await http.post(Uri.parse('http://3.35.67.179:3300/surgery'),
      body: jsonEncode(surgery_data),
      headers: {'Content-Type': 'application/json'},
    );

    Map<String, dynamic> info = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("통신 완료");
      if(info['ok'] == true) {
        surgery_info = [];
        surgery_info.add(info['surgery']['surgeryDay']);
        surgery_info.add(info['surgery']['hospital']);
        print(surgery_info);


        surgery_category.add(info['surgery']['reportCategory']);
        print(surgery_category);

      }

    } else if(response.statusCode == 504){
      print('서버와의 연결이 불안정합니다.');
    } else {
      print('코드가 올바르지 않습니다');
      throw Exception('Failed to contect Server');
    }
  }

  @override
  Widget build(BuildContext context) {

    int call = widget.Member_face_lifting.length;

    return Scaffold(
        appBar: AppBar(
          title: const Text('After Me'),
          backgroundColor: Colors.deepPurple[300],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(widget.MemberName[0] + '님이 성형 수술/시술하신\n날짜를 선택해주세요',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 30),
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 4)),
                      DateTime.now().add(const Duration(days: 3))),
                ),
              ),
            ),
            Center(child: Text('선택하신 날짜\n', style: TextStyle(fontSize: 16),)),
            Center(child: Text(_printdate, style: TextStyle(fontSize: 14),)),
            Padding(
              padding: const EdgeInsets.only(top:40),
              child: Center(
                child: Container(
                  width: 130,
                  height: 50,
                  child: RaisedButton(
                    child: Text('완료', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed:() {
                      print(_selectedDate);
                      print(widget.Member_face_lifting[0]);
                      print(widget.MemberId[0]);
                      print(widget.hospital_id[0]);

                      for(int i = 0; i<call; i++){
                        surgery(widget.Member_face_lifting[i], _selectedDate, widget.MemberId[0], widget.hospital_id[0]);
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home(surgery_info: surgery_info, surgery_category: surgery_category, Member_face_lifting: widget.Member_face_lifting, MemberName: widget.MemberName,)));


                    },
                  ),
                ),
              ),
            ),
          ],
        ));
      }

  //앱 사용자가 날짜를 선택안하고 다음 버튼을 눌렀을 때 날짜를 선택하도록 알림창 뜸
  void showAlertDialog_date(BuildContext context) async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('After Me'),
            content: Text("수술하신 날짜를 선택해주세요 :)"),
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