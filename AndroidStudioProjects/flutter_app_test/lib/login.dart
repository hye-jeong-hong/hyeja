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
  List<String> Member_face_lifting = ['등록된 정보가 없습니다'];  //사용자가 수술 정보 입력 전 해당 메세지가 뜨도록 설정
  String temp = '';
  bool login = false;

  signIn(String mobileNum, String pass) async {

    Map login_data =
    {
      "mobileNum": mobileNum.toString(),
      "pass": pass.toString(),
    };
    login_data = login_data.cast<String, dynamic>();
    print(login_data);

    final response = await http.post(Uri.parse('http://3.35.67.179:3300/patient/login'),
      body: jsonEncode(login_data),
      headers: {'Content-Type': 'application/json'},
    );

    Map<String, dynamic> data_2 = json.decode(response.body.toString());
    print(data_2);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("통신 완료");
      print(response.body);
      if(data_2['ok'] == true){
        login = true;
        MemberName = [];
        MemberName.add(data_2['patient']['name'].toString());
        print("로그인 성공");
      }
      print(data_2);

    } else if(response.statusCode == 504){
      print('서버와의 연결이 불안정합니다.');
    } else {
      print('코드가 올바르지 않습니다');
      throw Exception('Failed to contect Server');
    }
    return login;
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              Image.asset('images/Logo_2.png'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
              SizedBox(height: 10),
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
                  signIn(id, password);
                },
              ),
              ButtonBar(
                children: [
                  FlatButton(
                    padding: const EdgeInsets.only(top: 50.0, right: 120),
                    child: Text('회원가입 하러가기'),
                    onPressed: () {
                      _mobileController.clear();
                      _passwordController.clear();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                  ),
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
                        //signIn(id, password);
                        setState(() {
                          _isLoading = true;
                        });
                        if(login==true){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home(MemberName: MemberName)));
                        } else {
                          showAlertDialog(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('로그인 실패'),
            content: Text("아이디 혹은 비밀번호가 일치하지 않습니다.\n다시 시도해주세요!",
                style: TextStyle(fontSize: 13)),
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