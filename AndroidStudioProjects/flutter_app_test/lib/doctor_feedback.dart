import 'package:flutter/material.dart';

class DoctorFeedback extends StatefulWidget {
  @override
  _DoctorFeedbackState createState() => _DoctorFeedbackState();
}

class _DoctorFeedbackState extends State<DoctorFeedback> {
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
        backgroundColor: Colors.indigo[300],
        title: Text('전문의 피드백',
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0,),
          Card(
            color: Colors.white70,
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 13.0),
            child: ListTile(
              leading: Icon(
                Icons.assignment_turned_in_outlined,
                color: Colors.indigo,
                size: 30,
              ),
              title: Text('첫번째 피드백', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Feedback()));
              },
            ),
          ),
        ],
      )
    );
  }
}

class Feedback extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo[300],
        title: Text('첫번째 피드백',
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text('전문의 피드백 텍스트 데이터', style: TextStyle(fontSize: 20.0, color: Colors.black87),),
              ),
              padding: EdgeInsets.all(20.0),
            ),
          ],
        ),
      ),
    );
  }
}