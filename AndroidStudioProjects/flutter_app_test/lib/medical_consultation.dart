import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_test/consultation_application.dart';
import 'package:flutter_app_test/doctor_feedback.dart';
import 'package:flutter_app_test/home.dart';
import 'package:flutter_app_test/info_select.dart';

class MedicalConsultation extends StatefulWidget {
  List<String> MemberName;
  List<String> hospital_name;
  List<String> Member_face_lifting;
  List<String> date;
  List<String> consultation_method;
  MedicalConsultation({this.MemberName, this.hospital_name, this.Member_face_lifting, this.date, this.consultation_method});
  @override
  _MedicalConsultationState createState() => _MedicalConsultationState();
}

class _MedicalConsultationState extends State<MedicalConsultation> {

  @override
  Widget build(BuildContext context) {
    if(widget.consultation_method == null)
      widget.consultation_method = [];
      (widget.consultation_method).add('등록된 상담 예약 정보가 없습니다');
      (widget.consultation_method).add('');
      (widget.consultation_method).add('');
    if (widget.hospital_name != null)
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10),
                  child: IconButton(icon: Icon(Icons.home_rounded),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home(MemberName: widget.MemberName)));
                    },),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                          child: Container(
                            width: 400,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              borderRadius: BorderRadius.all(Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('나의 병원 정보',
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                                  ),
                                  SizedBox(height: 10,),
                                  Text('전문의 명: ',
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                  Text('병원 명: ' +  widget.hospital_name[0],
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                  Text('병원 대표전화: ',
                                    style: TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20, left: 20),
                        child: Text('전문의와의 상담 예약',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:3, left: 20),
                        child: Text('전문의와 1:1 상담을 통해 나의 회복 상태를 더욱 자세히 공유하고\n직접적인 피드백을 받아보세요!',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                        child: Container(
                          width: 400,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.all(Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if(widget.consultation_method[0] == '등록된 상담 예약 정보가 없습니다')
                                  FlatButton(
                                    onPressed: () {
                                      widget.consultation_method[0] = '';
                                      widget.consultation_method[1] = '';
                                      widget.consultation_method[2] = '';
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => ConsultationApplication(MemberName: widget.MemberName, hospital_name: widget.hospital_name)));
                                      },
                                    child: Text('상담 예약하러가기 >',
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                if(widget.consultation_method[0] == '등록된 상담 예약 정보가 없습니다')
                                  Center(child: Icon(Icons.warning_amber_rounded, size: 70, color: Colors.deepPurple,)),
                                SizedBox(height: 10.0,),
                                if(widget.consultation_method[0] == '등록된 상담 예약 정보가 없습니다')
                                  Center(
                                    child: Text(widget.consultation_method[0],
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                  ),
                                if(widget.consultation_method[0] != '등록된 상담 예약 정보가 없습니다')
                                  Padding(
                                    padding: const EdgeInsets.only(right: 210, left: 10),
                                    child: Text('\u{2714} 병원 상담 예약정보',
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                  ),
                                if(widget.consultation_method[0] != '등록된 상담 예약 정보가 없습니다')
                                  SizedBox(height: 20.0,),
                                if(widget.consultation_method[0] != '등록된 상담 예약 정보가 없습니다')
                                  Center(
                                    child: Text('방식: ' + widget.consultation_method[0],
                                      style: TextStyle(color: Colors.black, fontSize: 15),
                                    ),
                                  ),
                                if(widget.consultation_method[0] != '등록된 상담 예약 정보가 없습니다')
                                  Center(
                                    child: Text('날짜: ' + widget.consultation_method[1],
                                      style: TextStyle(color: Colors.black, fontSize: 15),
                                    ),
                                  ),
                                if(widget.consultation_method[0] != '등록된 상담 예약 정보가 없습니다')
                                  Center(
                                    child: Text('시간: ' + widget.consultation_method[2],
                                      style: TextStyle(color: Colors.black, fontSize: 15),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20, left: 20),
                        child: Text('전문의 피드백',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:3, left: 20),
                        child: Text('전문의에게 공유된 나의 회복 기록 및 복약상황 기록에 대한\n전문의의 피드백입니다',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                        child: Container(
                          width: 400,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.indigo[100],
                            borderRadius: BorderRadius.all(Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 30.0,),
                              Text("\u{1F4E9}", style: TextStyle(fontSize: 50.0),),
                              SizedBox(height: 10.0,),
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => DoctorFeedback()));
                                },
                                child: Text("전문의 피드백 확인하러가기 >", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.indigo),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ],
                  )
              ),
            ],
          ),
      );
    else
      return Scaffold(
        backgroundColor: Colors.orange[100],
        body: Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning_amber_rounded, size: 70, color: Colors.deepOrange),
                  Text('\n등록된 병원 정보가 없습니다', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text('수술 정보를 등록해주셔야 해당 서비스 이용이 가능합니다 :D',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton.icon(
                        icon: Icon(Icons.home, size:30),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home(MemberName: widget.MemberName)));
                        },
                        label: Text('홈으로 돌아가기', style: TextStyle(fontSize: 15),),
                      ),
                      FlatButton.icon(
                        icon: Icon(Icons.info_outline, size:30),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => InfoSelect(MemberName: widget.MemberName)));
                        },
                        label: Text('수술 정보 등록하기', style: TextStyle(fontSize: 15),),
                      ),
                    ],
                  ),
                ],
              ),
        ),
      );
  }
}