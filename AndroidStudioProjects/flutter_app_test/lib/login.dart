import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/home.dart';
import 'package:flutter_app_test/info_select.dart';
import 'package:flutter_app_test/app_register.dart';
import 'package:http/http.dart' as http;

class loginPage extends StatefulWidget {

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  int check = 0;
  List<String> MemberName = [];
  List<String> Member_face_lifting = ['등록된 정보가 없습니다'];
  String temp = '';

  signIn(String mobileNum, String pass) async {
    bool login = false;

    final response = await http.get(Uri.parse('http://3.35.67.179:3300/patient'),
      headers: {'Content-Type': 'application/json'},
    );
    Map<String, dynamic> data = json.decode(response.body.toString());

    final request = await http.post(Uri.parse('http://3.35.67.179:3300/patient/login'),
      body: data.toString(),
    );

    Map<String, dynamic> Member = data;
    print(Member);

    int save = 0;

    for(int i = 0;i<30; i++){
      if(Member['patientList'][i]['mobileNum'] == mobileNum && Member['patientList'][i]['pass'] == pass){
        print(Member['patientList'][i]['mobileNum']);
        print("로그인 성공");
        login = true;
        save = i;
        break;
      } else {
        print("존재하지 않는 아이디입니다");
      }
    }

    temp = Member['patientList'][save]['name'];
    MemberName = [];
    MemberName.add(temp.toString());

    if(login==true){
      check = 1;
    } else {
      check = 0;
    }
    return check;
  }

  bool _isLoading = false;
  var errorMessage;
  final _formKey = GlobalKey<FormState>();
  var _mobileController = TextEditingController();
  var _passwordController = TextEditingController();

  String id = '';
  String password = '';

  void validateAndSave(List<String> info) {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      info.add(id);
    } else {
      print('Form is invalid ID: $id, pw: $password');
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            Image.asset('images/Logo.png'),
            SizedBox(height: 7,),
            TextFormField(
              controller: _mobileController,
              decoration: InputDecoration(
                labelText: 'ID',
              ),
              validator: (value) => value.isEmpty ? 'ID를 입력해주세요' : null,
              keyboardType: TextInputType.text,
              onSaved: (val) {
                id = val;
              },
              onChanged: (newValue) {
                setState(() {
                  newValue =  _mobileController.text;
                  id =  newValue;
                });
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) => value.isEmpty ? '비밀번호를 입력해주세요' : null,
              keyboardType: TextInputType.text,
              onSaved: (val) {
                password = val;
              },
              onChanged: (newValue) {
                setState(() {
                  newValue =  _passwordController.text;
                  password =  newValue;
                });
              },
            ),
            ButtonBar(
              children: [
                FlatButton(
                  padding: const EdgeInsets.only(top: 20.0, right: 120),
                  child: Text('회원가입 하러가기'),
                  onPressed: () {
                    _mobileController.clear();
                    _passwordController.clear();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 20.0, right: 130),
                      width: 220,
                      height: 80,
                      child: OutlineButton(
                        child: Text('Login',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                        borderSide: BorderSide(color: Colors.orangeAccent, width: 3.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        onPressed: () async{
                          setState(() {
                            _isLoading = true;
                          });
                          print(_mobileController.text);
                          print(_passwordController.text);
                          signIn(_mobileController.text, _passwordController.text);
                          print('check 값 확인');
                          print(check);
                          if(check == 1){
                            check = 0;
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Home(MemberName: MemberName, Member_face_lifting: Member_face_lifting)));  //Member_Info: Member_Info
                          } else if(check == 0){
                            print("다시 시도하세요");
                            showAlertDialog(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}

void showAlertDialog(BuildContext context) async{
  String result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그인 실패'),
          content: Text("아이디 혹은 비밀번호가 일치하지 않습니다.\n다시 시도해주세요!"),
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