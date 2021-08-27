import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/home.dart';
import 'package:image_picker/image_picker.dart';

class RecoveryTest extends StatefulWidget {
  List<String> MemberName;
  List<String> Member_face_lifting;
  List<String> hospital_name;
  List<String> date;
  RecoveryTest({this.MemberName, this.Member_face_lifting, this.hospital_name, this.date});

  @override
  _RecoveryTestState createState() => _RecoveryTestState();
}

class _RecoveryTestState extends State<RecoveryTest> {
  PickedFile _imageFile_1;
  PickedFile _imageFile_2;
  PickedFile _imageFile_3;
  final ImagePicker _picker_1 = ImagePicker();
  final ImagePicker _picker_2 = ImagePicker();
  final ImagePicker _picker_3 = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.white
          ),
          toolbarHeight: 130,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(255, 204, 204, 1),
          title: Text('회복기록작성',
            style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelColor: Colors.indigo,
            unselectedLabelColor: Colors.white,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(18.0))
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(text: '눈'),
              Tab(text: '코'),
              Tab(text: '이마 필러'),
            ],
          ),

        ),
        body: TabBarView(
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: ListView(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: "얼굴"),
                          Tab(text: "코"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10, left: 10),
                        child: Text('정면/우측/좌측\n사진을 올려주세요 :D',
                          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height:  MediaQuery.of(context).size.height * 0.03),
                      Scrollbar(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.height * 0.009,),
                              imageProfile_1(),
                              SizedBox(width: MediaQuery.of(context).size.height * 0.009,),
                              imageProfile_2(),
                              SizedBox(width: MediaQuery.of(context).size.height * 0.009,),
                              imageProfile_3(),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:30, left: 10),
                        child: Text('회복 상태를 적어주세요',
                          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height:  MediaQuery.of(context).size.height * 0.03),
                      writeProfile(),
                      SizedBox(height:  MediaQuery.of(context).size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.only(left:250, right:7),
                        child: RaisedButton(
                          child: Text('작성 완료', style: TextStyle(color: Colors.white, fontSize: 15),),
                          color: Colors.orange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                          onPressed:() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Home(MemberName: widget.MemberName, Member_face_lifting: widget.Member_face_lifting, hospital_name: widget.hospital_name)));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(child: Text('코 성형 회복기록')),
            Container(child: Text('이마 필러 성형 회복기록')),
          ],
        ),
      ),
    );
  }

  Widget imageProfile_1(){
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile_1 == null
                ? AssetImage('assets/profile_1.jfif')
                : FileImage(File(_imageFile_1.path)),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: ((builder) => buttonSheet_1()));
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.redAccent,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageProfile_2(){
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile_2 == null
                ? AssetImage('assets/profile_2.jfif')
                : FileImage(File(_imageFile_2.path)),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: ((builder) => buttonSheet_2()));
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.redAccent,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageProfile_3(){
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile_3 == null
                ? AssetImage('assets/profile_3.jfif')
                : FileImage(File(_imageFile_3.path)),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: ((builder) => buttonSheet_3()));
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.redAccent,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget writeProfile() {
    return TextFormField(
      maxLines: 10,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 176),
          child: Icon(
            Icons.article_outlined,
            color: Colors.deepPurple,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orangeAccent,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget buttonSheet_1() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
        ),
        child: Column(
          children: [
            Text('정면 사진을 등록해주세요 :)',
              style: TextStyle(
                fontSize: 20,
              ),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(
                  icon: Icon(Icons.camera, size:50),
                  onPressed: () {
                    takePhoto_1(ImageSource.camera);
                  },
                  label: Text('Camera', style: TextStyle(fontSize: 20),),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.photo_library, size: 50,),
                  onPressed: () {
                    takePhoto_1(ImageSource.gallery);
                  },
                  label: Text('Gallery', style: TextStyle(fontSize: 20),),
                )
              ],
            )
          ],
        )
    );
  }

  Widget buttonSheet_2() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
        ),
        child: Column(
          children: [
            Text('우측 사진을 등록해주세요 :)',
              style: TextStyle(
                fontSize: 20,
              ),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(
                  icon: Icon(Icons.camera, size:50),
                  onPressed: () {
                    takePhoto_2(ImageSource.camera);
                  },
                  label: Text('Camera', style: TextStyle(fontSize: 20),),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.photo_library, size: 50,),
                  onPressed: () {
                    takePhoto_2(ImageSource.gallery);
                  },
                  label: Text('Gallery', style: TextStyle(fontSize: 20),),
                )
              ],
            )
          ],
        )
    );
  }

  Widget buttonSheet_3() {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
        ),
        child: Column(
          children: [
            Text('좌측 사진을 등록해주세요 :)',
              style: TextStyle(
                fontSize: 20,
              ),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(
                  icon: Icon(Icons.camera, size:50),
                  onPressed: () {
                    takePhoto_3(ImageSource.camera);
                  },
                  label: Text('Camera', style: TextStyle(fontSize: 20)),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.photo_library, size: 50,),
                  onPressed: () {
                    takePhoto_3(ImageSource.gallery);
                  },
                  label: Text('Gallery', style: TextStyle(fontSize: 20),),
                )
              ],
            )
          ],
        )
    );
  }

  takePhoto_1(ImageSource source) async {
    final pickedFile_1 = await _picker_1.getImage(source: source);
    setState(() {
      _imageFile_1 = pickedFile_1;
    });
  }

  takePhoto_2(ImageSource source) async {
    final pickedFile_2 = await _picker_2.getImage(source: source);
    setState(() {
      _imageFile_2 = pickedFile_2;
    });
  }

  takePhoto_3(ImageSource source) async {
    final pickedFile_3 = await _picker_3.getImage(source: source);
    setState(() {
      _imageFile_3 = pickedFile_3;
    });
  }
}
