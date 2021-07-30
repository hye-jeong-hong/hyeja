import 'package:flutter/material.dart';
import 'package:flutter_app_test/home.dart';
import 'package:flutter_app_test/medicine_home.dart';

enum Time {m, a, e}

class MedicineInfo extends StatefulWidget {
  @override
  _MedicineInfoState createState() => _MedicineInfoState();
}

class _MedicineInfoState extends State<MedicineInfo> {
  Time _time = Time.m;
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
        title: Text('복용 약 기록',
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Padding(
           padding: const EdgeInsets.only(top: 10, right: 210),
           child: Text('내가 복용하는 약은?',
             style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
           ),
         ),
         SizedBox(height: 20,),
         Padding(
           padding: const EdgeInsets.only(right: 220),
           child: Container(
             width: 130,
             height: 50,
             child: TextFormField(
               maxLines: 1,
               decoration: InputDecoration(
                 border: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.black,
                   ),
                 ),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                   color: Colors.orangeAccent,
                   width: 2,
                   ),
                  ),
                ),
              ),
           ),
         ),
         SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.only(top: 20, right: 270, bottom: 10),
           child: Text('약 복용 시간',
             style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
           ),
         ),
         ListTile(
           title: const Text('아침'),
           leading: Radio<Time>(
             value: Time.m,
             groupValue: _time,
             onChanged: (value) {
               setState(() {
                 _time = value;
               });
             },
           ),
         ),
         ListTile(
           title: const Text('점심'),
           leading: Radio<Time>(
             value: Time.a,
             groupValue: _time,
             onChanged: (value) {
               setState(() {
                 _time = value;
               });
             },
           ),
         ),
         SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.only(top: 20, right: 270, bottom: 10),
           child: Text('약 복용 상태',
             style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(top:10, left: 20, right: 20),
           child: TextFormField(
             maxLines: 10,
             keyboardType: TextInputType.multiline,
             decoration: InputDecoration(
               prefixIcon: Padding(
                 padding: const EdgeInsets.only(bottom: 176),
                 child: Icon(
                   Icons.article_outlined,
                   color: Colors.deepPurple,
                 ),
               ),
               border: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.black,
                 ),
               ),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Colors.orangeAccent,
                   width: 2,
                 ),
               ),
             ),
           ),
         ),
         SizedBox(height: 20,),
         Padding(
           padding: const EdgeInsets.only(left:250, right:7),
           child: RaisedButton(
             //materialTapTargetSize: Size(width: 50, height: 100),
             child: Text('작성 완료', style: TextStyle(color: Colors.white, fontSize: 15),),
             color: Colors.orange,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
             onPressed:() {
               Navigator.push(context,
                   MaterialPageRoute(builder: (context) => MedicineHome()));
             },
           ),
         ),
       ],
     ),
    );
  }
}
