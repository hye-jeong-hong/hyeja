import 'package:flutter/material.dart';
import 'package:flutter_app_test/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

enum Gender {Man, Woman}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  Gender _gender = Gender.Man;
  String valuechoose;
  List<int> birth_year = [0];


  @override
  Widget build(BuildContext context) {
    void birth_vlaue() {
      for (int i = 0; i<1; i++) {
        for (int j = 1960;j<2020;j++) {
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
              Text('회원가입', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              Text('절차대로 진행해주세요 :D', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              TextFormField(
                controller: _idController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "전화번호를 입력해주세요 (숫자만)",
                    border: OutlineInputBorder(),
                    hintText: 'ID'
                ),
                validator: (String value) {
                  if(value.isEmpty) {
                    return "ID를 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "이름을 입력해주세요",
                  border: OutlineInputBorder(),
                  hintText: '이름'
                ),
                validator: (String value) {
                  if(value.isEmpty) {
                    return "이름을 입력해주세요";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              Text('출생년도'),
              Padding(
                padding: const EdgeInsets.only(top:5),
                child: DropdownButton(
                  hint: Text("출생 년도를 선택하세요"),
                  dropdownColor: Colors.white70,
                  value: valuechoose,
                  items: birth_year.map((newValue) {
                    return DropdownMenuItem(
                      value: newValue.toString(),
                      child: Text(newValue.toString()),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      valuechoose = newValue;
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
                  value: Gender.Man,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text('여자'),
                leading: Radio(
                  value: Gender.Woman,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: "사용할 PW를 입력해주세요",
                    border: OutlineInputBorder(),
                    hintText: 'PW'
                ),
                validator: (String value) {
                  if(value.isEmpty) {
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
                  if(value != _passwordController) {
                    return "PW가 일치하지 않습니다";
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 40,
                    child: OutlineButton(
                      child: Text('완료',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                      borderSide: BorderSide(color: Colors.orangeAccent, width: 3.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
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
