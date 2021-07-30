import 'package:flutter/material.dart';
import 'package:flutter_app_test/home.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Date extends StatefulWidget {
  @override
  _DateState createState() => _DateState();
}


class _DateState extends State<Date> {
  String _selectedDate = '';
  String _dateCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is DateTime) {
        _selectedDate = DateFormat('yyyy/MM/dd').format(args.value).toString();
        print(_selectedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('애프터 미'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('홍길동님이 성형 수술/시술하신\n날짜를 선택해주세요',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 30),
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 4)),
                      DateTime.now().add(const Duration(days: 3))),
                ),
              ),
            ),
            Center(child: Text('선택하신 날짜\n', style: TextStyle(fontSize: 16),)),
            Center(child: Text(_selectedDate, style: TextStyle(fontSize: 14),)),
            Padding(
              padding: const EdgeInsets.only(top:40),
              child: Center(
                child: Container(
                  width: 130,
                  height: 50,
                  child: RaisedButton(
                    //materialTapTargetSize: Size(width: 50, height: 100),
                    child: Text('완료', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed:() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
      }
    }