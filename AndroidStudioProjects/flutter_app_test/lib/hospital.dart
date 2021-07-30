import 'package:flutter/material.dart';
import 'package:flutter_app_test/date.dart';

class Hospital extends StatefulWidget {
  List<String> MemberName;
  List<String> Member_face_lifting;
  Hospital({this.MemberName, this.Member_face_lifting});

  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  final _hospitalKey = GlobalKey<FormState>();
  String hospital = ' ';
  List<String> hospital_name = [];

  void validateAndSave(List<String> info) {
    final hospital_info = _hospitalKey.currentState;
    if (hospital_info.validate()) {
      hospital_info.save();
      info.add(hospital);
    } else {
      print('병원 이름을 입력해주세요: $hospital');
    }
  }
  @override
  Widget build(BuildContext context) {
    String hospital_info;
    hospital_info = hospital;
    List<String> info = <String>[];
    info.add(hospital);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('After Me'),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Text(widget.MemberName[0] + '님이 성형수술/시술하신\n병원이름을 입력해주세요!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 110),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 70),
            child: TextFormField(
              decoration: InputDecoration(labelText: '병원이름'),
              validator: (value) =>
              value.isEmpty ? '병원이름을 입력해주세요' : null,
              onSaved: (value) => hospital = value,
              onChanged: (value) {
                hospital = value;
              },
            ),
          ),
          SizedBox(height: 100),
          RaisedButton(
            child: Text('다음'),
            color: Colors.orange[300],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            onPressed: () {
              hospital_name.add(hospital.toString());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Date(MemberName: widget.MemberName, Member_face_lifting: widget.Member_face_lifting, hospital_name: hospital_name)));
            },
          )
        ],
      ),
    );
  }
}