import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'document_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Detail extends StatefulWidget {

  int index;
  DocumentSnapshot keyword = null;
  String category = null;
  Stream<QuerySnapshot> curStrm = null;


  Detail({this.index, this.keyword, this.category, this.curStrm});

  @override

  _DetailState createState() => _DetailState();
}


class _DetailState extends State<Detail> {
  List<String> info_list = ['수업','랩실','언어','평점','교재','부교재','교수','행사','트랙',];
  List<String> coll_name = ['class', 'lab', 'language', 'review', 'textbook', 'subtextbook', 'teaching', 'event', 'track'];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController TextController = TextEditingController();
  FocusNode textFocusNode;
  //SharedPreferences prefs = await SharedPreferences.getInstance();


  @override
  void initState() {
    super.initState();

    //textFocusNode = FocusNode();
    _save();

  }

  _save() async {
    print('함수들어옴');
    SharedPreferences temp;
    temp = await SharedPreferences.getInstance();

    print('함수들어옴');
    print(temp);
    print('아잉');
    print(widget.keyword);
    print('keyword확인 $temp ');
    await temp.setInt('save', temp);
  }



  Widget build(BuildContext context) {
    _save();
    print('함수완료');
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    DocumentSnapshot temp;

    print('index');
    print(widget.index);
    print('keyword');
    print(widget.keyword);
    print('category');
    print(widget.category);


    switch(widget.index){
      case 0:
        if(temp == null) widget.curStrm = firestore.collection(coll_name[widget.index]).snapshots();
        else if(widget.category == 'class_name') widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp['class_name']).snapshots();
        else widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp['class_code']).snapshots();
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text(info_list[widget.index].toString())),
            body: Container(
                child: StreamBuilder(
                  stream: widget.curStrm,
                  builder: (context, snapshot) {
                    if(snapshot.hasError) return Text("Error: ${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text("Loading");
                      default:
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            SizedBox(
                              height: height * 0.2,
                              child: Column( // 검색 기능
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          child: DropdownButton(
                                            value: temp,
                                            // isDense: true,
                                            hint: Text('Select'),
                                            onChanged: (DocumentSnapshot newVal){
                                              setState(() {
                                                temp = newVal;
                                                print(temp);
                                                print('확인' + temp['class_code']);
                                                _save();
                                                print('확인of확' + temp['class_code']);
                                              });
                                            },
                                            items: documents.map((DocumentSnapshot map) {
                                              return DropdownMenuItem<DocumentSnapshot>(
                                                value: map,
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Text(map['class_name']),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          )
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      RaisedButton( // to 교재
                                        textColor: Colors.black,
                                        color: Color.fromARGB(250, 255, 255, 255),
                                        child: Text("교재"),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Detail(
                                                    index: 4, keyword: temp, category: 'class_code',
                                                  )
                                              )
                                          );
                                        },

                                      ),
                                      RaisedButton( // to 부교재
                                        textColor: Colors.black,
                                        color: Color.fromARGB(250, 255, 255, 255),
                                        child: Text("부교재"),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Detail(
                                                    index: 5, keyword: temp, category: 'class_code',
                                                  )
                                              )
                                          );
                                        },

                                      ),
                                      RaisedButton( // to 언어
                                        textColor: Colors.black,
                                        color: Color.fromARGB(250, 255, 255, 255),
                                        child: Text("언어"),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Detail(
                                                    index: 2, keyword: temp, category: 'class_code',
                                                  )
                                              ),
                                          );
                                          _save();
                                        },
                                      ),
                                      RaisedButton( // to 교수
                                        textColor: Colors.black,
                                        color: Color.fromARGB(250, 255, 255, 255),
                                        child: Text("교수님"),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Detail(
                                                    index: 6, keyword: temp, category: 'teaching', //class_code
                                                  )
                                              )
                                          );
                                        },

                                      ),
                                      RaisedButton( // to 트랙
                                        textColor: Colors.black,
                                        color: Color.fromARGB(250, 255, 255, 255),
                                        child: Text("트랙"),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Detail(
                                                    index: 8, keyword: temp, category: 'class_code',
                                                  )
                                              )
                                          );
                                        },

                                      ),
                                      RaisedButton( // to 언어
                                        textColor: Colors.black,
                                        color: Color.fromARGB(250, 255, 255, 255),
                                        onPressed: () {
                                          _save();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Detail(
                                                    index: 2, keyword: temp, category: 'language',
                                                  )
                                              )
                                          );
                                          _save();
                                        },

                                      ),
                                      RaisedButton( // to 평점
                                        textColor: Colors.black,
                                        color: Color.fromARGB(250, 255, 255, 255),

                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Detail(
                                                    index: 3, keyword: temp, category: 'review',
                                                  )
                                              )
                                          );
                                        },

                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: documents.map((eachDocument) => DocumentView(eachDocument,widget.index)).toList(),
                              ),
                            ),

                          ],
                        );
                    }


                  },
                )
            )
        );
        break;

      case 1: // Lab
      /*
      if(temp == null) widget.curStrm = firestore.collection(coll_name[widget.index]).snapshots();
        else if(widget.category == 'class_name') widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp['class_name']).snapshots();
        else widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp['class_code']).snapshots();
       */
        if(temp == null) widget.curStrm = firestore.collection(coll_name[widget.index]).snapshots();
        else widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[0]).snapshots();
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text(info_list[widget.index].toString())),
            body: Container(
                child: StreamBuilder(
                  stream: widget.curStrm,
                  builder: (context, snapshot) {
                    if(snapshot.hasError) return Text("Error: ${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text("Loading");
                      default:
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            SizedBox(
                              height: height * 0.2,
                              child: Column( // 검색 기능
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          child: DropdownButton(
                                            value: temp,
                                            // isDense: true,
                                            hint: Text('Select'),
                                            onChanged: (DocumentSnapshot newVal){
                                              setState(() {
                                                temp = newVal;
                                                print('확인_temp' + temp[0]);
                                                print('확인_newVal' + newVal[0]);
                                              });
                                            },
                                            items: documents.map((DocumentSnapshot map) {
                                              return DropdownMenuItem<DocumentSnapshot>(
                                                value: map,
                                                child: Container(
                                                  child: Text(map['prof_name']),
                                                ),
                                              );
                                            }).toList(),
                                          )
                                      ),
                                    ],

                                  ),
                                  Row(
                                      children: [
                                        RaisedButton( // to 교수님
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("교수님"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 6, keyword: temp, category: 'teaching',
                                                    )
                                                )
                                            );
                                          },

                                        ),
                                        RaisedButton( // to 평점
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("평점"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 3, keyword: temp, category: 'review',
                                                    )
                                                )
                                            );
                                          },

                                        ),
                                      ]
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: documents.map((eachDocument) => DocumentView(eachDocument,widget.index)).toList(),
                              ),
                            ),

                          ],
                        );
                    }


                  },
                )
            )
        );
        break;

      case 2: //언어
        if(temp == null) widget.curStrm = firestore.collection(coll_name[widget.index]).snapshots();
        else widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[0]).snapshots();
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text(info_list[widget.index].toString())),
            body: Container(
                child: StreamBuilder(
                  stream: widget.curStrm,
                  builder: (context, snapshot) {
                    if(snapshot.hasError) return Text("Error: ${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text("Loading");
                      default:
                        temp = widget.keyword;
                        print(temp);
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            SizedBox(
                              height: height * 0.2,
                              child: Column( // 검색 기능
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          child: DropdownButton(
                                            value: temp,
                                            hint: Text('Select'),
                                            onChanged: (DocumentSnapshot newVal){
                                              setState(() {
                                                temp = newVal;
                                              });
                                            },
                                            items: documents.map((DocumentSnapshot map) {
                                              return DropdownMenuItem<DocumentSnapshot>(
                                                value: map,
                                                child: Container(
                                                  child: Text(map['class_code']+' '+map['language']),
                                                ),
                                              );
                                            }).toList(),

                                          )
                                      ),
                                    ],
                                  ),
                                  Row(
                                      children: [
                                        RaisedButton( // to 수업
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("수업"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 0, keyword: temp, category: 'class',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                      ]
                                  )

                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: documents.map((eachDocument) => DocumentView(eachDocument,widget.index)).toList(),
                              ),
                            ),

                          ],
                        );
                    }


                  },
                )
            )
        );
        break;

      case 3: //평점
        if(temp == null) widget.curStrm = firestore.collection(coll_name[widget.index]).snapshots();
        else if(widget.category == 'class_name') widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[1]).snapshots();
        else widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[0]).snapshots();
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text(info_list[widget.index].toString())),
            body: Container(
                child: StreamBuilder(
                  stream: widget.curStrm,
                  builder: (context, snapshot) {
                    if(snapshot.hasError) return Text("Error: ${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text("Loading");
                      default:
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            SizedBox(
                              height: height * 0.2,
                              child: Column( // 검색 기능
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          child: DropdownButton(
                                            value: temp,
                                            // isDense: true,
                                            hint: Text('Select'),
                                            onChanged: (DocumentSnapshot newVal){
                                              setState(() {
                                                temp = newVal;
                                                print('확인' + temp['class_name']);
                                              });
                                              temp = newVal;
                                              print('out setState:'+temp['class_name']);
                                            },
                                            items: documents.map((DocumentSnapshot map) {
                                              return DropdownMenuItem<DocumentSnapshot>(
                                                value: map,
                                                child: Container(
                                                  child: Text(map['prof_name']+' '+map['class_name']),
                                                ),
                                              );
                                            }).toList(),

                                          )
                                      ),
                                    ],
                                  ),
                                  Row(
                                      children: [
                                        RaisedButton( // to 랩실
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("랩실"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 1, keyword: temp, category: 'prof_name',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                        RaisedButton( // to 평점
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("수업"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 0, keyword: temp, category: 'class_name',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                      ]
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: documents.map((eachDocument) => DocumentView(eachDocument,widget.index)).toList(),
                              ),
                            ),
                          ],
                        );
                    }
                  },
                )
            )
        );
        break;

      case 4: //교재
        if(temp == null) widget.curStrm = firestore.collection(coll_name[widget.index]).snapshots();
        else if(widget.category == 'class_name') widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[1]).snapshots();
        else widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[0]).snapshots();
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text(info_list[widget.index].toString())),
            body: Container(
                child: StreamBuilder(
                  stream: widget.curStrm,
                  builder: (context, snapshot) {
                    if(snapshot.hasError) return Text("Error: ${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text("Loading");
                      default:
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            SizedBox(
                              height: height * 0.2,
                              child: Column( // 검색 기능
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          child: DropdownButton(
                                            value: temp,
                                            // isDense: true,
                                            hint: Text('Select'),
                                            onChanged: (DocumentSnapshot newVal){
                                              setState(() {
                                                temp = newVal;
                                                //print('확인' + temp['class_name']);
                                              });
                                              temp = newVal;
                                              //print('out setState:'+temp['class_name']);
                                            },
                                            items: documents.map((DocumentSnapshot map) {
                                              return DropdownMenuItem<DocumentSnapshot>(
                                                value: map,
                                                child: Container(
                                                  child: Text(map['book_name']),
                                                ),
                                              );
                                            }).toList(),

                                          )
                                      ),
                                    ],
                                  ),
                                  Row(
                                      children: [
                                        RaisedButton( // to 평점
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("수업"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 0, keyword: temp, category: 'class',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                      ]
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: documents.map((eachDocument) => DocumentView(eachDocument,widget.index)).toList(),
                              ),
                            ),
                          ],
                        );
                    }
                  },
                )
            )
        );
        break;

      case 5: //평점
        if(temp == null) widget.curStrm = firestore.collection(coll_name[widget.index]).snapshots();
        else if(widget.category == 'class_name') widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[1]).snapshots();
        else widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[0]).snapshots();
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text(info_list[widget.index].toString())),
            body: Container(
                child: StreamBuilder(
                  stream: widget.curStrm,
                  builder: (context, snapshot) {
                    if(snapshot.hasError) return Text("Error: ${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text("Loading");
                      default:
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            SizedBox(
                              height: height * 0.2,
                              child: Column( // 검색 기능
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          child: DropdownButton(
                                            value: temp,
                                            // isDense: true,
                                            hint: Text('Select'),
                                            onChanged: (DocumentSnapshot newVal){
                                              setState(() {
                                                temp = newVal;
                                                print('확인' + temp['class_name']);
                                              });
                                              temp = newVal;
                                              print('out setState:'+temp['class_name']);
                                            },
                                            items: documents.map((DocumentSnapshot map) {
                                              return DropdownMenuItem<DocumentSnapshot>(
                                                value: map,
                                                child: Container(
                                                  child: Text(map['prof_name']+' '+map['class_name']),
                                                ),
                                              );
                                            }).toList(),

                                          )
                                      ),
                                    ],
                                  ),
                                  Row(
                                      children: [
                                        RaisedButton( // to 랩실
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("랩실"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 1, keyword: temp, category: 'prof_name',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                        RaisedButton( // to 평점
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("수업"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 0, keyword: temp, category: 'class_name',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                      ]
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: documents.map((eachDocument) => DocumentView(eachDocument,widget.index)).toList(),
                              ),
                            ),
                          ],
                        );
                    }
                  },
                )
            )
        );
        break;

      case 6: //평점
        if(temp == null) widget.curStrm = firestore.collection(coll_name[widget.index]).snapshots();
        else if(widget.category == 'class_name') widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[1]).snapshots();
        else widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[0]).snapshots();
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text(info_list[widget.index].toString())),
            body: Container(
                child: StreamBuilder(
                  stream: widget.curStrm,
                  builder: (context, snapshot) {
                    if(snapshot.hasError) return Text("Error: ${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text("Loading");
                      default:
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            SizedBox(
                              height: height * 0.2,
                              child: Column( // 검색 기능
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          child: DropdownButton(
                                            value: temp,
                                            // isDense: true,
                                            hint: Text('Select'),
                                            onChanged: (DocumentSnapshot newVal){
                                              setState(() {
                                                temp = newVal;
                                                print('확인' + temp['class_name']);
                                              });
                                              temp = newVal;
                                              print('out setState:'+temp['class_name']);
                                            },
                                            items: documents.map((DocumentSnapshot map) {
                                              return DropdownMenuItem<DocumentSnapshot>(
                                                value: map,
                                                child: Container(
                                                  child: Text(map['prof_name']+' '+map['class_name']),
                                                ),
                                              );
                                            }).toList(),

                                          )
                                      ),
                                    ],
                                  ),
                                  Row(
                                      children: [
                                        RaisedButton( // to 랩실
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("랩실"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 1, keyword: temp, category: 'prof_name',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                        RaisedButton( // to 평점
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("수업"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 0, keyword: temp, category: 'class_name',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                      ]
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: documents.map((eachDocument) => DocumentView(eachDocument,widget.index)).toList(),
                              ),
                            ),
                          ],
                        );
                    }
                  },
                )
            )
        );
        break;

      case 7: //평점
        if(temp == null) widget.curStrm = firestore.collection(coll_name[widget.index]).snapshots();
        else if(widget.category == 'class_name') widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[1]).snapshots();
        else widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[0]).snapshots();
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text(info_list[widget.index].toString())),
            body: Container(
                child: StreamBuilder(
                  stream: widget.curStrm,
                  builder: (context, snapshot) {
                    if(snapshot.hasError) return Text("Error: ${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text("Loading");
                      default:
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            SizedBox(
                              height: height * 0.2,
                              child: Column( // 검색 기능
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          child: DropdownButton(
                                            value: temp,
                                            // isDense: true,
                                            hint: Text('Select'),
                                            onChanged: (DocumentSnapshot newVal){
                                              setState(() {
                                                temp = newVal;
                                                print('확인' + temp['class_name']);
                                              });
                                              temp = newVal;
                                              print('out setState:'+temp['class_name']);
                                            },
                                            items: documents.map((DocumentSnapshot map) {
                                              return DropdownMenuItem<DocumentSnapshot>(
                                                value: map,
                                                child: Container(
                                                  child: Text(map['prof_name']+' '+map['class_name']),
                                                ),
                                              );
                                            }).toList(),

                                          )
                                      ),
                                    ],
                                  ),
                                  Row(
                                      children: [
                                        RaisedButton( // to 랩실
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("랩실"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 1, keyword: temp, category: 'prof_name',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                        RaisedButton( // to 평점
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("수업"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 0, keyword: temp, category: 'class_name',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                      ]
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: documents.map((eachDocument) => DocumentView(eachDocument,widget.index)).toList(),
                              ),
                            ),
                          ],
                        );
                    }
                  },
                )
            )
        );
        break;

      case 8: //평점
        if(temp == null) widget.curStrm = firestore.collection(coll_name[widget.index]).snapshots();
        else if(widget.category == 'class_name') widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[1]).snapshots();
        else widget.curStrm = firestore.collection(coll_name[widget.index]).where(widget.category,isEqualTo: temp[0]).snapshots();
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(title: Text(info_list[widget.index].toString())),
            body: Container(
                child: StreamBuilder(
                  stream: widget.curStrm,
                  builder: (context, snapshot) {
                    if(snapshot.hasError) return Text("Error: ${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Text("Loading");
                      default:
                        List<DocumentSnapshot> documents = snapshot.data.docs;
                        return Column(
                          children: [
                            SizedBox(
                              height: height * 0.2,
                              child: Column( // 검색 기능
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          child: DropdownButton(
                                            value: temp,
                                            // isDense: true,
                                            hint: Text('Select'),
                                            onChanged: (DocumentSnapshot newVal){
                                              setState(() {
                                                temp = newVal;
                                                print('확인' + temp['class_name']);
                                              });
                                              temp = newVal;
                                              print('out setState:'+temp['class_name']);
                                            },
                                            items: documents.map((DocumentSnapshot map) {
                                              return DropdownMenuItem<DocumentSnapshot>(
                                                value: map,
                                                child: Container(
                                                  child: Text(map['prof_name']+' '+map['class_name']),
                                                ),
                                              );
                                            }).toList(),

                                          )
                                      ),
                                    ],
                                  ),
                                  Row(
                                      children: [
                                        RaisedButton( // to 랩실
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("랩실"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 1, keyword: temp, category: 'prof_name',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                        RaisedButton( // to 평점
                                          textColor: Colors.black,
                                          color: Color.fromARGB(250, 255, 255, 255),
                                          child: Text("수업"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Detail(
                                                      index: 0, keyword: temp, category: 'class_name',
                                                    )
                                                )
                                            );
                                          },
                                        ),
                                      ]
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                children: documents.map((eachDocument) => DocumentView(eachDocument,widget.index)).toList(),
                              ),
                            ),
                          ],
                        );
                    }
                  },
                )
            )
        );
        break;
    }
  }
}