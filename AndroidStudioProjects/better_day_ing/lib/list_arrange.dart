import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:better_day_ing/main.dart';
import 'package:better_day_ing/model_survey.dart';
// import 'package:pcrisk_app/result_list.dart';
import 'package:http/http.dart' as http;
import 'package:better_day_ing/result_tab.dart';

final gServerIp = 'http://172.17.117.17:5000/';

enum DataKind { NONE, ADD, MULTIPLY, FINISH }

class list_arrange extends StatefulWidget {
  List<Survey_result_list> survey_result_list;
  List<String> info;

  list_arrange({this.survey_result_list, this.info});


  @override
  _list_arrangeState createState() => _list_arrangeState();
}

class _list_arrangeState extends State<list_arrange> {
  @override
  Widget build(BuildContext context) {
    double risknum;
    int agnum;
    double cdf;
    double totcdf;
    int tonum;
    double bp_max;
    double bp_min;
    double chol_max;
    double chol_min;
    double glu_max;
    double glu_min;
    double bp_risk;
    double glu_risk;
    int bp_group, glu_group;
    String variable1;
    String variable2;
    // var risknum;
    // var agnum;
    // var totcdf;
    // var cdf;
    // var tonum;
    // var variable1;
    // var variable2;
    var var_list = [];
    String res_string;
    String pre_string1;
    String pre_string2;
    String pre_string3;
    String pre_string4;
    String final_string;
    var ab;
    DataKind mKind = DataKind.NONE;

    String mResult = '0'; // 서버로부터 수신한 덧셈 또는 곱셈 결과
    String mmm;
    String t0, t1, t2;
    String userage;
    List lll = [];
    //list_arrange({this.mResult});

    Future<String> postReply() async {
      var addr = gServerIp + ((mKind == DataKind.FINISH) ? 'finish' : 'none');
      var response = await http.post(addr, body: {'t0': t0, 'userage':userage});
      //'t1': survey_result_list[0],

      if (response.statusCode == 200) return response.body;

      throw Exception('데이터 수신 실패');
    }

    // @override
    // Widget build(BuildContext context) {
    if (widget.info[1] == '남성') {
      //widget.info.add(widget.survey_result_list[0].v_num.toString());
      //남자
      //AG -> AG_G1 (나이)
      if (int.parse(widget.survey_result_list[0].v_num) < 45)
        widget.survey_result_list[13].v_num = '0';
      else if (int.parse(widget.survey_result_list[0].v_num) < 50)
        widget.survey_result_list[13].v_num = '1';
      else if (int.parse(widget.survey_result_list[0].v_num) < 55)
        widget.survey_result_list[13].v_num = '2';
      else if (int.parse(widget.survey_result_list[0].v_num) < 60)
        widget.survey_result_list[13].v_num = '3';
      else if (int.parse(widget.survey_result_list[0].v_num) < 65)
        widget.survey_result_list[13].v_num = '4';
      else
        widget.survey_result_list[13].v_num = '5';

      //BP_H -> BH_H_G (혈압최고)
      if (int.parse(widget.survey_result_list[1].v_num) < 100)
        widget.survey_result_list[14].v_num = '0';
      else if (int.parse(widget.survey_result_list[1].v_num) <= 140)
        widget.survey_result_list[14].v_num = '1';
      else
        widget.survey_result_list[14].v_num = '2';

      //BP_L -> BP_L_G (혈압최저)
      if (int.parse(widget.survey_result_list[2].v_num) < 60)
        widget.survey_result_list[15].v_num = '0';
      else if (int.parse(widget.survey_result_list[2].v_num) <= 90)
        widget.survey_result_list[15].v_num = '1';
      else
        widget.survey_result_list[15].v_num = '2';

      //CHOL -> CHOL_G (콜레스테롤)
      print('chol_g' + widget.survey_result_list[16].variable);
      if (int.parse(widget.survey_result_list[3].v_num) < 200)
        widget.survey_result_list[16].v_num = '0';
      else if (int.parse(widget.survey_result_list[3].v_num) < 240)
        widget.survey_result_list[16].v_num = '1';
      else
        widget.survey_result_list[16].v_num = '2';

      //GLU -> GLU_G (혈당)
      print('glu' + widget.survey_result_list[17].variable);
      if (int.parse(widget.survey_result_list[4].v_num) < 126)
        widget.survey_result_list[17].v_num = '0';
      else
        widget.survey_result_list[17].v_num = '1';

      //GM_GTP -> GM_GTP_G
      print('gm_gtp' + widget.survey_result_list[18].variable);
      if (int.parse(widget.survey_result_list[5].v_num) < 50)
        widget.survey_result_list[18].v_num = '0';
      else
        widget.survey_result_list[18].v_num = '1';

      //HGT -> HGT_G
      print('hgt' + widget.survey_result_list[19].variable);
      if (int.parse(widget.survey_result_list[6].v_num) <= 151)
        widget.survey_result_list[19].v_num = '0';
      else if (int.parse(widget.survey_result_list[6].v_num) <= 155)
        widget.survey_result_list[19].v_num = '1';
      else if (int.parse(widget.survey_result_list[6].v_num) <= 158)
        widget.survey_result_list[19].v_num = '2';
      else
        widget.survey_result_list[19].v_num = '3';
    } else {
      //여자
      //AG -> AG_G (나이)

      print('AG ' + widget.survey_result_list[17].variable);

      if (30 <= int.parse(widget.survey_result_list[0].v_num) &&
          int.parse(widget.survey_result_list[0].v_num) < 35)
        widget.survey_result_list[17].v_num = '0';
      else if (int.parse(widget.survey_result_list[0].v_num) < 40)
        widget.survey_result_list[17].v_num = '1';
      else if (int.parse(widget.survey_result_list[0].v_num) < 45)
        widget.survey_result_list[17].v_num = '2';
      else if (int.parse(widget.survey_result_list[0].v_num) < 50)
        widget.survey_result_list[17].v_num = '3';
      else if (int.parse(widget.survey_result_list[0].v_num) < 55)
        widget.survey_result_list[17].v_num = '4';
      else if (int.parse(widget.survey_result_list[0].v_num) < 60)
        widget.survey_result_list[17].v_num = '5';
      else if (int.parse(widget.survey_result_list[0].v_num) < 65)
        widget.survey_result_list[17].v_num = '6';
      else if (int.parse(widget.survey_result_list[0].v_num) < 70)
        widget.survey_result_list[17].v_num = '7';
      else if (int.parse(widget.survey_result_list[0].v_num) < 75)
        widget.survey_result_list[17].v_num = '8';
      else
        widget.survey_result_list[17].v_num = '9';

      //BMI -> BMI_G
      print('BMI ' + widget.survey_result_list[18].variable);
      if (int.parse(widget.survey_result_list[1].v_num) < 18.5)
        widget.survey_result_list[18].v_num = '0';
      else if (int.parse(widget.survey_result_list[1].v_num) < 23)
        widget.survey_result_list[18].v_num = '1';
      else if (int.parse(widget.survey_result_list[1].v_num) < 25)
        widget.survey_result_list[18].v_num = '2';
      else
        widget.survey_result_list[18].v_num = '3';

      //BP_H -> BH_H_G (혈압최고)
      print('BP_H ' + widget.survey_result_list[19].variable);
      if (int.parse(widget.survey_result_list[2].v_num) < 100)
        widget.survey_result_list[19].v_num = '0';
      else if (int.parse(widget.survey_result_list[2].v_num) <= 140)
        widget.survey_result_list[19].v_num = '1';
      else
        widget.survey_result_list[19].v_num = '2';

      //BP_L -> BP_L_G (혈압최저)
      print('BP_L ' + widget.survey_result_list[20].variable);
      if (int.parse(widget.survey_result_list[3].v_num) < 60)
        widget.survey_result_list[20].v_num = '0';
      else if (int.parse(widget.survey_result_list[3].v_num) <= 90)
        widget.survey_result_list[20].v_num = '1';
      else
        widget.survey_result_list[20].v_num = '2';

      //CHOL -> CHOL_G (콜레스테)
      print('CHOL ' + widget.survey_result_list[21].variable);
      if (int.parse(widget.survey_result_list[4].v_num) < 200)
        widget.survey_result_list[21].v_num = '0';
      else if (int.parse(widget.survey_result_list[4].v_num) < 240)
        widget.survey_result_list[21].v_num = '1';
      else
        widget.survey_result_list[21].v_num = '2';

      //GLU -> GLU_G2 (혈당)
      print('GLU_G2 ' + widget.survey_result_list[22].variable);
      if (int.parse(widget.survey_result_list[8].v_num) < 140)
        widget.survey_result_list[22].v_num = '0';
      else
        widget.survey_result_list[22].v_num = '1';

      //GM_GTP -> GM_GTP_G
      print('GM_GTP ' + widget.survey_result_list[23].variable);
      if (int.parse(widget.survey_result_list[9].v_num) < 50)
        widget.survey_result_list[23].v_num = '0';
      else
        widget.survey_result_list[23].v_num = '1';

      //HGT -> HGT_G
      print('HGT ' + widget.survey_result_list[24].variable);
      if (int.parse(widget.survey_result_list[10].v_num) <= 151)
        widget.survey_result_list[24].v_num = '0';
      else if (int.parse(widget.survey_result_list[10].v_num) <= 155)
        widget.survey_result_list[24].v_num = '1';
      else if (int.parse(widget.survey_result_list[10].v_num) <= 158)
        widget.survey_result_list[24].v_num = '2';
      else
        widget.survey_result_list[24].v_num = '3';
    }

    // DB로

    /*
    <DB에서 flutter로 받는 data>

    위험도:
      사용자 나이대의 최저, 최고, 평균 위험도(남자, 여자 따로 나이대별 위험도를 구할지는 아직 결정하지 못함.)
      사용자의 위험도


      세부위험요소: 각 변수를 하나씩 줄였을 때 나타나는 위험도, 원래 위험도와의 차이
        남자
          BP_H, BP_H_G 혈압최고
          BP_L, BP_L_G 혈압최저
          CHOL, CHOL_G 콜레스테롤
          GLU, GLU_G2 혈당
          GM_GTP, GM_GTP_G 감마지티피

        여자
          BMI,BMI_G 체질량지수 분류
          BP_H, BP_H_G 혈압최고
          BP_L, BP_L_G 혈압최저
          CHOL, CHOL_G 콜레스테롤
          FT 비만도
          GLU, GLU_G2 혈당
          GM_GTP, GM_GTP_G 감마지티피
          SM_STT 흡연 -> 2에서 1로 바뀌는 것만 의미가 있음 (0: 피우지않는다 1: 과거에 피웠으나 지금은 끊었다 2: 현재도 피운다)
          SR_GPT_B 혈청지피티 분류2

     */

    List<int> risk = []; //최저, 최고, 평균 위험도
    int myRisk = 0; // 사용자 위험도

    List<String> rank_variable = []; //변수별 위험도 순위
    List<int> rank_v_risk = []; //순위에 따른 변수의 위험도

    // 작성된 문진표 출력
    for (int i = 0; i < widget.survey_result_list.length; i++) {
      print(widget.survey_result_list[i].variable +
          ": " +
          widget.survey_result_list[i].v_num);
    }
    for (int i = 0; i < widget.survey_result_list.length; i++) {
      String jsonSurvey = jsonEncode(widget.survey_result_list[i]);
      //print(widget.survey_result_list[i].toString());
      print(jsonSurvey);
    }
    //String jjj = jsonEncode(widget.survey_result_list[0]);
    t0 = jsonEncode(widget.survey_result_list);
    widget.info.add(widget.survey_result_list[0].v_num.toString());

    //String test = '20';
    //t2 = 'kjk';
    userage = widget.survey_result_list[0].v_num.toString();

    mKind = DataKind.FINISH;
    //widget.info.add(widget.survey_result_list[0].toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('췌장암 위험도 예측',),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FutureBuilder(
                  future: postReply().then((recvd) => mResult = recvd),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    try{
                      mmm = mResult.toString();
                      Map<String, dynamic> dic = jsonDecode(mmm);
                      // Map<String, dynamic> dic = jsonDecode(mmm);
                      //map<>값을 int에 대입하려고해서

                      print('mResult: ' + mResult);
                      //print(mResult[3]);
                      res_string = mResult.toString().trim();
                      print('res_string: '+res_string);
                      pre_string1 = res_string.replaceAll(('\"'), '');
                      pre_string2 = pre_string1.replaceAll(('{'), "");
                      pre_string3 = pre_string2.replaceAll(('}'), "");
                      pre_string4 = pre_string3.replaceAll((' '), "");
                      final_string = pre_string4.replaceAll((':'), ',');
                      ab = final_string.split(',');
                      //print(ab[3]);
                      variable1 = ab[2];
                      variable2 = ab[4];
                      print('risk: ${dic['risk']}');
                      risknum = dic['risk'].toDouble();
                      //risknum = double.parse(dic['risk']);
                      agnum = dic['agnum'];
                      widget.info.add(risknum.toString());
                      print('variabl1: '+variable1+', variable2: '+variable2);
                      print('agnum::: '+agnum.toString());
                      widget.info.add(agnum.toString()); //array 4
                      totcdf = dic['totcdf'].toDouble();
                      widget.info.add(totcdf.toString());
                      cdf = dic['cdf'].toDouble();
                      widget.info.add(cdf.toString());
                      tonum = dic['tonum'];
                      widget.info.add(tonum.toString()); //array 7
                      bp_max = dic['bp_h_max'].toDouble();
                      widget.info.add(bp_max.toString()); //8
                      chol_max = dic['chol_max'].toDouble();
                      widget.info.add(chol_max.toString()); //9
                      glu_max = dic['glu_max'].toDouble();
                      widget.info.add(glu_max.toString()); //10
                      // widget.info.add('0'); //11
                      // widget.info.add('1'); //12
                      // widget.info.add('2'); //13
                      bp_risk = dic['bp_risk'].toDouble();
                      widget.info.add(bp_risk.toString()); //11
                      bp_group = dic['bp_group'];
                      widget.info.add(bp_group.toString()); //12
                      glu_risk = dic['glu_risk'].toDouble();
                      widget.info.add(glu_risk.toString()); //13
                      glu_group = dic['glu_group'];
                      widget.info.add(glu_group.toString()); //14
                      print('info array: '+ widget.info.toString());
                      int infolen = widget.info.length;
                      for (int i=0; i<infolen; i++) {
                        print('info array $i: '+ widget.info[i]);
                      }
                    }
                    catch (e){
                      print('waiting..');
                    }

                    //var_list = console.log(Object.values(mResult));

                    if (snapshot.hasData == false) {
                      //return CircularProgressIndicator();
                      return Container(
                        child: Column(
                          children: <Widget>[
                            Text('췌장암 위험도를 예측하는 중입니다...\n', style: TextStyle(fontSize: 17),),
                            CircularProgressIndicator()
                          ],
                        ),
                      );
                    } else {
                      return Center(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Text('췌장암 예측 위험도를 확인해보세요!\n', style: TextStyle(fontSize: 17),),
                                Container(
                                  width: 180,
                                  height: 100,
                                  child: RaisedButton(
                                      child: Text('결과보기', style: TextStyle(fontSize: 20, color: Colors.white),),
                                      color: Colors.indigoAccent,
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50)),
                                      onPressed: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) => ResultTab(
                                              risknum: risknum,
                                              variable1: variable1,
                                              variable2: variable2,
                                              survey_result_list: widget.survey_result_list,
                                              info: widget.info,
                                              cdf: cdf,
                                              totcdf: totcdf,
                                            )));
                                      }),
                                )
                              ],
                            ),
                          ));
                    }
                  },
                )
              ],
            ),
          )),
    );
  }
}