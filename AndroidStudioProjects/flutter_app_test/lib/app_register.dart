import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final _formKey = GlobalKey<FormState>();
  String name, pass, mobileNum, birth, gender;
  List<String> _gender = ['M', 'W'];
  bool isLoading = false;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ScaffoldMessengerState scaffoldMessengerState;

  TextEditingController _idController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _birthController = new TextEditingController();
  TextEditingController _genderController = new TextEditingController();

  List<int> birth_year = [0];

  signup(name, pass, mobileNum, birth, gender) async {

    Map data =
    {
      "name": name.toString(),
      "pass": pass.toString(),
      "mobileNum": mobileNum.toString(),
      "birth": "1991-05-11",//birth.toString(),
      "gender": gender.toString(),
      // "name":"김쁘띠", //name,
      // "pass":"0001", //pass,
      // "mobileNum":"01066666666", //mobileNum,
      // "birth":"1991-05-11", //birth,
      // "gender":"W", //gender
    };

     data = data.cast<String, dynamic>();
     print('data 확인');
     print(data);
    final response = await http.post(Uri.parse('http://3.35.67.179:3300/patient'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    print(response.request);
    print('response Body: ' + response.body);  //보내지는지 확인

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = json.decode(response.body.toString());
      print("통신 완료");
      print(data);

    } else if(response.statusCode == 504){
      print('서버와의 연결이 불안정합니다.');
    } else {
      print('코드가 올바르지 않습니다');
      throw Exception('Failed to contect Server');
    }
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    scaffoldMessengerState = ScaffoldMessenger.of(context);
    void birth_vlaue() {
      for (int i = 0; i < 1; i++) {
        for (int j = 1960; j < 2020; j++) {
          birth_year.add(j);
        }
      }
    }
    birth_year = [0];
    birth_vlaue();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('회원가입',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              Text('절차대로 진행해주세요 :D',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              TextFormField(
                controller: _mobileController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "전화번호를 입력해주세요 (숫자만)",
                    border: OutlineInputBorder(),
                    hintText: 'ID'
                ),
                onSaved: (val) {
                  val =  _mobileController.text;
                  mobileNum =  val;
                },
                onChanged: (newValue) {
                  setState(() {
                    newValue =  _mobileController.text;
                    mobileNum =  newValue;
                  });
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return "ID를 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: "이름을 입력해주세요",
                    border: OutlineInputBorder(),
                    hintText: '이름'
                ),
                onSaved: (val) {
                  val = _nameController.text;
                  name = val;
                },
                onChanged: (newValue) {
                  setState(() {
                    newValue = _nameController.text;
                    name = newValue;
                  });
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return "이름을 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              Text('출생년도'),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: DropdownButton(
                  hint: Text("출생 년도를 선택하세요"),
                  dropdownColor: Colors.white70,
                  value: birth,
                  items: birth_year.map((newValue) {
                    return DropdownMenuItem(
                      value: newValue.toString(),
                      child: Text(newValue.toString()),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _birthController.text = newValue;
                      birth = newValue;
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text('성별을 선택해주세요'),
              ),
              ListTile(
                title: Text('남자'),
                leading: Radio(
                  value: _gender[0],
                  groupValue: gender,
                  onChanged: (value) {
                    _genderController.text = 'M';
                    setState(() {
                      value = _genderController.text;
                      gender = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('여자'),
                leading: Radio(
                  value: _gender[1],
                  groupValue: gender,
                  onChanged: (value) {
                    _genderController.text = 'W';
                    setState(() {
                      value = _genderController.text;
                      gender = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                controller: _passController,
                decoration: InputDecoration(
                    labelText: "사용할 PW를 입력해주세요",
                    border: OutlineInputBorder(),
                    hintText: 'PW'
                ),
                onSaved: (val) {
                  pass = val;
                },
                onChanged: (newValue) {
                  setState(() {
                    newValue = _passController.text;
                    pass = newValue;
                  });
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return "PW를 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "PW를 한번 더 입력해주세요",
                    border: OutlineInputBorder(),
                    hintText: 'PW'
                ),
                validator: (String value) {
                  if (value != _passController) {
                    return "PW가 일치하지 않습니다";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 40,
                    child: OutlineButton(
                      child: Text('완료',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      borderSide: BorderSide(
                          color: Colors.orangeAccent, width: 3.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () async {
                        signup(name, pass, mobileNum, birth, gender);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => loginPage()));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



