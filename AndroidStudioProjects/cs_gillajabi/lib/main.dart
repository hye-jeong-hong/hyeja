import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  int info = 0;
  MyApp({this.info});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title: const Text('CS 길라잡이', style: TextStyle(
            color: Colors.white
        )),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.08,
              child: Container(),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 60.0 ),
                      //child: Image.asset('cs_gillajabi.png')
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                    child: Row(
                      children: [
                        ButtonTheme(
                            minWidth: width * 0.3,
                            height: (width * 0.3) * 0.8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              child: Text(
                                '수업',
                                style:
                                TextStyle(color: Colors.indigo, fontSize: width * 0.06),
                              ),
                              color: Colors.white,  //Color.fromARGB(255,43,99,247),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(index: 0,)));
                              },
                            )),
                        Expanded(
                          child: Container(),
                        ),
                        ButtonTheme(
                            minWidth: width * 0.3,
                            height: (width * 0.3) * 0.8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              child: Text(
                                '랩실',
                                style:
                                TextStyle(color: Colors.indigo, fontSize: width * 0.06),
                              ),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(index: 1)));
                              },
                            )),
                        Expanded(
                          child: Container(),
                        ),
                        ButtonTheme(
                            minWidth: width * 0.3,
                            height: (width * 0.3) * 0.8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              child: Text(
                                '언어',
                                style:
                                TextStyle(color: Colors.indigo, fontSize: width * 0.06),
                              ),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(index: 2)));
                              },
                            )),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: Row(
                      children: [
                        ButtonTheme(
                            minWidth: width * 0.3,
                            height: (width * 0.3) * 0.8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              child: Text(
                                '평점',
                                style:
                                TextStyle(color: Colors.indigo, fontSize: width * 0.06),
                              ),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(index: 3)));
                              },
                            )),
                        Expanded(
                          child: Container(),
                        ),
                        ButtonTheme(
                            minWidth: width * 0.3,
                            height: (width * 0.3) * 0.8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              child: Text(
                                '교재',
                                style:
                                TextStyle(color: Colors.indigo, fontSize: width * 0.06),
                              ),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(index: 4)));
                              },
                            )),
                        Expanded(
                          child: Container(),
                        ),
                        ButtonTheme(
                            minWidth: width * 0.3,
                            height: (width * 0.3) * 0.8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              child: Text(
                                '부교재',
                                style:
                                TextStyle(color: Colors.indigo, fontSize: width * 0.06),
                              ),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(index: 5)));
                              },
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                    child: Row(
                      children: [
                        ButtonTheme(
                            minWidth: width * 0.3,
                            height: (width * 0.3) * 0.8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              child: Text(
                                '교수',
                                style:
                                TextStyle(color: Colors.indigo, fontSize: width * 0.06),
                              ),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(index: 6)));
                              },
                            )),
                        Expanded(
                          child: Container(),
                        ),
                        ButtonTheme(
                            minWidth: width * 0.3,
                            height: (width * 0.3) * 0.8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              child: Text(
                                '행사',
                                style:
                                TextStyle(color: Colors.indigo, fontSize: width * 0.06),
                              ),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(index: 7)));
                              },
                            )),
                        Expanded(
                          child: Container(),
                        ),
                        ButtonTheme(
                            minWidth: width * 0.3,
                            height: (width * 0.3) * 0.8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              child: Text(
                                '트랙',
                                style:
                                TextStyle(color: Colors.indigo, fontSize: width * 0.06),
                              ),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detail(index: 8)));
                              },
                            )),
                      ],
                    ),
                  ),
                ],

              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.05),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}