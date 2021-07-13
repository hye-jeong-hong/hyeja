import 'package:flutter/material.dart';
import 'package:better_day_ing/risk_position.dart';
import 'package:better_day_ing/risk_val_position.dart';
import 'factor_position.dart';
import 'model_survey.dart';
import 'list_arrange.dart';

class risk_factor extends StatefulWidget {
  @override
  List<String> info;
  List<Survey_result_list> survey_result_list;

  risk_factor({this.info, this.survey_result_list});

  _risk_factorState createState() => _risk_factorState();
}

class _risk_factorState extends State<risk_factor> {
  // List<String> button_name = List<String>(3);
  // List<String> button_txt = List<String>(3);
  // List<String> graph_list = List<String>(3);
  // List<String> normal_num = List<String>(3);
  List<double> num_list = List<double>(5);
  // double num1 = 130;
  // double num2 = 100;
  // double num3 = 88;

  final glu_txt = '공복혈당은 췌장암위험도를 발생시키는\n 위험인자이며 췌장암과 \n밀접한 관계가 있습니다\n\n'
      '공복혈당 수치\n'
      '100-125: 췌장암위험도 1.13증가\n'
      '126이상 : 췌장암위험도 1.2증가';
  final bp_h_txt = '혈압이 높을 경우 동반질환으로 췌장암이 발생할 가능성이 높습니다\n\n'
      '혈압 수치\n'
      '120이상 140미만: 췌장암위험도 1.1증가\n'
      '140이상: 췌장암위험도 1.21증가';
  final chol_txt = '콜레스테롤 지수의 상승은\n비만관련 암의 위험도 및\n췌장암의 위험도를 증가시킵니다\n\n'
      '콜레스테롤 수치\n'
      '200-239: 췌장암위험도 1.01증가\n'
      '240이상: 췌장암위험도 1.13증가';
  final gtp_txt = '감마지티피는 음주에\n 영향을 받는 요소이며\n 감마지티피의 수치는\n 췌장암 발생과 밀접한 관련이있습니다';
  final bmi_txt = 'BMI가 30이상에서는\n 췌장암의 상대 위험도가\n 14.7미만으로 높으며\n BMI가 5씩 증가할 때마다\n 췌장암 위험도가 10%씩 증가합니다\n';



  @override

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;

    var cdfnum = 0.05;
    num_list[0] = 50; //int.parse(widget.info[32]).toDouble();
    num_list[1] = 60; //int.parse(widget.info[33]).toDouble();
    num_list[2] = 70; //int.parse(widget.info[34]).toDouble();
    num_list[3] = 80;
    num_list[4] = 10;


    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('건강 요소 수치'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: width*0.05, bottom: width*0.03),
                child: Text(
                  '다음은 췌장암 위험도에 영향을 미친 상위 3개 요소입니다.\n'
                      '본인의 건강 수치를 확인해 보세요',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),),
              ),
              Container(
                height: 1.0,
                width: width * 0.75, //320.0,
                color: Colors.deepPurple,
              ),
              SizedBox(height: width*0.08,),
              Container(
                width: 110,
                height: 50,
                child: RaisedButton(
                  color: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text('혈압', style: TextStyle(fontSize: 18, color: Colors.white),),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('혈압'),
                            content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget> [
                                    Text(bp_h_txt),
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
              Container(
                padding: EdgeInsets.only(top: width*0.05),
                alignment: Alignment.centerLeft,
                child: factor_position(
                  survey_result_list: widget.survey_result_list,
                  num: num_list[0],
                  valname: '혈압',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 8),
                child: Image.asset('images/BP_H.png'),
              ),
              Text('정상범위는 '+'수축기혈압 120mmHg미만, 이완기혈압 80mmHg미만', textAlign: TextAlign.left, style: TextStyle(fontSize: 12),),
              SizedBox(height: width*0.2,),
              Container(
                width: 110,
                height: 50,
                child: RaisedButton(
                  color: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text('혈당', style: TextStyle(fontSize: 18, color: Colors.white),),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('혈당'),
                            content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget> [
                                    Text(glu_txt),
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
              Container(
                padding: EdgeInsets.only(top: width*0.05),
                alignment: Alignment.centerLeft,
                child: factor_position(
                  survey_result_list: widget.survey_result_list,
                  num: num_list[1],
                  valname: '혈당',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 8),
                child: Image.asset('images/GLU.jpg'),
              ),
              Text('정상범위는 '+'공복혈당 100mg/dL 미만', textAlign: TextAlign.left, style: TextStyle(fontSize: 12),),
              SizedBox(height: width*0.2,),
              Container(
                width: 120,
                height: 50,
                child: RaisedButton(
                  color: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text('콜레스테롤', style: TextStyle(fontSize: 18, color: Colors.white),),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('콜레스테롤'),
                            content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget> [
                                    Text(chol_txt),
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
              Container(
                padding: EdgeInsets.only(top: width*0.05),
                alignment: Alignment.centerLeft,
                child: factor_position(
                  survey_result_list: widget.survey_result_list,
                  num: num_list[2],
                  valname: '콜레스테롤',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 8),
                child: Image.asset('images/CHOL.jpg'),
              ),
              Text('정상범위는 '+'130mg/dL 미만', textAlign: TextAlign.left, style: TextStyle(fontSize: 12),),
              SizedBox(
                height: width*0.2,
              ),
              Container(
                width: 120,
                height: 50,
                child: RaisedButton(
                  color: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text('감마지티피', style: TextStyle(fontSize: 18, color: Colors.white),),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('감마지티피'),
                            content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget> [
                                    Text(gtp_txt),
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
              Container(
                child: Container(
                  padding: EdgeInsets.only(top: width * 0.05),
                  alignment: Alignment.centerLeft,
                  child: factor_position(
                    survey_result_list: widget.survey_result_list,
                    num: num_list[3],
                    valname: '감마지티피',
                  ),
                ),
              ),
              if(widget.info[1] == '남성')
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 8),
                  child: Column(
                    children: [
                      Image.asset('images/GM_GTP_M.jpg'),
                      Container(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text('정상범위는 ' + '11U/L이상 63U/L미만', textAlign: TextAlign.left, style: TextStyle(fontSize: 12),),
                      ),
                    ],
                  ),
                ),
              if(widget.info[1] == '여성')
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 8),
                  child: Column(
                    children: [
                      Image.asset('images/GM_GTP_F.png'),
                      Container(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text('정상범위는 ' + '8U/L이상 35U/L미만', textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12),),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: width * 0.2,
              ),
              if(widget.info[1] == '여성')
                Column(
                  children: [
                    Container(
                      child: Container(
                        width: 110,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text('BMI', style: TextStyle(fontSize: 18, color: Colors.white),),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('BMI'),
                                    content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget> [
                                            Text(bmi_txt),
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
                    Container(
                      padding: EdgeInsets.only(top: width*0.05),
                      alignment: Alignment.centerLeft,
                      child: factor_position(
                        survey_result_list: widget.survey_result_list,
                        num: num_list[4],
                        valname: 'BMI',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 8),
                      child: Image.asset('images/BMI.png'),
                    ),
                    Text('정상범위는 '+'18.5이상 25미만', textAlign: TextAlign.left, style: TextStyle(fontSize: 12),),
                    SizedBox(
                      height: width*0.2,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}