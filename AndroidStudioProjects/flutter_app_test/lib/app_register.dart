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
  String pass_check;
  List<String> _gender = ['M', 'W'];
  bool isLoading = false;
  ScaffoldMessengerState scaffoldMessengerState;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _pass_checkController = new TextEditingController();
  TextEditingController _mobileController = new TextEditingController();
  TextEditingController _birthController = new TextEditingController();
  TextEditingController _genderController = new TextEditingController();

  List<int> birth_year = [];

  signup(name, pass, mobileNum, birth, gender) async {

    birth = birth.toString() + '-' + '01' + '-' + '01';   //서버에 보낼 앱 사용자의 생년월일 값

    Map data =
    {
      "name": name.toString(),
      "pass": pass.toString(),
      "mobileNum": mobileNum.toString(),
      "birth": birth.toString(),
      "gender": gender.toString(),
    };

    data = data.cast<String, dynamic>();
    final response = await http.post(Uri.parse('http://3.35.67.179:3300/patient'),  //보낼 서버 주소
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    print('response Body: ' + response.body);  //보내지는지 확인

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = json.decode(response.body.toString());
      print("통신 완료");
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

    birth_year = [1960];   // 출생년도의 시작 년도 삽입
    void birth_vlaue() {
      for (int i = 0; i < 1; i++) {
        for (int j = 1961; j < 2020; j++) {  //출생년도 1961 - 2019년도 추가 삽입
          birth_year.add(j);
        }
      }
    }
    birth_vlaue();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                Text('아이디'),
                SizedBox(height: 10,),
                TextFormField(
                  maxLength: 11,
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
                Text('이름'),
                SizedBox(height: 10,),
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
                  child: Text('성별'),
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
                Text('비밀번호'),
                SizedBox(height: 10,),
                TextFormField(
                  maxLength: 6,
                  obscureText: true,
                  controller: _passController,
                  decoration: InputDecoration(
                      labelText: "사용할 PW를 입력해주세요 (최대6자리)",
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
                Text('비밀번호 재입력'),
                SizedBox(height: 10,),
                TextFormField(
                  maxLength: 6,
                  obscureText: true,
                  controller: _pass_checkController,
                  decoration: InputDecoration(
                      labelText: "PW를 한번 더 입력해주세요 ",
                      border: OutlineInputBorder(),
                      hintText: 'PW'
                  ),
                  onSaved: (value) {
                    pass_check = value;
                  },
                  onChanged: (newVal) {
                    setState(() {
                      newVal = _pass_checkController.text;
                      pass_check = newVal;
                    });
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
                          if (pass_check.toString() != pass.toString()) {
                            AlertDialog_pass(context);
                          } else if (pass_check == null || pass == null) {
                            AlertDialog_pass_check(context);
                          } else if (mobileNum == null) {
                            AlertDialog_mobilenum(context);
                          } else if (name == null) {
                            AlertDialog_name(context);
                          } else if (birth == null) {
                            AlertDialog_birth(context);
                          } else if (gender == null) {
                            AlertDialog_gender(context);
                          } else {
                            signup(name, pass, mobileNum, birth, gender);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => loginPage()));
                          }
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }



  //각 항목에 대해서 사용자가 입력하지 않고 완료 버튼을 눌렀을 때 알림창으로 입력 안내

  void AlertDialog_mobilenum(BuildContext context) async{
    String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('회원가입 실패'),
            content: Text("전화번호를 입력해주세요"),
            actions: [
              FlatButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  void AlertDialog_name(BuildContext context) async{
    String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('회원가입 실패'),
            content: Text("이름을 입력해주세요!"),
            actions: [
              FlatButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  void AlertDialog_birth(BuildContext context) async{
    String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('회원가입 실패'),
            content: Text("출생년도를 선택해주세요!"),
            actions: [
              FlatButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  void AlertDialog_gender(BuildContext context) async{
    String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('회원가입 실패'),
            content: Text("성별을 선택해주세요!"),
            actions: [
              FlatButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  void AlertDialog_pass(BuildContext context) async{
    String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('회원가입 실패'),
            content: Text("비밀번호를 다시 입력해주세요!"),
            actions: [
              FlatButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  void AlertDialog_pass_check(BuildContext context) async{
    String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('회원가입 실패'),
            content: Text("비밀번호를 입력해주세요!"),
            actions: [
              FlatButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }
}