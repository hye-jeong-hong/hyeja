import 'package:better_day_ing/quit_smoke.dart';
import 'package:better_day_ing/risk_factor.dart';
import 'package:flutter/material.dart';
import 'package:better_day_ing/survey_list.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

enum Gender { MAN, WOMAN }

class _loginPageState extends State<loginPage> {
  //final _bloc = regBloc();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  //final gen = 0;
  String id = '';
  String password = '';

  //String id_name;

  // SharedPreferences _prefs;
  Gender gender = Gender.MAN;
  int gen = 0;

  /*void initState() {
    super.initState();  // initState()를 사용할 때 반드시 사용해야 한다.
    _loadId();  // 이 함수를 실행한다.
  }

  _loadId() async {
    _prefs = await SharedPreferences.getInstance(); // 캐시에 저장되어있는 값을 불러온다.
    setState(() { // 캐시에 저장된 값을 반영하여 현재 상태를 설정한다.
      // SharedPreferences에 id, pw로 저장된 값을 읽어 필드에 저장. 없을 경우 0으로 대입
      _id = (_prefs.getString('id') ?? '');
      _password = (_prefs.getString('pw') ?? '');
      print(_id); // Run 기록으로 id와 pw의 값을 확인할 수 있음.
      print(_password);
    });
  }*/

  void validateAndSave(List<String> info) {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      info.add(id);
      if (gender == Gender.MAN) {
        gen = 0;
        info.add('남성');
      } else {
        gen = 1;
        info.add('여성');
      }
      print('Form is valid ID: $id, gender: $gender, gen: $gen');
      if (gender == Gender.MAN) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => survey_list_m(info: info)));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => survey_list_f(info: info)));
      }
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => survey_list(gen:gen)));
    } else {
      print('Form is invalid ID: $id, pw: $password');
    }
  }

  /*
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }*/
  @override
  Widget build(BuildContext context) {
    String id_name;
    id_name = id;
    List<String> info = List<String>();
    //info.add(id_name);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.blueAccent,
      ),
      //body: SafeArea(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Column(
                    children: <Widget>[
                      Image.asset('images/better_day.png'),
                      //SizedBox(height: 10),
                      Text('췌장암 위험도 예측 앱'),
                    ],
                  ),
                  SizedBox(height: 80),
                  TextFormField(
                    //controller: _usernameController,
                    decoration: InputDecoration(labelText: '닉네임'),
                    /*
                      validator: (value) {
                        if (value.isEmpty) {
                          return '공백은 허용되지 않습니다.';
                        }
                      },*/
                    validator: (value) =>
                    value.isEmpty ? '닉네임은 공백일 수 없습니다.' : null,
                    onSaved: (value) => id = value,
                  ),
                  //SizedBox(height: 12.0),
                  // TextFormField(
                  //   //controller: _passwordController,
                  //   decoration: InputDecoration(labelText: 'Password'),
                  //   validator: (value) =>
                  //       value.isEmpty ? 'Password는 공백일 수 없습니다.' : null,
                  //   onSaved: (value) => password = value,
                  // ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '성별:   ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      //Text('남자'),
                      Radio(
                        value: Gender.MAN,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                      Text(
                        '남자',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Radio(
                        value: Gender.WOMAN,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                      Text(
                        '여자',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 220,
                        height: 80,
                        child: RaisedButton(
                          child: Text('위험도 예측 시작하기',
                              style: TextStyle(fontSize: 18, color: Colors.white)),
                          color: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            validateAndSave(info);
                            // Navigator.push(context,
                            //     MaterialPageRoute(
                            //         builder: (context) => buttonScreen()));
                          },

                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 220,
                        height: 80,
                        child: RaisedButton(
                          child: Text('금연',
                              style: TextStyle(fontSize: 18, color: Colors.white)),
                          color: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => quit_smoking()));
                          },
                        ),
                      ),
                      Container(
                        width: 220,
                        height: 80,
                        child: RaisedButton(
                          child: Text('세부요소',
                              style: TextStyle(fontSize: 18, color: Colors.white)),
                          color: Colors.indigoAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            validateAndSave(info);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => risk_factor(info: info)));
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}