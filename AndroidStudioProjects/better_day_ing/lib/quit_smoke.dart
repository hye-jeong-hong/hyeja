import 'package:flutter/material.dart';
import 'package:better_day_ing/piechart.dart';
import 'dart:math';

class quit_smoking extends StatefulWidget {
  @override

  _quit_smokingState createState() => _quit_smokingState();
}

class _quit_smokingState extends State<quit_smoking> {
  final _totalFieldController = TextEditingController();

  List _messages = [
    '8시간만 금연을 해도 혈액 속 일산화탄소량이 정상으로 떨어지고, 혈액 속 산소량이 정상으로 돌아갑니다.',
    '2주~3개월 이상 금연 시 혈액순환, 폐 기능이 향상됩니다.',
    '1~9개월 이상 금연 시 기침, 호흡곤란 등이 감소하고 폐의 감염위험이 감소합니다.',
    '2~5년 이상 금연 시, 뇌졸중 걸릴 위험이 비흡연자와 같은 수준으로 줄어듭니다.',
    '5년 이상 금연 시, 구강암, 후두암, 식도암, 방광암 위험이 절반으로 감소합니다.'
  ];
  int total = 40;
  int _smoked = 0;
  int _craved = 0;
  int saved = 9000;
  int randNum = Random().nextInt(4); //5

  void _smokedCounter() {
    setState(() {
      _smoked++;
      saved = saved - 225;
    });
  }

  void _cravedCounter() {
    setState(() {
      _craved++;
    });
  }

  void _savedCounter() {
    setState(() {
      saved = saved - 225;
    });
  }

  @override
  Widget build(BuildContext context) {

    var _totalField = TextField(
      controller: _totalFieldController,
      decoration: InputDecoration(
        labelText: '개수',
        //hintText: '하루에 피는 담배 개수를 입력해주세요',
        border: OutlineInputBorder(),
      ),
      onChanged: (text) {
        print(text);
      },
    );

    //var _changeButton = RaisedButton(onPressed: null)

    return Scaffold(
      appBar: AppBar(
        title: Text('우리 이제 금연해요'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Text(
                    '',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: CustomPaint(
                  size: Size(300, 300),
                  painter: Piechart(percentage: _smoked, total: total),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Column(
                      children: <Widget>[
                        makeText('$_smoked'),
                        Icon(
                          Icons.smoking_rooms,
                          size: 45,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        makeText('$_craved'),
                        Icon(
                          Icons.emoji_emotions_outlined,
                          size: 45,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        makeText('₩$saved'),
                        Icon(
                          Icons.monetization_on_outlined,
                          size: 45,
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text('Quit Smoking'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 15.0),
              child: Center(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 60,
                      child: RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '피고왔어요',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        onPressed: _smokedCounter,
                        color: Colors.indigoAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 60,
                      child: RaisedButton(
                          padding: const EdgeInsets.all(10.0),
                          color: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          child: Text(
                            '참고있어요',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () {
                            _cravedCounter();
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  // ignore: missing_return, missing_return
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8.0)),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            if(total<=10) //반갑 이하
                                               // Image.asset('images/smoke_image_$randNum.png')
                                              Text('${_messages[randNum]}')
                                            else if(10<total&&total<=20)  //반갑이상 한갑미만
                                              Image.asset('images/smoke_image_$randNum.png')
                                            else if(20<total&&total<=40)  //반갑이상 한갑미만
                                                Image.asset('images/smoke_image_d_$randNum.png')
                                            else if(40<total) //두갑이상
                                                Image.asset('images/smoke_image_dd_$randNum.png')

                                            //Text('${_messages[randNum]}'),
                                            //show(total, randNum);
                                            //Text('random: $randNum'), //렌덤넘버 숫자 확인
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('ok'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            randNum = Random().nextInt(3);
                                          },
                                        ),
                                      ],
                                    );
                                });
                          }),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),
                  Flexible(child: _totalField
                    //   TextField(
                    //   decoration: InputDecoration(labelText: '개수 변경',),
                    // ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  ),
                  Container(
                    width: 70,
                    height: 55,
                    child: RaisedButton(
                        child: Text('변경', style: TextStyle(color: Colors.white)),
                        color: Colors.indigoAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () {
                          setState(() {
                            total = int.parse(_totalFieldController.text);
                            saved = total*225;
                          });
                          // total = int.parse(_totalFieldController.text);
                          // print(_totalFieldController.text);
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeText(String title, {double width, double height}) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 23.0),
        ),
      ),
      width: width,
      height: height,
      //decoration: BoxDecoration(color: Colors.red[300]),
      margin: EdgeInsets.all(10.0),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _totalFieldController.dispose();
    super.dispose();
  }
}




