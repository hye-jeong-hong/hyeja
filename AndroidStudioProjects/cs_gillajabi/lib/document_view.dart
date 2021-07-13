import 'main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'document_view.dart';

class DocumentView extends StatelessWidget {
  final DocumentSnapshot documentData;
  int index;

  DocumentView(this.documentData, this.index);

  @override
  Widget build(BuildContext context) {
    switch (index){
    // ['Class', 'LAB', 'Language', 'Review', 'Textbook', 'Subtextbook', 'TEACHING', 'event', 'track'];
    // Class
      case 0:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(
              title: Text(documentData['class_name'].toString()),
              subtitle: Row(
                children: [
                  Text(documentData['class_code'].toString()),
                ],
              ),

            ),
          ),
        );
        break;

    //  LAB
      case 1:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(
              title: Text(documentData['lab_name'].toString()),
              subtitle: Row(
                children: [
                  Text(documentData['prof_name'].toString()),
                  Text('  '+documentData['lab_address'].toString()),
                ],
              ),

            ),
          ),
        );
        break;

    //  Language
      case 2:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(
              title: Text(documentData['class_code'].toString()),
              subtitle: Row(
                children: [
                  Text(documentData['language'].toString()),
                ],
              ),

            ),
          ),
        );
        break;

    //  Review
      case 3:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(
              title: Text(documentData['class_name'].toString()),
              subtitle: Row(
                children: [
                  Text(documentData['prof_name'].toString()),
                  Text('  '+documentData['rate'].toString()),
                ],
              ),
            ),
          ),
        );
        break;

    //  Textbook
      case 4:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(
              title: Text(documentData['class_code'].toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(documentData['book_name'].toString()),
                  Text(documentData['author'].toString()),
                  Text(documentData['publisher'].toString()),
                  Text(documentData['price'].toString()),
                ],
              ),

            ),
          ),
        );
        break;

    // Subtextbook
      case 5:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(
              title: Text(documentData['class_code'].toString()),
              subtitle: Row(
                children: [
                  Text(documentData['class_name'].toString()),
                ],
              ),
            ),
          ),
        );
        break;

    //  TEACHING
      case 6:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(
              title: Text(documentData['prof_name'].toString()),
              subtitle: Row(
                children: [
                  Text(documentData['class_code'].toString()),
                ],
              ),

            ),
          ),
        );
        break;

    //  event
      case 7:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(
              title: Text(documentData['event_name'].toString()),
              subtitle: Row(
                children: [
                  Text(documentData['language'].toString()),
                  Text(' '+documentData['event_as_date'].toString()),
                  Text(documentData['event_ae_date'].toString()),
                  Text(documentData['event_sdate'].toString()),
                  Text(documentData['event_edate'].toString()),
                ],
              ),

            ),
          ),
        );
        break;

    //  track
      case 8:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ListTile(
              title: Text(documentData['class_name'].toString()),
              subtitle: Row(
                children: [
                  Text(documentData['track_name'].toString()),
                  Text(documentData['class_code'].toString()),
                  Text(documentData['spring_semester'].toString()),
                  Text(documentData['fall_semester'].toString()),
                ],
              ),
            ),
          ),
        );
        break;
    }
  }
}

/*
class DocumentView extends StatefulWidget {
  int index;
  final DocumentSnapshot documentData;
  DocumentView(this.documentData, this.index);
  @override
  _DocumentViewState createState() => _DocumentViewState();
}

class _DocumentViewState extends State<DocumentView> {

  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";


  _SearchScreenState(){
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  Widget _buildBody(BuildContext context) {
      return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('movie').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot){
    List<DocumentSnapshot> searchResults = [];
    for (DocumentSnapshot d in snapshot) {
      if(d.data.toString().contains(_searchText)) {
        searchResults.add(d);
      }
    }
    return Expanded(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1/1.5,
          padding: EdgeInsets.all(3),
          children: searchResults.map((data) => _buildListItem(context)),
        ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
      final movie = Movie.fromSnapshot(data);
      return InkWell(child: Image.network(movie.poster),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<Null>(
          fullscreenDialog: true,
          builder: (BuildContext context) {
            return MyHomePage();
          }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
          ),
          Container(
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Row(
              children: [
                Expanded(flex: 6,
                    child: TextField(
                      focusNode: focusNode,
                      style: TextStyle(
                        fontSize: 15
                      ),
                      autofocus: true,
                      controller: _filter,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white60,
                          size: 20,
                        ),
                        suffixIcon: focusNode.hasFocus
                            ? IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _filter.clear();
                                    _searchText = "";
                                  });
                                },
                            )
                            : Container(),
                        hintText: '검색',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                focusNode.hasFocus
                    ? Expanded(
                        child: FlatButton(
                          child: Text('취소'),
                          onPressed: () {
                            setState(() {
                              _filter.clear();
                              _searchText = "";
                              focusNode.unfocus();
                            });
                          },
                        ),
                      )
                    : Expanded(
                        flex: 0,
                        child: Container(),
                      )
              ],
            ),
          ),
          _buildBody(context)
        ],
      )
    );
  }
}


 */