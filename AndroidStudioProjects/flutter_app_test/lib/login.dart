import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/home.dart';
import 'package:flutter_app_test/info_select.dart';
import 'package:flutter_app_test/newmem_register.dart';


class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}



class _loginPageState extends State<loginPage> {
  //final _bloc = regBloc();
  final _formKey = GlobalKey<FormState>();
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  String id = '';
  String password = '';
  String email = ' ';

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
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'ID',
              ),
              validator: (value) => value.isEmpty ? 'ID를 입력해주세요' : null,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              validator: (value) => value.isEmpty ? '비밀번호를 입력해주세요' : null,
              keyboardType: TextInputType.text,
              //obscureText: true,
            ),
            ButtonBar(
              children: [
                FlatButton(
                  padding: const EdgeInsets.only(top: 20.0, right: 120),
                  child: Text('회원가입 하러가기'),
                  onPressed: () {
                    _usernameController.clear();
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
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => InfoSelect()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}