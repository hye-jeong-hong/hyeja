import 'package:flutter/material.dart';

class CandWidget extends StatefulWidget {
  VoidCallback tab;
  String text;
  int index;
  double width;
  bool answerState;

  CandWidget({this.tab, this.text, this.index, this.width, this.answerState});

  @override
  _CandWidgetState createState() => _CandWidgetState();
}

class _CandWidgetState extends State<CandWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.8,
      height: widget.width * 0.1,
      padding: EdgeInsets.fromLTRB(widget.width * 0.048, widget.width * 0.024,
          widget.width * 0.048, widget.width * 0.024),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Color.fromARGB(255,43,99,247)),
          color: widget.answerState ? Color.fromARGB(255,43,99,247) : Colors.white),
      child: InkWell(
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.width * 0.035,
            color: widget.answerState ? Colors.white : Colors.black,
          ),
        ),
        onTap: () {
          setState(() {
            widget.tab();
            widget.answerState = !widget.answerState;
          });
        },
      ),
    );
  }
}

// class OneCandWidget extends StatefulWidget {
//   VoidCallback tab;
//   String text;
//   int index;
//   double width;
//   List<int> answers;
//   int current_index;
//   bool answerState;
//
//   OneCandWidget(
//       {this.tab,
//       this.text,
//       this.index,
//       this.width,
//       this.answers,
//       this.current_index,
//       this.answerState});
//
//
//
//   @override
//
//   _OneCandWidgetState createState() => _OneCandWidgetState();
// }
//
// class _OneCandWidgetState extends State<OneCandWidget> {
//
//   @override
//
//   // Widget build(BuildContext context) {
//   //   return Container(
//   //     width: widget.width * 0.5,
//   //     height: widget.width * 0.2,
//   //     child: TextFormField(
//   //       onSaved: (value) => widget.answers[widget.current_index] = value as int,
//   //     ),
//   //   );
//   // }
// }