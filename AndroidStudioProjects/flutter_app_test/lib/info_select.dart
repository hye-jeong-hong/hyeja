import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/hospital.dart';
import 'package:http/http.dart' as http;
import 'package:multiselect_formfield/multiselect_formfield.dart';

class InfoSelect extends StatefulWidget {
  List<int> MemberId;
  List<String> MemberName;
  InfoSelect({this.MemberName, this.MemberId});
  @override
  _InfoSelectState createState() => _InfoSelectState();
}

class _InfoSelectState extends State<InfoSelect> {

  bool nextcheck = false;
  List<String> Member_face_lifting = [];
  List<String> select_result = [];

  List _myActivities_eye;
  String _myActivitiesResult_eye;
  List _myActivities_nose;
  String _myActivitiesResult_nose;
  List _myActivities_face;
  String _myActivitiesResult_face;
  List _myActivities_liposuction;
  String _myActivitiesResult_liposuction;
  List _myActivities_bust;
  String _myActivitiesResult_bust;
  List _myActivities_transplantation;
  String _myActivitiesResult_transplantation;
  List _myActivities_lip;
  String _myActivitiesResult_lip;
  List _myActivities_lifting;
  String _myActivitiesResult_lifting;
  List _myActivities_prosthesis;
  String _myActivitiesResult_prosthesis;
  List _myActivities_filler;
  String _myActivitiesResult_filler;

  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivities_eye = [];
    _myActivitiesResult_eye = '';
    _myActivities_nose = [];
    _myActivitiesResult_nose = '';
    _myActivities_face = [];
    _myActivitiesResult_face = '';
    _myActivities_liposuction = [];
    _myActivitiesResult_liposuction = '';
    _myActivities_bust = [];
    _myActivitiesResult_bust = '';
    _myActivities_transplantation = [];
    _myActivitiesResult_transplantation = '';
    _myActivities_lip = [];
    _myActivitiesResult_lip = '';
    _myActivities_lifting = [];
    _myActivitiesResult_lifting = '';
    _myActivities_prosthesis = [];
    _myActivitiesResult_prosthesis = '';
    _myActivities_filler = [];
    _myActivitiesResult_filler = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    List<String> face_result = [];
    if (form.validate()) {
      setState(() {
        for(int i = 0; i < _myActivities_eye.length; i ++) {
          if(_myActivities_eye[i] != null)
            face_result.add(_myActivities_eye[i]);
        }
        for(int i = 0; i < _myActivities_nose.length; i ++) {
          if(_myActivities_nose[i] != null)
            face_result.add(_myActivities_nose[i]);
        }
        for(int i = 0; i < _myActivities_face.length; i ++) {
          if(_myActivities_face[i] != null)
            face_result.add(_myActivities_face[i]);
        }
        for(int i = 0; i < _myActivities_liposuction.length; i ++) {
          if(_myActivities_liposuction[i] != null)
            face_result.add(_myActivities_liposuction[i]);
        }
        for(int i = 0; i < _myActivities_bust.length; i ++) {
          if(_myActivities_bust[i] != null)
            face_result.add(_myActivities_bust[i]);
        }
        for(int i = 0; i < _myActivities_transplantation.length; i ++) {
          if(_myActivities_transplantation[i] != null)
            face_result.add(_myActivities_transplantation[i]);
        }
        for(int i = 0; i < _myActivities_lip.length; i ++) {
          if(_myActivities_lip[i] != null)
            face_result.add(_myActivities_lip[i]);
        }
        for(int i = 0; i < _myActivities_lifting.length; i ++) {
          if(_myActivities_lifting[i] != null)
            face_result.add(_myActivities_lifting[i]);
        }
        for(int i = 0; i < _myActivities_prosthesis.length; i ++) {
          if(_myActivities_prosthesis[i] != null)
            face_result.add(_myActivities_prosthesis[i]);
        }
        for(int i = 0; i < _myActivities_filler.length; i ++) {
          if(_myActivities_filler[i] != null)
            face_result.add(_myActivities_filler[i]);
        }
        print(face_result);
        form.save();
      });
    }
    return face_result;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.MemberId);
    return Scaffold(
      appBar: AppBar(
        title: Text('After Me'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 10.0, top: 10.0),
                  child: Text(widget.MemberName[0] + '님의 성형 수술/시술 부위를 알려주세요!',
                    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),
                    ),
                ),
                Container(
                    padding: EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        child: MultiSelectFormField(
                          autovalidate: false,
                          chipBackGroundColor: Colors.red[200],
                          chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                          dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                          checkBoxActiveColor: Colors.red[200],
                          checkBoxCheckColor: Colors.green,
                          dialogShapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0))),
                          title: Text(
                            "눈",
                            style: TextStyle(fontSize: 16),
                          ),
                          dataSource: [
                            {
                              "display": "쌍카풀",
                              "value": "쌍카풀",
                            },
                            {
                              "display": "눈트임",
                              "value": "눈트임",
                            },
                            {
                              "display": "눈매교정",
                              "value": "눈매교정",
                            },
                            {
                              "display": "상안검리프트",
                              "value": "상안검리프트",
                            },
                            {
                              "display": "안검성형",
                              "value": "안검성형",
                            },
                            {
                              "display": "눈지방제거",
                              "value": "눈지방제거",
                            },
                          ],
                          textField: 'display',
                          valueField: 'value',
                          okButtonLabel: 'OK',
                          cancelButtonLabel: 'CANCEL',
                          hintWidget: Text('눈 성형 종류를 선택해주세요! (중복가능)'),
                          initialValue: _myActivities_eye,
                          onSaved: (value) {
                            if (value == null) return;
                            setState(() {
                              Member_face_lifting = [];
                              _myActivities_eye = value;
                            });
                            Member_face_lifting.add(_myActivitiesResult_eye);
                          },
                        ),
                      ),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: MultiSelectFormField(
                        autovalidate: false,
                        chipBackGroundColor: Colors.red[200],
                        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.red[200],
                        checkBoxCheckColor: Colors.green,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "코",
                          style: TextStyle(fontSize: 16),
                        ),
                        dataSource: [
                          {
                            "display": "콧대(고어텍스)",
                            "value": "콧대(고어텍스)",
                          },
                          {
                            "display": "콧대(실리콘)",
                            "value": "콧대(실리콘)",
                          },
                          {
                            "display": "콧대(자가진피)",
                            "value": "콧대(자가진피)",
                          },
                          {
                            "display": "스케폴더",
                            "value": "스케폴더",
                          },
                          {
                            "display": "코끝(귀연골)",
                            "value": "코끝(귀연골)",
                          },
                          {
                            "display": "코끝(비중격)",
                            "value": "코끝(비중격)",
                          },
                          {
                            "display": "코끝(늑연골/갈비뼈)",
                            "value": "코끝(늑연골/갈비뼈)",
                          },
                          {
                            "display": "코끝조직축소(복코)",
                            "value": "코끝조직축소(복코)",
                          },
                          {
                            "display": "절개콧볼축소",
                            "value": "절개콧볼축소",
                          },
                          {
                            "display": "비절개콧볼축소",
                            "value": "비절개콧볼축소",
                          },
                          {
                            "display": "휜코교정(절골)",
                            "value": "휜코교정(절골)",
                          },
                          {
                            "display": "넓은코뼈교정(절골)",
                            "value": "넓은코뼈교정(절골)",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        hintWidget: Text('코 성형 종류를 선택해주세요! (중복가능)'),
                        initialValue: _myActivities_nose,
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _myActivities_nose = value;
                          });
                          Member_face_lifting.add(_myActivitiesResult_nose);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: MultiSelectFormField(
                        autovalidate: false,
                        chipBackGroundColor: Colors.red[200],
                        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.red[200],
                        checkBoxCheckColor: Colors.green,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "안면/윤곽",
                          style: TextStyle(fontSize: 16),
                        ),
                        dataSource: [
                          {
                            "display": "사각턱수술",
                            "value": "사각턱수술",
                          },
                          {
                            "display": "턱끝수술",
                            "value": "턱끝수술",
                          },
                          {
                            "display": "돌출입수술(ASO)",
                            "value": "돌출입수술(ASO)",
                          },
                          {
                            "display": "광대뼈축소술",
                            "value": "광대뼈축소술",
                          },
                          {
                            "display": "퀵광대",
                            "value": "퀵광대",
                          },
                          {
                            "display": "주걱턱",
                            "value": "주걱턱",
                          },
                          {
                            "display": "무턱",
                            "value": "무턱",
                          },
                          {
                            "display": "이마윤곽술",
                            "value": "이마윤곽술",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        hintWidget: Text('안면/윤곽 수술 종류를 선택해주세요! (중복가능)'),
                        initialValue: _myActivities_face,
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _myActivities_face = value;
                          });
                          Member_face_lifting.add(_myActivitiesResult_face);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: MultiSelectFormField(
                        autovalidate: false,
                        chipBackGroundColor: Colors.red[200],
                        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.red[200],
                        checkBoxCheckColor: Colors.green,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "지방흡입",
                          style: TextStyle(fontSize: 16),
                        ),
                        dataSource: [
                          {
                            "display": "얼굴 지방흡입",
                            "value": "얼굴 지방흡입",
                          },
                          {
                            "display": "팔뚝(팔) 지방흡입",
                            "value": "팔뚝(팔) 지방흡입",
                          },
                          {
                            "display": "겨드랑이 지방흡입",
                            "value": "겨드랑이 지방흡입",
                          },
                          {
                            "display": "브레지어 라인 지방흡입",
                            "value": "브레지어 라인 지방흡입",
                          },
                          {
                            "display": "옆구리살 지방흡입",
                            "value": "옆구리살 지방흡입",
                          },
                          {
                            "display": "상/하복부 지방흡입",
                            "value": "상/하복부 지방흡입",
                          },
                          {
                            "display": "엉덩이 지방흡입",
                            "value": "엉덩이 지방흡입",
                          },
                          {
                            "display": "허벅지 지방흡입",
                            "value": "허벅지 지방흡입",
                          },
                          {
                            "display": "무릎 지방흡입",
                            "value": "무릎 지방흡입",
                          },
                          {
                            "display": "종아리 지방흡입",
                            "value": "종아리 지방흡입",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        hintWidget: Text('지방 흡입수술 종류를 선택해주세요! (중복가능)'),
                        initialValue: _myActivities_liposuction,
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _myActivities_liposuction = value;
                          });
                          Member_face_lifting.add(_myActivitiesResult_liposuction);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: MultiSelectFormField(
                        autovalidate: false,
                        chipBackGroundColor: Colors.red[200],
                        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.red[200],
                        checkBoxCheckColor: Colors.green,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "가슴",
                          style: TextStyle(fontSize: 16),
                        ),
                        dataSource: [
                          {
                            "display": "가슴확대",
                            "value": "가슴확대",
                          },
                          {
                            "display": "가슴축소",
                            "value": "가슴축소",
                          },
                          {
                            "display": "유두수술",
                            "value": "유두수술",
                          },
                          {
                            "display": "유륜수술",
                            "value": "유륜수술",
                          },
                          {
                            "display": "처진가슴교정",
                            "value": "처진가슴교정",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        hintWidget: Text('가슴성형 종류를 선택해주세요! (중복가능)'),
                        initialValue: _myActivities_bust,
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _myActivities_bust = value;
                          });
                          Member_face_lifting.add(_myActivitiesResult_bust);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: MultiSelectFormField(
                        autovalidate: false,
                        chipBackGroundColor: Colors.red[200],
                        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.red[200],
                        checkBoxCheckColor: Colors.green,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "지방이식",
                          style: TextStyle(fontSize: 16),
                        ),
                        dataSource: [
                          {
                            "display": "풀페이스 지방이식",
                            "value": "풀페이스 지방이식",
                          },
                          {
                            "display": "광대 지방이식",
                            "value": "광대 지방이식",
                          },
                          {
                            "display": "턱끝 지방이식",
                            "value": "턱끝 지방이식",
                          },
                          {
                            "display": "눈 지방이식",
                            "value": "눈 지방이식",
                          },
                          {
                            "display": "엉덩이/골반 지방이식",
                            "value": "엉덩이/골반 지방이식",
                          },
                          {
                            "display": "가슴 지방이식",
                            "value": "가슴 지방이식",
                          },
                          {
                            "display": "이마 지방이식",
                            "value": "이마 지방이식",
                          },
                          {
                            "display": "콧대 지방이식",
                            "value": "콧대 지방이식",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        hintWidget: Text('지방이식 수술 종류를 선택해주세요! (중복가능)'),
                        initialValue: _myActivities_transplantation,
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _myActivities_transplantation = value;
                          });
                          Member_face_lifting.add(_myActivitiesResult_transplantation);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: MultiSelectFormField(
                        autovalidate: false,
                        chipBackGroundColor: Colors.red[200],
                        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.red[200],
                        checkBoxCheckColor: Colors.green,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "입술/인중",
                          style: TextStyle(fontSize: 16),
                        ),
                        dataSource: [
                          {
                            "display": "절개인중축소",
                            "value": "절개인중축소",
                          },
                          {
                            "display": "비절개인중축소",
                            "value": "비절개인중축소",
                          },
                          {
                            "display": "입술축소",
                            "value": "입술축소",
                          },
                          {
                            "display": "입술확대",
                            "value": "입술확대",
                          },
                          {
                            "display": "입꼬리수술",
                            "value": "입꼬리수술",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        hintWidget: Text('입술/인중 수술 종를 선택해주세요! (중복가능)'),
                        initialValue: _myActivities_lip,
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _myActivities_lip = value;
                          });
                          Member_face_lifting.add(_myActivitiesResult_lip);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: MultiSelectFormField(
                        autovalidate: false,
                        chipBackGroundColor: Colors.red[200],
                        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.red[200],
                        checkBoxCheckColor: Colors.green,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "실리프팅/거상",
                          style: TextStyle(fontSize: 16),
                        ),
                        dataSource: [
                          {
                            "display": "실리프팅",
                            "value": "실리프팅",
                          },
                          {
                            "display": "안면거상",
                            "value": "안면거상",
                          },
                          {
                            "display": "이마거상",
                            "value": "이마거상",
                          },
                          {
                            "display": "눈썹거상",
                            "value": "눈썹거상",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        hintWidget: Text('실리프팅/거상 수술 종를 선택해주세요! (중복가능)'),
                        initialValue: _myActivities_lifting,
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _myActivities_lifting = value;
                          });
                          Member_face_lifting.add(_myActivitiesResult_lifting);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: MultiSelectFormField(
                        autovalidate: false,
                        chipBackGroundColor: Colors.red[200],
                        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.red[200],
                        checkBoxCheckColor: Colors.green,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "보형물",
                          style: TextStyle(fontSize: 16),
                        ),
                        dataSource: [
                          {
                            "display": "귀족보형물",
                            "value": "귀족보형물",
                          },
                          {
                            "display": "무턱보형물",
                            "value": "무턱보형물",
                          },
                          {
                            "display": "이마보형물",
                            "value": "이마보형물",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        hintWidget: Text('보형물 수술 종류를 선택해주세요! (중복가능)'),
                        initialValue: _myActivities_prosthesis,
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _myActivities_prosthesis = value;
                          });
                          Member_face_lifting.add(_myActivitiesResult_prosthesis);
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: MultiSelectFormField(
                        autovalidate: false,
                        chipBackGroundColor: Colors.red[200],
                        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                        checkBoxActiveColor: Colors.red[200],
                        checkBoxCheckColor: Colors.green,
                        dialogShapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0))),
                        title: Text(
                          "필러",
                          style: TextStyle(fontSize: 16),
                        ),
                        dataSource: [
                          {
                            "display": "애교살필러",
                            "value": "애교살필러",
                          },
                          {
                            "display": "코필러",
                            "value": "코필러",
                          },
                          {
                            "display": "입술필러",
                            "value": "입술필러",
                          },
                          {
                            "display": "팔자주름필러",
                            "value": "팔자주름필러",
                          },
                          {
                            "display": "턱필러",
                            "value": "턱필러",
                          },
                          {
                            "display": "볼필러",
                            "value": "볼필러",
                          },
                          {
                            "display": "이마필러",
                            "value": "이마필러",
                          },
                          {
                            "display": "눈밑필러",
                            "value": "눈밑필러",
                          },
                          {
                            "display": "관자놀이필러",
                            "value": "관자놀이필러",
                          },
                          {
                            "display": "광대필러",
                            "value": "광대필러",
                          },
                          {
                            "display": "풀페이스필러",
                            "value": "풀페이스필러",
                          },
                        ],
                        textField: 'display',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        cancelButtonLabel: 'CANCEL',
                        hintWidget: Text('필러 시술 종를 선택해주세요! (중복가능)'),
                        initialValue: _myActivities_filler,
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _myActivities_filler = value;
                          });
                          Member_face_lifting.add(_myActivitiesResult_filler);
                         // Member_face_lifting = ListResult(Member_face_lifting);
                         // Member_face_lifting = _saveForm();
                        },
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('선택하신 성형 수술/시술 종류는\n'),
                      Text(Member_face_lifting.toString()),
                    ],
                  )
                    //child: Text('선택하신 성형 수술/시술 종류는\n' + Member_face_lifting.toString()),
                ),

                //   child: Text('선택하신 성형 수술/시술 종류는\n' + (_myActivitiesResult_eye.replaceAll('[', '')).replaceAll(']', '').replaceAll(',', '')
                //       + (_myActivitiesResult_nose.replaceAll('[', '')).replaceAll(']', '').replaceAll(',', '')
                //       + (_myActivitiesResult_face.replaceAll('[', '')).replaceAll(']', '').replaceAll(',', '')
                //       + (_myActivitiesResult_liposuction.replaceAll('[', '')).replaceAll(']', '').replaceAll(',', '')
                //       + (_myActivitiesResult_bust.replaceAll('[', '')).replaceAll(']', '' ).replaceAll(',', '')
                //       + (_myActivitiesResult_transplantation.replaceAll('[', '')).replaceAll(']', '').replaceAll(',', '')
                //       + (_myActivitiesResult_lip.replaceAll('[', '')).replaceAll(']', '').replaceAll(',', '')
                //       + (_myActivitiesResult_lifting.replaceAll('[', '')).replaceAll(']', '').replaceAll(',', '')
                //       + (_myActivitiesResult_prosthesis.replaceAll('[', '')).replaceAll(']', '').replaceAll(',', '')
                //       + (_myActivitiesResult_filler.replaceAll('[', '')).replaceAll(']', '').replaceAll(',', '') + ' 입니다 :)'),
                // ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: RaisedButton(
                    color: Colors.orange[200],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Text('저장하기'),
                    onPressed: () {
                      Member_face_lifting = _saveForm();
                      print(Member_face_lifting);
                      nextcheck = true;
                    }
                  ),
                ),
                if(nextcheck == true)
                  Container(
                    padding: EdgeInsets.only(top: 2),
                    child: RaisedButton(
                      child: Text('다음'),
                      color: Colors.orange[300],
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      onPressed:() {
                        Member_face_lifting == false;
                        if(Member_face_lifting.toString() != '[]'){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Hospital(MemberName: widget.MemberName, Member_face_lifting: Member_face_lifting, MemberId: widget.MemberId)));
                        } else if (Member_face_lifting.toString() != null){
                          showAlertDialog_select(context);
                        }
                      },
                    ),
                  ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListResult(Member_face_lifting) {
    List<String> face_lifting_result = [];

    for(int i=0; i<10; i++) {
      if(Member_face_lifting[i].toString() != '[]') {
        face_lifting_result.add(Member_face_lifting[i].toString());
      }
    }
    return face_lifting_result;
  }

  //선택된 수술 정보가 없을 시 수술 정보 선택에 대한 알림창 뜸
  void showAlertDialog_select(BuildContext context) async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('After Me'),
            content: Text("선택된 수술 정보가 없습니다.\n성형 시술/수술 종류를 선택해주세요 :)"),
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