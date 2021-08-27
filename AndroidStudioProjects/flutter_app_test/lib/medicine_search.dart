import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:convert' show utf8;


Future<Info> getInfo() async {
  final request = await http.get(Uri.parse('http://apis.data.go.kr/1471000/DrbEasyDrugInfoService'
      '/getDrbEasyDrugList?serviceKey=gUm%2Fp1rxF7P4AJxl25lEEc2CJKwIJxNIuZCMQLRzDFeJOa4QW3YTg4qJRqF0hdMltdAcIyKj'
      '%2FlhTqlVVWHN3Tw%3D%3D&startPage=1&itemName=%ED%99%9C%EB%AA%85%EC%88%98&itemName=활명수'),
    headers: {'content-type': 'text/xml'},
  );

  if(request.statusCode == 200 || request.statusCode == 201) {
    print("통신 완료");

    Info result = Info.fromJson(json.decode(request.body));
    var info_2 = utf8.decode(request.bodyBytes);

    print(utf8.decode(request.bodyBytes));
    return Info.fromJson(jsonDecode(jsonDecode(info_2)));
    //return utf8.decode(info_2); //Info.fromJson(jsonDecode(jsonDecode(info_2))); //Info.fromJson(jsonDecode(info_2));
  } else {
    throw Exception("통신 실패");
  }
}

class Info {

  String efcyQesitm;
  String useMethodQesitm;

  Info({
    this.efcyQesitm,
    this.useMethodQesitm,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
        efcyQesitm: json['body']['items'][0]['efcyQesitm'],
        useMethodQesitm: json['body']['items'][0]['useMethodQesitm'],
    );
  }

}
class SearchMedicine extends StatefulWidget {
  @override
  _SearchMedicineState createState() => _SearchMedicineState();
}

class _SearchMedicineState extends State<SearchMedicine> {

  bool check = false;

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
        title: Text('복약 정보 조회',
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Text('복약정보 조회'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Container(
                  width: 250,
                  height: 40,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent[100], width: 2)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrangeAccent[100], width: 2)
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: Container(
                  color: Colors.orange[100],
                  width: 45,
                  height: 40,
                  child: OutlineButton(
                    padding: EdgeInsets.all(0),
                    child: Text('검색'),
                    onPressed: () {
                     //check = true;
                      Container(
                          child: FutureBuilder<Info>(
                            future: getInfo(),
                            builder: (context, snapshot) {
                              if(snapshot.hasData){
                                print('snapshot has data');
                                return Column(
                                  children: [

                                    Text(snapshot.data.efcyQesitm),
                                    Text(snapshot.data.useMethodQesitm),
                                  ],
                                );
                              } else if (snapshot.hasError) {
                                print(snapshot.error);
                              }
                              return CircularProgressIndicator();
                            },
                          )
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          //if(check == true)


          // TextFormField(
          //   decoration: new InputDecoration(
          //     border: InputBorder.none,
          //     focusedBorder: InputBorder.none,
          //     suffixIcon: Icon(Icons.search),
          //     contentPadding: EdgeInsets.only(left: 50, bottom: 5, top: 10, right: 50),
          //     hintText: '복용약에 대한 정보를 조회해보세요'
          //   ),
          // )
        ],
      ),
    );
  }
}