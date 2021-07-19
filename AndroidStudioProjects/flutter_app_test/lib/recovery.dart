import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/home.dart';
import 'package:image_picker/image_picker.dart';

class RecoveryWrite extends StatefulWidget {
  @override
  _RecoveryWriteState createState() => _RecoveryWriteState();
}

class _RecoveryWriteState extends State<RecoveryWrite> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

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
        title: Text('회복기록',
          style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      body:
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
             child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:10, left: 10),
                    child: Text('정면/우측/좌측\n사진을 올려주세요 :D',
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 20,),
                          imageProfile(),
                          SizedBox(width: 20,),
                          imageProfile(),
                          SizedBox(width: 20,),
                          imageProfile(),
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
                  SizedBox(height: 20,),
                  writeProfile(),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left:250, right:7),
                    child: RaisedButton(
                      //materialTapTargetSize: Size(width: 50, height: 100),
                      child: Text('작성 완료', style: TextStyle(color: Colors.white, fontSize: 15),),
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      onPressed:() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                    ),
                  ),
                ],
              ),
           ),
    );
  }

  Widget imageProfile(){
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _imageFile == null
                ? AssetImage('assets/profile.jfif')
                : FileImage(File(_imageFile.path)),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: ((builder) => bottonSheet()));
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

  Widget bottonSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      child: Column(
        children: [
          Text('Choose Photo',
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
                  takePhoto(ImageSource.camera);
                },
                label: Text('Camera', style: TextStyle(fontSize: 20),),
              ),
              FlatButton.icon(
                icon: Icon(Icons.photo_library, size: 50,),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text('Gallery', style: TextStyle(fontSize: 20),),
              )
            ],
          )
        ],
      )
    );
  }

  takePhoto(ImageSource source) async {
    final prickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = prickedFile;
    });
  }
}