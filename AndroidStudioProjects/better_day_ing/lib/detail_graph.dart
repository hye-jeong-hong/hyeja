import 'dart:async';
import 'dart:convert'; // json 관련

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

import 'model_survey.dart';



class Radar extends StatefulWidget {


  @override

  List<String> info;
  List<Survey_result_list> survey_result_list;

  Radar(
      {
        this.survey_result_list,
        this.info,
      });

  _RadarState createState() => _RadarState();
}

class _RadarState extends State<Radar> {
  bool darkMode = false;
  bool useSides = false;
  double numberOfFeatures = 3;

  @override

  double bp_h_max;
  double bp_h_min;
  double chol_max;
  double chol_min;
  double glu_max;
  double glu_min;


  Widget build(BuildContext context) {
    var agenum = int.parse(widget.info[2]);
    const ticks = [25,50,75,100];
    //const ticks = [100,75,50,25];
    var features = ["        혈압", "콜레스테롤", "혈당 "];


    var data = [
      [
        (int.parse(widget.survey_result_list[1].v_num)/180*100).floor(), //180을 혈압 최고치로 설정 2
        (int.parse(widget.survey_result_list[3].v_num)/240*100).floor(), //240을 콜레스테롤 최고치로 설정  4
        (int.parse(widget.survey_result_list[4].v_num)/140*100).floor(), //140을 혈당 최고치로 설정 5
      ],
      [(120/180*100).floor(),(200/240*100).floor(),(99/140*100).floor()],
      [(60/180*100).floor(),(80/240*100).floor(),(40/140*100).floor()]

    ];



    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('세부 위험 요소'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 9.0),
                    child: Text(
                      '다음의 요소들은 췌장암 위험도에 영향을 미치는 요소입니다\n'
                          '본인의 수치와 수치의 평균을 비교해보세요\n',
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  /*
                  Text(
                    '세부 위험 요소입니다',
                    style: TextStyle(
                        color: darkMode ? Colors.white : Colors.black),
                  ),
                   */
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 330,
                child: RadarChart.light(
                  ticks: ticks,
                  data: data,
                  features: features,
                  reverseAxis: false,
                  useSides: useSides,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right:1.0, left: 10.0, bottom: 50),
                    child: Row(
                      children: [
                        Icon(Icons.brightness_1, size: 10, color: Colors.blue),
                        Text('각 수치의 평균 값'),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right:3.0, left: 10.0, bottom: 50),
                    child: Row(
                      children: [
                        Icon(Icons.brightness_1, size: 10, color: Colors.lightGreen),
                        Text(widget.info[0] + '님의 수치'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 2.0, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('   '+
                        (agenum - 5).toString() +
                            '세이상\n' +
                            (agenum + 5).toString() +
                            '세미만 평균',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          '위험 요소',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(widget.info[0] + '님의 수치',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          widget.info[8]
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 14.0, left: 30.0),
                        child: ButtonTheme(
                          minWidth: 110.0,
                          height: 40.0,
                          child: RaisedButton(
                            color: Colors.indigoAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              '혈압',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('혈압'),
                                      content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget> [
                                              Text('혈압이 높을 경우 동반질환으로'),
                                              Text('췌장암이 발생할 가능성이 높습니다\n\n'),
                                              Text('혈압 수치'),
                                              Text('120이상 140미만: 췌장암위험도 1.1증가'),
                                              Text('140이상: 췌장암위험도 1.21증가'),
                                            ],
                                          )
                                      ),
                                      actions: <Widget> [
                                        FlatButton(
                                          child: Text('ok'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  }
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(
                            widget.survey_result_list[1].v_num
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          widget.info[9]
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(top: 13.0, left:30.0),
                        child: ButtonTheme(
                          minWidth: 110.0,
                          height: 40.0,
                          child: RaisedButton(
                            color: Colors.indigoAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text('콜레스테롤',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('콜레스테롤'),
                                      content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget> [
                                              Text('콜레스테롤 지수의 상승은\n비만관련 암의 위험도 및\n췌장암의 위험도를 증가시킵니다\n\n'),
                                              Text('콜레스테롤 수치'),
                                              Text('200-239: 췌장암위험도 1.01증가'),
                                              Text('240이상: 췌장암위험도 1.13증가'),
                                            ],
                                          )
                                      ),
                                      actions: <Widget> [
                                        FlatButton(
                                          child: Text('ok'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  }
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(
                            widget.survey_result_list[3].v_num
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          widget.info[10]
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(top: 13.0, left:30.0),
                        child: ButtonTheme(
                          minWidth: 110.0,
                          height: 40.0,
                          child: RaisedButton(
                            color: Colors.indigoAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              '혈당',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('혈당'),
                                      content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget> [
                                              Text('공복혈당은 췌장암위험도를 발생시키는\n 위험인자이며 췌장암과 \n밀접한 관계가 있습니다\n\n'),
                                              Text('공복혈당 수치'),
                                              Text('100-125: 췌장암위험도 1.13증가'),
                                              Text('126이상 : 췌장암위험도 1.2증가'),
                                            ],
                                          )
                                      ),
                                      actions: <Widget> [
                                        FlatButton(
                                          child: Text('ok'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  }
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Text(
                            widget.survey_result_list[4].v_num
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('파란색버튼을 눌러 각 요소의 정보를 확인해보세요', style: TextStyle(fontSize: 11, color: Colors.indigo)),
                      ],
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
