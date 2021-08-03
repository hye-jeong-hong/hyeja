import 'package:flutter/material.dart';

class MedicineNotification extends StatefulWidget {
  @override
  _MedicineNotificationState createState() => _MedicineNotificationState();
}

class _MedicineNotificationState extends State<MedicineNotification> {
  String result = '';
  String _selectedTime = '';
  String _selectedTime_2 = '';
  String _selectedTime_3 = '';

  bool _test = false;
  bool _test_2 = false;
  bool check =  false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 204, 204, 1),
        title: Text('복용 알림 설정',
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text('홍길동님이 설정에 따라\n푸쉬알림으로 꼼꼼한 복용이 가능합니다 :)',
              style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:40, left: 20),
            child: Text('\u{1F50E} 복용 시간을 설정해주세요',
              style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 40),
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
            padding: const EdgeInsets.only(top: 10, left: 30),
            child: Text('  선택하신 시간은 $_selectedTime 입니다'),
          ),
          SizedBox(height: 20,),
          Center(
            child: RaisedButton(
              child: Text('추가하기'),
              color: Colors.indigo[300],
              onPressed: () {
                check = true;
                setState(() {
                  _test = true;
                });
              }
            ),
          ),
          if(check == true && _test==true)
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40),
              child: RaisedButton(
                child: Text('시간 설정하기'),
                color: Colors.deepPurple[300],
                textColor: Colors.white,
                onPressed: () {

                  Future<TimeOfDay> future = showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  future.then ((timeOfDay) {
                    setState(() {
                      if (timeOfDay == null) {
                        _selectedTime_2 = null;
                      } else {
                        _selectedTime_2 = '${timeOfDay.hour}:${timeOfDay.minute}';
                      }
                    });
                  });
                },
              )
            ),
          if(check == true && _test==true)
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 30),
              child: Text('  선택하신 시간은 $_selectedTime_2 입니다'),
            ),
          if(check == true && _test==true)
            SizedBox(height: 20,),
          if(check == true && _test==true)
            Center(
              child: RaisedButton(
                  child: Text('추가하기'),
                  color: Colors.indigo[300],
                  onPressed: () {
                    setState(() {
                      _test = true;
                    });
                  }
              ),
            ),
          if(_test_2==true)
            Padding(
                padding: const EdgeInsets.only(top: 20, left: 40),
                child: RaisedButton(
                  child: Text('시간 설정하기'),
                  color: Colors.deepPurple[300],
                  textColor: Colors.white,
                  onPressed: () {
                    Future<TimeOfDay> future = showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    future.then ((timeOfDay) {
                      setState(() {
                        if (timeOfDay == null) {
                          _selectedTime_3 = null;
                        } else {
                          _selectedTime_3 = '${timeOfDay.hour}:${timeOfDay.minute}';
                        }
                      });
                    });
                  },
                )
            ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30),
            child: Text('  선택하신 시간은 $_selectedTime_3 입니다'),
          ),
        ],
      ),
    );
  }
}

