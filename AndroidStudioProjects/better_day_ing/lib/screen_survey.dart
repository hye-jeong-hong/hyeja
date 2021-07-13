import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:better_day_ing/widget_candidate.dart';
import 'list_arrange.dart';
import 'model_survey.dart';

class surveyScreen extends StatefulWidget {
  List<Survey> surveys = [];

  List<String> answers = ['-1'];

  List<int> answers_int = [-1];

  List<Survey_result_list> survey_result_list = [];
  List<String> info;

  surveyScreen(
      {this.surveys, this.answers_int, this.answers, this.survey_result_list, this.info});

  @override
  _surveyScreenState createState() => _surveyScreenState();
}

class _surveyScreenState extends State<surveyScreen> {
  FocusNode textFocusNode;

  List<TextEditingController> TextController =
  List.generate(25, (i) => TextEditingController());

  @override
  void initState() {
    super.initState();

    textFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    textFocusNode.dispose();

    super.dispose();
  }

  @override
  List<bool> answerState = new List.generate(
      9, (i) => false); // 어떤 선택지가 사용되었는지에 대한 정보 (변수가 가진 선택지의 최대 개수로 지정할 것)

  SwiperController _controller = SwiperController();

  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    // print(widget.surveys.length);

    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          width: width * 0.85,
          child: Swiper(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              loop: false,
              itemCount: widget.surveys.length,
              itemBuilder: (BuildContext context, int index) {
                return _BuildSurveyCard(index, widget.surveys[index], width, height,
                    widget.survey_result_list[index]);
              }),
        ),
      ),
    );
  }

  Widget _BuildSurveyCard(
      int index,
      Survey surveys,
      double width,
      double height,
      Survey_result_list survey_result_list,
      ) {
    return Row(
      children: [
        Expanded(child: Container()),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding:
                  EdgeInsets.fromLTRB(0, width * 0.024, 0, width * 0.024),
                  child: Text(
                    'Q' + (index + 1).toString() + '.',
                    style: TextStyle(
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.8,
                  padding: EdgeInsets.only(top: width * 0.012),
                  child: AutoSizeText(
                    surveys.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: width * 0.048,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: width * 0.3),
                ),
                Column(
                    children: _buildCandidates(
                      width,
                      surveys,
                      surveys.candidates.length,
                      index,
                      answerState,
                      survey_result_list,
                      TextController[index],
                    )),
                Container(
                  padding: EdgeInsets.all(width * 0.024),
                  child: Center(
                    child: ButtonTheme(
                      minWidth: width * 0.5,
                      height: height * 0.05,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide.none,
                      ),
                      child: RaisedButton(
                        child: index == widget.surveys.length - 1
                            ? Text('결과보기')
                            : Text('다음'),
                        textColor: Colors.white,
                        color: Color.fromARGB(255, 43, 99, 247),
                        // onPressed: _answers[_currentIndex] == -1
                        //     ? null
                        //     : () {
                        onPressed: () {
                          print(index);
                          if (index == widget.surveys.length - 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => list_arrange(
                                        survey_result_list:
                                        widget.survey_result_list,
                                        info: widget.info
                                    )));
                          } else {
                            answerState = new List.generate(9, (i) => false);
                            _controller.next();
                          }
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
      ],
    );
  }

  List<Widget> _buildCandidates(
      double width,
      Survey surveys,
      int cand_len,
      int _current_index,
      List<bool> _answerState,
      Survey_result_list survey_result_list,
      TextEditingController TextController) {
    List<Widget> _children = [];

    if (cand_len != 1) {
      for (int i = 0; i < cand_len; i++) {
        _children.add(CandWidget(
          index: i,
          text: surveys.candidates[i],
          width: width,
          answerState: _answerState[i],
          tab: () {
            setState(() {
              for (int j = 0; j < cand_len; j++) {
                if (j == i) {
                  _answerState[j] = true;
                  survey_result_list.v_num = j.toString();
                } else {
                  _answerState[j] = false;
                }
              }
            });
          },
        ));
        _children.add(Padding(
          padding: EdgeInsets.all(width * 0.024),
        ));
      }
    } else {
      _children.add(
        Container(
          width: width * 0.5,
          height: width * 0.2,
          child: TextField(
            controller: TextController,
            focusNode: textFocusNode,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (text) {
              survey_result_list.v_num = (text);
            },
            autofocus: true,
            cursorColor: Colors.blueAccent,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent))),
          ),
        ),
      );
    }
    return _children;
  }
}