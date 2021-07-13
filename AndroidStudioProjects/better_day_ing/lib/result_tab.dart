import 'package:better_day_ing/risk_factor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:better_day_ing/model_survey.dart';
import 'package:better_day_ing/quit_smoke.dart';
import 'package:better_day_ing/risk_position.dart';
import 'risk_val2_position.dart';
import 'risk_val_position.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart';
import 'model_survey.dart';
import 'detail_graph.dart';

class UrlLauncher {
  /*
  final Uri EMAIL = Uri(
      scheme: 'mailto',
      path: 'jaesungdev@gmail.com',
      queryParameters: {'subject': '문의드립니다', 'body': '개발자님 안녕하세요'}
  );
  */

  static const CALL = 'tel://01080805801';
  static const SMS = 'sms:01080805801';

  void launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void call() async {
    if (await canLaunch(CALL)) {
      await launch(CALL);
    } else {
      throw 'error call';
    }
  }

  void sms() async {
    if (await canLaunch(SMS)) {
      await launch(SMS);
    } else {
      throw 'error sms';
    }
  }
/*
  void email() async {
    if (await canLaunch(EMAIL.toString())) {
      throw 'error email';
    } else {
      throw 'error email';
    }
  }

   */
}

class ResultTab extends StatefulWidget {
  @override
  double risknum;
  String variable1;
  String variable2;
  List<Survey_result_list> survey_result_list = [];
  List<String> info;
  double cdf;
  double totcdf;

  ResultTab(
      {this.risknum,
        this.variable1,
        this.variable2,
        this.survey_result_list,
        this.info,
        this.cdf,
        this.totcdf});

  _ResultTabState createState() => _ResultTabState();
}


//final gServerIp = 'http://172.17.120.93:5000/';

class _ResultTabState extends State<ResultTab> {
  List<String> val_list = List<String>(3);
  List<String> val_good = List<String>(3);
  List<String> habit_f = List<String>(3);
  List<String> habit_e = List<String>(3);
  //var val_list = [];
  final var1 = '흡연';
  final var2 = '혈당';
  final var3 = '';
  //final smoking
  final smoking = '흡연은 급성췌장염과 만성췌장염의 발병 위험을 모두 높입니다. '
      '연구 결과에 따르면 담배를 많이 피우는 사람일수록 췌장암 발병 위험도 함께 높아졌고, '
      '전체 췌장암 발병 케이스의 약 46% 가량이 흡연이 원인인 것으로 추정되었습니다.\n'
      '흡연은 췌장암 발병의 제 1의 원인입니다. 흡연자가 췌장암에 걸릴 확률은 비흡연자에 비해 2~4배 높습니다.';

  final glucose = '췌장암 환자를 분석한 결과, 발생 위험을 2배 이상 증가시킨 주요 요인은 \'높은 공복혈당\'으로 나타났습니다.\n'
      '100mg/dL미만을 기준으로 할 때, 공복혈당이 100~125이면 췌장암 위험이 1.42배, 126이상이면 '
      '2.07배로 증가했습니다.';

  final bp = '연구 결과에 따르면 혈압이 정상치보다 높을 때 최대 1.85배까지 췌장암 발병 위험을 높입니다.\n'
      '정상 혈압은 수축기 혈압 90~120mmHg, 이완기 혈압 60~80mmHg입니다.\n';

  final glucose_habit_f = '<식단>\n'
      '- 시금치, 케일, 상추 등의 녹색잎 채소\n'
      '- 잡곡밥과 통곡물\n'
      '- 불포화지방산 함량이 높은 등푸른 생선\n';

  final glucose_habit_e = '<운동>\n'
      '- 가볍게 20분 정도의 산책\n'
      '- 근육운동도 병행\n';
  final bp_habit = '<식단>\n'
      '- 나트륨 섭취 줄이기\n'
      '- 칼륨 섭취 (바나나, 오렌지, 토마토, 참치, 견과류 등)\n'
      '- 카페인 섭취 줄이기\n'
      '<운동>\n'
      '- 규칙적으로 걷기\n'
      '- 요가나 명상 등으로 스트레스 관리\n';
  final good = '좋아요! 계속해서 지금의 생활습관을 유지하세요!\n';



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    var risk_res = widget.risknum;
    var risk_bp = double.parse(widget.info[11]);
    var risk_glu = double.parse(widget.info[13]);
    var agenum = int.parse(widget.info[2]);
    var cdfnum = widget.cdf;
    var totalCdf = widget.totcdf;
    var tonum = int.parse(widget.info[7]);
    String habit_glu = '';
    String habit_bp = '';
    val_list[0] = smoking;
    val_list[1] = glucose;
    val_list[2] = bp;
    val_good[0] = good;


    if (widget.info[14] == '0') {
      habit_f[1] = good+'\n\n'+glucose_habit_f;
      habit_e[1] = glucose_habit_e;

      Image.asset('images/glu_better_1.png');
    } else {
      //habit[1] = glucose_habit;
      Image.asset('images/glu_better_1.png');
    }
    if (widget.info[12] == '0') {
      //habit[2] = good+'\n\n'+glucose_habit;
      Image.asset('images/glu_better_1.png');
    } else {
      //habit[2] = bp_habit;
      Image.asset('images/glu_better_1.png');
    }


    return
      //SingleChildScrollView(
      DefaultTabController(
        child: Scaffold(
          appBar: AppBar(
            title: Text('췌장암 예측 결과'),
            backgroundColor: Colors.blueAccent,
            bottom: TabBar(
              tabs: [
                Tab(text: '위험도',),
                Tab(text: '행동개선방안'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Align(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 17.0),
                            child: Container(
                              child: Text(
                                widget.info[0] +
                                    '님의 5년안에 췌장암 발생 위험도는\n' +
                                    risk_res.toString() +
                                    '% 입니다\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            //padding: EdgeInsets.only(bottom: width * 0.5),
                            height: 1.0,
                            width: width * 0.75, //320.0,
                            color: Colors.deepPurple,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: width * 0.05), //20
                            child: Text(
                              widget.info[0] +
                                  '님의 췌장암 발생 위험도는\n' +
                                  (agenum - 5).toString() +
                                  '세 이상 ' +
                                  (agenum + 5).toString() +
                                  '세 미만 ' +
                                  widget.info[1] +
                                  ' ' +
                                  widget.info[4] +
                                  '명 중\n' +
                                  '상위 ' +
                                  (cdfnum * 100).toString() +
                                  '%입니다\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 50.0),
                          // ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: risk_position(
                              survey_result_list: widget.survey_result_list,
                              cdfnum: cdfnum,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Image.asset('images/graph.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 60), //20
                            child: Text(
                              '30세 이상 ' +
                                  '80세 이하 ' +
                                  widget.info[1] +
                                  ' ' +
                                  tonum.toString() +
                                  '명 중\n' +
                                  '상위 ' +
                                  (totalCdf * 100).toString() +
                                  '%입니다\n',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: risk_position(
                              survey_result_list: widget.survey_result_list,
                              cdfnum: totalCdf,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Image.asset('images/graph.png'),
                          ),
                          //SizedBox(height: 10.0),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: Text(
                                widget.info[0] + '님\n조기검진으로 췌장암을 예방하세요!\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 180,
                            child: RaisedButton(
                              child: Text(
                                '지금 바로\n암 검진 예약하러가기\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15),
                              ),
                              color: Colors.indigoAccent,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              onPressed: UrlLauncher().call,
                              padding: EdgeInsets.only(top: 10.0),
                            ),
                          ),
                          //onPressed: () => MyHomePage(),
                        ],
                      ),
                    ),
                  )),
              Align(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 35.0),
                    //child: Center(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0),
                          child: Text(
                            '췌장암 위험도를 줄이기 위한\n' + widget.info[0] + '님의 행동 개선 방안입니다\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: width * 0.9),
                          height: 1.0,
                          width: 300.0,
                          color: Colors.deepPurple,
                        ),
                        //Padding(padding: const EdgeInsets.all(10.0)),
                        Container(
                          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20),
                          padding: const EdgeInsets.all(15.0),
                          color: Colors.blue[100],
                          child: Column(
                            children: <Widget>[
                              Text('흡연\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                  textAlign: TextAlign.right),
                              Text(
                                '$smoking',
                                style: TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20),
                          padding: const EdgeInsets.all(15.0),
                          color: Colors.blue[100],
                          child: Column(
                            children: <Widget>[
                              Text('$var2\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),),
                              Text(
                                '$glucose',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text('\n$var2을 위한 생활습관\n',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                  textAlign: TextAlign.right),
                              Text(
                                '${habit_f[1]}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                '${habit_e[1]}',
                                style: TextStyle(fontSize: 16),
                              ),
                              risk_val_position(
                                survey_result_list: widget.survey_result_list,
                                cdfnum: cdfnum,
                              ),
                              Container(
                                height: 3.0,
                                width: 300.0,
                                color: Colors.deepPurple,
                              ),
                              risk_val2_position(
                                survey_result_list: widget.survey_result_list,
                                cdfnum: risk_glu,
                              ),
                              Text('\n현재 위험도: '+risk_res.toString()+' 혈당 줄이면 위험도: '+risk_bp.toString())
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20),
                          padding: const EdgeInsets.all(15.0),
                          color: Colors.blue[100],
                          child: Column(
                            children: <Widget>[
                              Text('혈압\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                              Text('$bp', style: TextStyle(fontSize: 16),),
                              Text('\n혈압을 위한 생활습관\n',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                  textAlign: TextAlign.right),
                              Text('${habit_f[2]}', style: TextStyle(fontSize: 16),)
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(10.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //SizedBox(height: 0,),
                            SizedBox(
                              width: 130,
                              height: 50,
                              child: Padding(
                                //padding: const EdgeInsets.only(left: 190.0, top: 420.0),
                                padding: const EdgeInsets.only(right: 20.0),
                                child: RaisedButton(
                                  child: Text('금연'),
                                  color: Colors.indigoAccent,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                quit_smoking()));
                                  },
                                  padding: EdgeInsets.only(bottom: 2),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 130,
                              height: 50,
                              child: Padding(
                                //padding: const EdgeInsets.only(left: 190.0, top: 420.0),
                                padding: const EdgeInsets.only(left: 1.0),
                                child: RaisedButton(
                                  child: Text('세부위험요소 보기'),
                                  color: Colors.indigoAccent,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => risk_factor(
                                              survey_result_list: widget
                                                  .survey_result_list,
                                              info: widget.info,
                                            )));
                                  },
                                  padding: EdgeInsets.only(bottom: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //),
                  ),
                ),
              ),
            ],
          ),
        ),
        length: 2,
      );
  }
}