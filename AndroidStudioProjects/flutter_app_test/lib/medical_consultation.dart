import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_test/consultation_application.dart';
import 'package:flutter_app_test/home.dart';

class MedicalConsultation extends StatefulWidget {
  List<String> MemberName;
  List<String> hospital_name;
  List<String> Member_face_lifting;
  List<String> date;
  MedicalConsultation({this.MemberName, this.hospital_name, this.Member_face_lifting, this.date});
  @override
  _MedicalConsultationState createState() => _MedicalConsultationState();
}

class _MedicalConsultationState extends State<MedicalConsultation> {

  @override
  Widget build(BuildContext context) {

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
                               FlatButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => ConsultationApplication(MemberName: widget.MemberName, hospital_name: widget.hospital_name)));
                                  },
                                  child: Text('상담 예약하러가기 >',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                               ),
                              Center(child: Icon(Icons.warning_amber_rounded, size: 70, color: Colors.deepPurple,)),
                              Center(
                                child: Text('예약된 정보가 없습니다',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
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
                  ],
                )
            ),
          ],
        ),
    );
  }
}