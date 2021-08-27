import 'package:flutter/material.dart';

class RecoveryInfoList extends StatefulWidget {
  @override
  _RecoveryInfoListState createState() => _RecoveryInfoListState();
}

class _RecoveryInfoListState extends State<RecoveryInfoList> {
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
        title: Text('회복기록',
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
                Icons.assignment,
                color: Colors.indigo,
                size: 30,
              ),
              title: Text('첫번째 회복기록', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Detail()));
              },
            ),
          ),
          Card(
            color: Colors.white70,
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 13.0),
            child: ListTile(
              leading: Icon(
                Icons.assignment,
                color: Colors.indigo,
                size: 30,
              ),
              title: Text('두번째 회복기록', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            ),
          ),
          Card(
            color: Colors.white70,
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 13.0),
            child: ListTile(
              leading: Icon(
                Icons.assignment,
                color: Colors.indigo,
                size: 30,
              ),
              title: Text('세번째 회복기록', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      )
    );
  }
}

class Detail extends StatelessWidget {

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
        backgroundColor: Color.fromRGBO(255, 204, 204, 1),
        title: Text('나의 회복 기록',
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text('수술 회복 기록 텍스트 데이터', style: TextStyle(fontSize: 20.0, color: Colors.black87),),
              ),
              padding: EdgeInsets.all(20.0),
            ),
          ],
        ),
      ),
    );
  }
}