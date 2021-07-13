import 'package:better_day_ing/screen_survey.dart';
import 'package:flutter/material.dart';
import 'package:better_day_ing/model_survey.dart';

class buttonScreen extends StatelessWidget {

  List<Survey> surveys = [];
  List<String> answers = [];
  List<int> answers_int =  [];
  List<Survey_result_list> survey_result_list = [];
  List<String> info;

  buttonScreen({this.surveys, this.answers, this.answers_int, this.survey_result_list, this.info});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;


    // survey 더미 데이터 만들기
    // List<Survey> surveys = [];




    return Scaffold(
      appBar: AppBar(
        title: Text('앱 이름'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
          ),
          Center(
            child: ButtonTheme(
                minWidth: width * 0.8,
                height: height * 0.20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  // side: BorderSide(color: Colors.lightBlue, width: 3)
                ),
                child: RaisedButton(
                  child: Text(
                    '문진표 작성하기',
                    style:
                    TextStyle(color: Colors.white, fontSize: width * 0.06),
                  ),
                  color: Color.fromARGB(255,43,99,247),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                surveyScreen(surveys: surveys,answers: answers, answers_int: answers_int, survey_result_list: survey_result_list, info:info)));
                    // builder: (context) => surveyScreen()));
                  },
                )),
          ),
          Container(
            padding: EdgeInsets.only(bottom: width * 0.05),
          ),
          // Center(
          //   child: ButtonTheme(
          //       minWidth: width * 0.8,
          //       height: height * 0.20,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(25),
          //           // side: BorderSide(color: Colors.lightBlue, width: 3)
          //       ),
          //       child: RaisedButton(
          //         child: Text(
          //           '기존결과 보기',
          //           style:
          //               TextStyle(color: Colors.white, fontSize: width * 0.06),
          //         ),
          //         color: Color.fromARGB(255,43,99,247),
          //         onPressed: () {
          //           Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => result_list()));
          //         },
          //       )),
          // ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}