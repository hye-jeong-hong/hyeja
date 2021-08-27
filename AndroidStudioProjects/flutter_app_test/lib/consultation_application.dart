import 'package:flutter/material.dart';
import 'package:flutter_app_test/medical_consultation.dart';
import 'package:intl/intl.dart';

class ConsultationApplication extends StatefulWidget {
  List<String> MemberName;
  List<String> hospital_name;
  ConsultationApplication({this.MemberName, this.hospital_name});

  @override
  _ConsultationApplicationState createState() => _ConsultationApplicationState();
}

class _ConsultationApplicationState extends State<ConsultationApplication> {
  final isSelected = <bool>[false, false, false, false];
  String result = '';
  String _selectedTime;
  DateTime _selectedDate;
  String formattedDate;
  int index_check = 0;
  String info_temp = '';
  List<String> consultation_method = [];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.blue[400],
        ),
        toolbarHeight: 170,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple[100],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('안녕하세요 ' + widget.MemberName[0] + '님\u{1F49C}',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text('After Me와 함께\n쉽고 빠른 예약 시스템을 경험해보세요!',
                              style: TextStyle(color: Colors.indigo, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:40, left: 20),
            child: Text('\u{1F50E} 원하시는 상담 방식을 선택해주세요',
              style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++){
                    if(buttonIndex==index){
                      isSelected[buttonIndex] = true;
                      index_check = index;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('직접 방문'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('전화'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('화상 통화'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('1:1 채팅'),

                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 20),
            child: Text('\u{1F4C5} 상담 가능한 날짜를 선택해주세요',
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: RaisedButton(
                  child: Text('날짜 선택하기'),
                  color: Colors.deepPurple[300],
                  textColor: Colors.white,
                  onPressed: () {
                    print(index_check);
                    if(index_check == 0){
                      info_temp = '직접 방문';
                    } else if (index_check == 1) {
                      info_temp = '전화';
                    } else if (index_check == 2) {
                      info_temp = '화상 통화';
                    } else {
                      info_temp = '1:1 채팅';
                    }
                    print('상담 데이터 확인 '  + info_temp);
                    Future<DateTime> future = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                        builder: (BuildContext context, Widget child){
                          return Theme(
                            data: ThemeData.dark(),
                            child: child,
                          );
                        });
                    future.then((date) {
                      setState(() {
                        _selectedDate = date;
                        result = _selectedDate.toString();
                        result = DateFormat('yyyy-MM-dd').format(_selectedDate);
                        print(result);
                      });
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text('  선택하신 날짜는 ' + result + ' 입니다'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:40, left: 20),
            child: Text('\u{1F551} 선택하신 날짜에 가능한 시간을 선택해주세요',
              style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: RaisedButton(
                  child: Text('시간 설정하기'),
                  color: Colors.deepPurple[300],
                  textColor: Colors.white,
                  onPressed: () {
                    Future<TimeOfDay> future = showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    future.then((timeOfDay) {
                      setState(() {
                        if (timeOfDay == null) {
                          _selectedTime = null;
                        } else {
                          _selectedTime = '${timeOfDay.hour}:${timeOfDay.minute}';
                        }
                      });
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text('  선택하신 시간은 $_selectedTime 입니다'),
              ),
            ],
          ),
          if(isSelected!=null&&_selectedDate!=null&&_selectedTime!=null)
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Column(
                    children: [
                      Text('아래 버튼을 눌러주세요'),
                      SizedBox(height: 10,),
                      Container(
                          height: 50,
                          width: 150,
                          child: OutlineButton(
                            child: Text('상담 예약 완료',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            borderSide: BorderSide(color: Colors.deepPurple, width: 3.0),
                            onPressed: () {
                              showAlertDialog(context);
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              )
          else
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(child: Text('모든 설문을 완료해주세요', style: TextStyle(color: Colors.deepPurple),)),
            ),
        ],
      ),
    );
  }
  void showAlertDialog(BuildContext context) async {

    consultation_method = [];
    consultation_method.add(info_temp);
    consultation_method.add(result.toString());
    consultation_method.add(_selectedTime.toString());


    String result_message = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('After Me'),
            content: Text("상담 예약 신청이 완료되었습니다. 병원 측에서 After Me에 등록된 회원님의 전화번호로 상담관련 메세지가 발송될 예정입니다."),
            actions: [
              FlatButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MedicalConsultation(consultation_method: consultation_method, hospital_name: widget.hospital_name)));
                  //Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}
