import 'package:flutter/material.dart';
import 'package:flutter_app_test/info_select.dart';


class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}



class _loginPageState extends State<loginPage> {
  //final _bloc = regBloc();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
  Widget build(BuildContext context) {
    String id_name;
    id_name = id;
    List<String> info = List<String>();
    info.add(id);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('애프터 미',
            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold,))),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Text('나를 위한 성형 수술 후 관리 애플리케이션', style: TextStyle(fontSize: 15, color: Colors.black)),
                  SizedBox(height: 110),
                  TextFormField(
                    decoration: InputDecoration(labelText: '이름'),
                    validator: (value) =>
                    value.isEmpty ? '이름은 공백일 수 없습니다.' : null,
                    onSaved: (value) => id = value,
                  ),
                  SizedBox(height: 100),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 220,
                        height: 80,
                        child: OutlineButton(
                          child: Text('         성형수술\n사후관리 시작하기',
                              style: TextStyle(fontSize: 18, color: Colors.black)),
                          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 3.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            validateAndSave(info);
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => InfoSelect()));
                          },
                        ),
                      ),
                      SizedBox(height: 20),
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